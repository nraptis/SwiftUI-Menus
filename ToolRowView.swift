//
//  ToolRowView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import UIKit
import SwiftUI
import Combine

class ToolRowView: UIView {
    
    var hostingControllerCurrent: UIViewController?
    var hostingControllerPrevious: UIViewController?
    
    var nodesDidChangeNotAnimatedCancellable: AnyCancellable?
    var nodesDidChangeAnimatedStep1Cancellable: AnyCancellable?
    var nodesDidChangeAnimatedStep2Cancellable: AnyCancellable?
    
    let toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay
    let toolRow: ToolRow
    let orientation: Orientation
    init(toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay,
         toolRow: ToolRow,
         orientation: Orientation) {
        self.toolInterfaceLayoutRelay = toolInterfaceLayoutRelay
        self.toolRow = toolRow
        self.orientation = orientation
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = ToolInterfaceTheme._toolbarBackground
        self.clipsToBounds = true
        
        let height = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        hostingControllerCurrent = UIHostingController(rootView: ToolRowViewContent(toolRow: toolRow,
                                                                                    height: height,
                                                                                    orientation: orientation).environment(toolInterfaceLayoutRelay),
                                                       ignoreSafeArea: true)
        
        if let hostingControllerCurrent = hostingControllerCurrent {
            if let hostingView = hostingControllerCurrent.view {
                hostingView.backgroundColor = ToolInterfaceTheme._toolbarBackground
                addSubview(hostingView)
                hostingView.translatesAutoresizingMaskIntoConstraints = false
                addConstraints([
                    hostingView.leftAnchor.constraint(equalTo: self.leftAnchor),
                    hostingView.rightAnchor.constraint(equalTo: self.rightAnchor),
                    hostingView.topAnchor.constraint(equalTo: self.topAnchor),
                    hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
        }
        
        nodesDidChangeNotAnimatedCancellable =
        toolRow.nodesDidChangePublisher_NotAnimated
            .sink { [weak self] _ in
                if let self = self {
                    self.handleNodesDidChange_NotAnimated(orientation: self.orientation)
                }
            }
        
        nodesDidChangeAnimatedStep1Cancellable =
        toolRow.nodesDidChangePublisher_AnimatedStep1
            .sink { [weak self] reversed in
                if let self = self {
                    self.handleNodesDidChange_AnimatedStep1(reversed: reversed,
                                                            orientation: self.orientation)
                }
            }
        
        nodesDidChangeAnimatedStep2Cancellable =
        toolRow.nodesDidChangePublisher_AnimatedStep2
            .sink { [weak self] reversedAndTime in
                if let self = self {
                    self.handleNodesDidChange_AnimatedStep2(reversed: reversedAndTime.0,
                                                            time: reversedAndTime.1,
                                                            orientation: self.orientation)
                }
            }
    }

    func handleNodesDidChange_NotAnimated(orientation: Orientation) {
        
        killPreviousHostingController()
        killCurrentHostingController()
        
        let height = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        hostingControllerCurrent = UIHostingController(rootView: ToolRowViewContent(toolRow: toolRow,
                                                                                    height: height,
                                                                                    orientation: orientation).environment(toolInterfaceLayoutRelay),
                                                       ignoreSafeArea: true)
        if let hostingControllerCurrent = hostingControllerCurrent {
            addSubview(hostingControllerCurrent.view)
            hostingControllerCurrent.view.translatesAutoresizingMaskIntoConstraints = false
            if let hostingView = hostingControllerCurrent.view {
                hostingView.backgroundColor = ToolInterfaceTheme._toolbarBackground
                addConstraints([
                    hostingView.leftAnchor.constraint(equalTo: self.leftAnchor),
                    hostingView.rightAnchor.constraint(equalTo: self.rightAnchor),
                    hostingView.topAnchor.constraint(equalTo: self.topAnchor),
                    hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
        }
    }
    
    func handleNodesDidChange_AnimatedStep1(reversed: Bool,
                                            orientation: Orientation) {
        
        let safeAreaLeft = toolInterfaceLayoutRelay.safeAreaLeft
        let safeAreaRight = toolInterfaceLayoutRelay.safeAreaRight
        
        killPreviousHostingController()
        hostingControllerPrevious = hostingControllerCurrent
        
        let height = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        hostingControllerCurrent = UIHostingController(rootView: ToolRowViewContent(toolRow: toolRow,
                                                                                    height: height,
                                                                                    orientation: orientation).environment(toolInterfaceLayoutRelay),
                                                       ignoreSafeArea: true)
        
        if let hostingControllerCurrent = hostingControllerCurrent {
            
            addSubview(hostingControllerCurrent.view)
            hostingControllerCurrent.view.translatesAutoresizingMaskIntoConstraints = false
            
            if let hostingView = hostingControllerCurrent.view {
                hostingView.backgroundColor = ToolInterfaceTheme._toolbarBackground
                addConstraints([
                    hostingView.leftAnchor.constraint(equalTo: self.leftAnchor),
                    hostingView.rightAnchor.constraint(equalTo: self.rightAnchor),
                    hostingView.topAnchor.constraint(equalTo: self.topAnchor),
                    hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
            
            if let hostingControllerPrevious = hostingControllerPrevious {
                let transformLeft = CGAffineTransformMakeTranslation(-(bounds.width + CGFloat(safeAreaLeft)), 0.0)
                let transformCenter = CGAffineTransform.identity
                let transformRight = CGAffineTransformMakeTranslation(bounds.width + CGFloat(safeAreaRight), 0.0)
                let transformCurrentStart: CGAffineTransform
                let transformPreviousStart = transformCenter
                if reversed {
                    transformCurrentStart = transformLeft
                } else {
                    transformCurrentStart = transformRight
                }
                hostingControllerPrevious.view.transform = transformPreviousStart
                hostingControllerCurrent.view.transform = transformCurrentStart
            }
        }
    }
    
    func handleNodesDidChange_AnimatedStep2(reversed: Bool,
                                            time: CGFloat,
                                            orientation: Orientation) {
        
        let safeAreaLeft = toolInterfaceLayoutRelay.safeAreaLeft
        let safeAreaRight = toolInterfaceLayoutRelay.safeAreaRight
        if let hostingControllerCurrent = hostingControllerCurrent {
            if let hostingControllerPrevious = hostingControllerPrevious {
                let transformLeft = CGAffineTransformMakeTranslation(-(bounds.width + CGFloat(safeAreaLeft)), 0.0)
                let transformCenter = CGAffineTransform.identity
                let transformRight = CGAffineTransformMakeTranslation(bounds.width + CGFloat(safeAreaRight), 0.0)
                let transformCurrentFinish = transformCenter
                let transformPreviousFinish: CGAffineTransform
                if reversed {
                    transformPreviousFinish = transformRight
                } else {
                    transformPreviousFinish = transformLeft
                }
                UIView.animate(withDuration: time, delay: 0.0, options: .curveLinear) {
                    hostingControllerPrevious.view.transform = transformPreviousFinish
                    hostingControllerCurrent.view.transform = transformCurrentFinish
                } completion: { _ in
                    self.killPreviousHostingController()
                    self.toolRow.removePreviousNodes()
                    self.toolRow.isRowAnimationActive = false
                }
            } else {
                toolRow.isRowAnimationActive = false
            }
        } else {
            toolRow.isRowAnimationActive = false
        }
    }
    
    func killCurrentHostingController() {
        if let hostingControllerCurrent = hostingControllerCurrent {
            hostingControllerCurrent.view.layer.removeAllAnimations()
            hostingControllerCurrent.view.removeFromSuperview()
        }
        hostingControllerCurrent = nil
    }
    
    func killPreviousHostingController() {
        if let hostingControllerPrevious = hostingControllerPrevious {
            hostingControllerPrevious.view.layer.removeAllAnimations()
            hostingControllerPrevious.view.removeFromSuperview()
        }
        hostingControllerPrevious = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleDarkModeDidChange(orientation: Orientation) {
        let isDarkModeEnabled = ApplicationController.isDarkModeEnabled
        for node in toolRow.nodes {
            node.magicalViewModel.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        }
    }
    
}
