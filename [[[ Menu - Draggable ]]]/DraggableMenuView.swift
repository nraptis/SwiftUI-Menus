//
//  DraggableMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import UIKit
import Combine

class DraggableMenuView: UIView, PrimaryMenuConforming {
    
    var isModeAnimating = false
    
    static let borderSize = 1
    
    static let grabCornerDistance = CGFloat(24.0)
    
    static func getMinimumWidth(orientation: Orientation) -> Int {
        return 404
    }
    
    static func getMaximumWidth(orientation: Orientation) -> Int {
        return 1400
    }
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var materialViewDarkMode: MaterialView = {
        let result = MaterialView(material: .thick,
                                  opacity: 0.8,
                                  color: UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6),
                                  interfaceStyle: .dark)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var materialViewLightMode: MaterialView = {
        let result = MaterialView(material: .regular,
                                  opacity: 0.76,
                                  color: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.4),
                                  interfaceStyle: .light)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var topBar: DraggableMenuTopBar = {
        let orientation = toolInterfaceViewModel.orientation
        let result = DraggableMenuTopBar(toolInterfaceViewModel: toolInterfaceViewModel, orientation: orientation)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var standardContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: standardContainerView, attribute: .left, relatedBy: .equal,
                           toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var standardContainerView: DraggableMenuStandardContainerView = {
        let result = DraggableMenuStandardContainerView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var videoExportViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: videoExportView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var videoExportView: DraggableMenuVideoExportView = {
        let result = DraggableMenuVideoExportView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var videoRecordViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: videoRecordView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var videoRecordView: DraggableMenuVideoRecordView = {
        let result = DraggableMenuVideoRecordView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var zoomViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: zoomView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var zoomView: DraggableMenuZoomView = {
        let result = DraggableMenuZoomView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var bottomBar: DraggableMenuBottomBar = {
        let result = DraggableMenuBottomBar(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
        
        backgroundColor = ToolInterfaceTheme._toolbarBackground
        layer.cornerRadius = 14.0
        
        containerView.layer.cornerRadius = 14.0

        if ApplicationController.isDarkModeEnabled {
            layer.borderColor = ToolInterfaceTheme._draggableBorderDark.cgColor
        } else {
            layer.borderColor = ToolInterfaceTheme._draggableBorderLight.cgColor
        }
        layer.borderWidth = CGFloat(Self.borderSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleDarkModeDidChange() {
        if ApplicationController.isDarkModeEnabled {
            layer.borderColor = ToolInterfaceTheme._draggableBorderDark.cgColor
        } else {
            layer.borderColor = ToolInterfaceTheme._draggableBorderLight.cgColor
        }
        if ApplicationController.isDarkModeEnabled {
            materialViewDarkMode.activate()
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
            materialViewLightMode.activate()
        }
        topBar.handleDarkModeDidChange()
        bottomBar.handleDarkModeDidChange()
        videoExportView.handleDarkModeDidChange()
        videoRecordView.handleDarkModeDidChange()
        zoomView.handleDarkModeDidChange()
        standardContainerView.handleDarkModeDidChange()
    }
    
    private var darkModeDidChangeCancellable: AnyCancellable?
    func setup(width: Int, height: Int , orientation: Orientation) {
        
        darkModeDidChangeCancellable = toolInterfaceViewModel
            .darkModeDidChangePublisher
            .sink { [weak self] in
                if let self = self {
                    self.handleDarkModeDidChange()
                }
            }
        
        addSubview(containerView)
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0)
        ])
        
        containerView.addSubview(topBar)
        containerView.addConstraints([
            NSLayoutConstraint(item: topBar, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topBar, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topBar, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0)
        ])
        let topToolbarHeight = ToolInterfaceTheme.getDraggableMenuTopToolbarHeight()
        topBar.addConstraint(NSLayoutConstraint(item: topBar, attribute: .height, relatedBy: .equal,
                                                toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                constant: CGFloat(topToolbarHeight)))
        
        containerView.addSubview(bottomBar)
        containerView.addConstraints([
            NSLayoutConstraint(item: bottomBar, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomBar, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomBar, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0)
        ])
        let bottomToolbarHeight = ToolInterfaceTheme.getDraggableMenuBottomToolbarHeight()
        bottomBar.addConstraint(NSLayoutConstraint(item: bottomBar, attribute: .height, relatedBy: .equal,
                                                   toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                   constant: CGFloat(bottomToolbarHeight)))
        
        containerView.addSubview(materialViewLightMode)
        
        let materialViewLightModeBottomConstraint = NSLayoutConstraint(item: materialViewLightMode, attribute: .bottom, relatedBy: .equal, toItem: bottomBar,
                                                                       attribute: .top, multiplier: 1.0, constant: 0.0)
        materialViewLightModeBottomConstraint.priority = .defaultHigh
        containerView.addConstraints([
            NSLayoutConstraint(item: materialViewLightMode, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: materialViewLightMode, attribute: .top, relatedBy: .equal, toItem: topBar,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
            materialViewLightModeBottomConstraint
        ])
        
        
        containerView.addSubview(materialViewDarkMode)
        let materialViewDarkModeBottomConstraint = NSLayoutConstraint(item: materialViewDarkMode, attribute: .bottom, relatedBy: .equal, toItem: bottomBar,
                                                                      attribute: .top, multiplier: 1.0, constant: 0.0)
        materialViewDarkModeBottomConstraint.priority = .defaultHigh
        containerView.addConstraints([
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .top, relatedBy: .equal, toItem: topBar,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
            materialViewDarkModeBottomConstraint
        ])
        
        if ApplicationController.isDarkModeEnabled {
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
        }
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeight()
        let rowSeparatorHeightTop = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightTop()
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightBottom()
        
        let topHalfRowCount = ToolInterfaceTheme.getDraggableMenuStandardTopHalfRowCount()
        let bottomHalfRowCount = ToolInterfaceTheme.getDraggableMenuStandardBottomHalfRowCount()
        let standardRowCount = topHalfRowCount + bottomHalfRowCount
        let videoRecordRowCount = ToolInterfaceTheme.getDraggableMenuVideoRecordRowCount()
        let videoExportRowCount = ToolInterfaceTheme.getDraggableMenuVideoExportRowCount()
        let zoomRowCount = ToolInterfaceTheme.getDraggableMenuZoomRowCount()
        
        // Top half is this:
        var topHalfHeight = (topHalfRowCount * rowHeight)
        if topHalfRowCount > 1 {
            topHalfHeight += (rowSeparatorHeight) * (topHalfRowCount - 1)
        }
        
        var bottomHalfHeight = (bottomHalfRowCount * rowHeight)
        if bottomHalfRowCount > 1 {
            bottomHalfHeight += (rowSeparatorHeight) * (bottomHalfRowCount - 1)
        }
        
        var totalStandardMenuHeight = 0
        totalStandardMenuHeight += rowSeparatorHeightTop
        totalStandardMenuHeight += (standardRowCount * rowHeight)
        if standardRowCount > 1 {
            totalStandardMenuHeight += (rowSeparatorHeight) * (standardRowCount - 1)
        }
        totalStandardMenuHeight += rowSeparatorHeightBottom
        
        
        var totalVideoExportMenuHeight = 0
        totalVideoExportMenuHeight += rowSeparatorHeightTop
        totalVideoExportMenuHeight += (videoExportRowCount * rowHeight)
        if videoExportRowCount > 1 {
            totalVideoExportMenuHeight += (rowSeparatorHeight) * (videoExportRowCount - 1)
        }
        totalVideoExportMenuHeight += rowSeparatorHeightBottom
        
        var totalVideoRecordMenuHeight = 0
        totalVideoRecordMenuHeight += rowSeparatorHeightTop
        totalVideoRecordMenuHeight += (videoRecordRowCount * rowHeight)
        if videoRecordRowCount > 1 {
            totalVideoRecordMenuHeight += (rowSeparatorHeight) * (videoRecordRowCount - 1)
        }
        totalVideoRecordMenuHeight += rowSeparatorHeightBottom
        
        var totalZoomMenuHeight = 0
        totalZoomMenuHeight += rowSeparatorHeightTop
        totalZoomMenuHeight += (zoomRowCount * rowHeight)
        if zoomRowCount > 1 {
            totalZoomMenuHeight += (rowSeparatorHeight) * (zoomRowCount - 1)
        }
        totalZoomMenuHeight += rowSeparatorHeightBottom
        
        let allMenuY = (topToolbarHeight)
        
        containerView.addSubview(videoExportView)
        containerView.addConstraints([
            NSLayoutConstraint(item: videoExportView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: CGFloat(allMenuY)),
            videoExportViewLeftConstraint,
            NSLayoutConstraint(item: videoExportView, attribute: .width, relatedBy: .equal, toItem: containerView,
                               attribute: .width, multiplier: 1.0, constant: 0.0)
        ])
        videoExportView.addConstraint(NSLayoutConstraint(item: videoExportView, attribute: .height, relatedBy: .equal,
                                                         toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                         constant: CGFloat(totalVideoExportMenuHeight)))
        
        containerView.addSubview(videoRecordView)
        containerView.addConstraints([
            NSLayoutConstraint(item: videoRecordView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: CGFloat(allMenuY)),
            videoRecordViewLeftConstraint,
            NSLayoutConstraint(item: videoRecordView, attribute: .width, relatedBy: .equal, toItem: containerView,
                               attribute: .width, multiplier: 1.0, constant: 0.0)
        ])
        videoRecordView.addConstraint(NSLayoutConstraint(item: videoRecordView, attribute: .height, relatedBy: .equal,
                                                         toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                         constant: CGFloat(totalVideoRecordMenuHeight)))
        
        containerView.addSubview(zoomView)
        containerView.addConstraints([
            NSLayoutConstraint(item: zoomView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: CGFloat(allMenuY)),
            zoomViewLeftConstraint,
            NSLayoutConstraint(item: zoomView, attribute: .width, relatedBy: .equal, toItem: containerView,
                               attribute: .width, multiplier: 1.0, constant: 0.0)
        ])
        zoomView.addConstraint(NSLayoutConstraint(item: zoomView, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                  constant: CGFloat(totalZoomMenuHeight)))
        
        containerView.addSubview(standardContainerView)
        containerView.addConstraints([
            NSLayoutConstraint(item: standardContainerView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: CGFloat(allMenuY)),
            standardContainerViewLeftConstraint,
            NSLayoutConstraint(item: standardContainerView, attribute: .width, relatedBy: .equal, toItem: containerView,
                               attribute: .width, multiplier: 1.0, constant: 0.0)
        ])
        
        standardContainerView.addConstraint(NSLayoutConstraint(item: standardContainerView, attribute: .height, relatedBy: .equal,
                                                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                               constant: CGFloat(totalStandardMenuHeight)))
        
        containerView.bringSubviewToFront(topBar)
        containerView.bringSubviewToFront(bottomBar)
        
        standardContainerView.setup(width: width)
        zoomView.setup(width: width)
        videoRecordView.setup(width: width)
        videoExportView.setup(width: width)
    }
    
    func isNearCornerTopLeft(_ point: CGPoint) -> Bool {
        
        let cornerX = CGFloat(0.0)
        let cornerY = CGFloat(0.0)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        
        return false
    }
    
    func isNearCornerTopRight(_ point: CGPoint) -> Bool {
        
        let cornerX = CGFloat(bounds.width)
        let cornerY = CGFloat(0.0)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        
        return false
    }
    
    func isNearCornerBottomLeft(_ point: CGPoint) -> Bool {
        let cornerX = CGFloat(0.0)
        let cornerY = CGFloat(bounds.height)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        
        return false
    }
    
    func isNearCornerBottomRight(_ point: CGPoint) -> Bool {
        let cornerX = CGFloat(bounds.width)
        let cornerY = CGFloat(bounds.height)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        return false
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if topBar.frame.contains(point) {
            if topBar.expandCollapseButton.frame.contains(point) {
                print("It's in the button...")
                return super.hitTest(point, with: event)
            }
        }
        
        //topBar
        //expandCollapseButton
        
        
        if isNearCornerTopRight(point) { return nil }
        if isNearCornerTopLeft(point) { return nil }
        if isNearCornerBottomLeft(point) { return nil }
        if isNearCornerBottomRight(point) { return nil }
        
        if topBar.frame.contains(point) {
            return nil
        } else if bottomBar.frame.contains(point) {
            return nil
        } else {
            /*
             if let jiggleViewModel = toolInterfaceViewModel.jiggleViewModel {
             if jiggleViewModel.isWeightCurveGraphEnabled {
             
             let frames = getGraphFrames(isRelativeToWorld: false, isGraphEnabled: true)
             
             let weightCurveFrame = CGRect(x: CGFloat(frames.contentFrameX),
             y: CGFloat(frames.contentFrameY),
             width: CGFloat(frames.contentFrameWidth),
             height: CGFloat(frames.contentFrameHeight))
             if weightCurveFrame.contains(point) {
             return nil
             }
             }
             }
             */
            
            if bounds.contains(point) {
                return super.hitTest(point, with: event)
            } else {
                return nil
            }
        }
    }
    
    func snapExpanded(configuration: InterfaceConfigurationPad, snapStandardMenus: Bool) {
        
        topBar.expandCollapseButton.isExpanded = configuration.isExpanded
        topBar.expandCollapseButton.setNeedsDisplay()
        
        if configuration.isExpanded {
            
            bottomBar.activate()
            if configuration.isVideoExportEnabled {
                snapToVideoExport()
            } else if configuration.isVideoRecordEnabled {
                snapToVideoRecord()
            } else {
                if snapStandardMenus {
                    if configuration.isGraphEnabled {
                        standardContainerView.graphModeEnableSnap()
                    } else {
                        standardContainerView.graphModeDisableSnap()
                        standardContainerView.topMenuView.snapRowContent(configuration: configuration)
                    }
                    standardContainerView.bottomMenuView.snapRowContent(configuration: configuration)
                }
                snapToStandard()
            }
            
            if ApplicationController.isDarkModeEnabled {
                materialViewDarkMode.activate()
            } else {
                materialViewLightMode.activate()
            }
            
        } else {
            
            materialViewDarkMode.deactivate()
            materialViewLightMode.deactivate()
            
            bottomBar.deactivate()
            standardContainerView.deactivate()
            videoRecordView.deactivate()
            videoExportView.deactivate()
        }
    }
    
    func refreshGraphDisplay() {
        standardContainerView.refreshGraphDisplay()
    }
    
}
