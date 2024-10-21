//
//  BottomMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import UIKit
import Combine

class BottomMenuView: UIView, SecondaryMenuConforming {
    
    var isModeAnimating = false

    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var shadowLayer: CAGradientLayer = {
        let result = CAGradientLayer()
        result.colors = [ToolInterfaceTheme._shadowOuter.cgColor,
                         ToolInterfaceTheme._shadowMiddle.cgColor,
                         ToolInterfaceTheme._shadowInner.cgColor]
        result.startPoint = CGPointMake(0.5, 0.0)
        result.endPoint = CGPointMake(0.5, 1.0)
        return result
    }()
    
    lazy var shadowView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        result.translatesAutoresizingMaskIntoConstraints = false
        result.layer.addSublayer(shadowLayer)
        return result
    }()
    
    lazy var standardViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: standardView, attribute: .left, relatedBy: .equal,
                           toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var standardView: BottomMenuMenuStandardView = {
        let result = BottomMenuMenuStandardView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var videoRecordViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: videoRecordView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var videoRecordView: BottomMenuMenuVideoRecordView = {
        let result = BottomMenuMenuVideoRecordView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var videoExportViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: videoExportView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()

    lazy var videoExportView: BottomMenuMenuVideoExportView = {
        let result = BottomMenuMenuVideoExportView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var zoomViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: zoomView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var zoomView: BottomMenuZoomView = {
        let result = BottomMenuZoomView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    required init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        backgroundColor = ToolInterfaceTheme._toolbarBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSafeArea(width: Int, safeAreaLeft: Int, safeAreaRight: Int, safeAreaBottom: Int) {
        standardView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                             safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
        videoRecordView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                       safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
        videoExportView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                       safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
        zoomView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
    }
    
    func handleDarkModeDidChange() {
        if ApplicationController.isDarkModeEnabled {
            materialViewDarkMode.activate()
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
            materialViewLightMode.activate()
        }
        standardView.handleDarkModeDidChange()
        videoRecordView.handleDarkModeDidChange()
        videoExportView.handleDarkModeDidChange()
        zoomView.handleDarkModeDidChange()
        
        videoRecordView.handleDarkModeDidChange()
    }
    
    func handlePurchasedDidChange() {
     print("BOTTOM MENU, HANDLED PURTCHASDEF")
    }
    
    private var darkModeDidChangeCancellable: AnyCancellable?
    private var purchasedDidChangeCancellable: AnyCancellable?
    func setup(width: Int,
               safeAreaLeft: Int,
               safeAreaRight: Int,
               safeAreaBottom: Int) {
        
        darkModeDidChangeCancellable = toolInterfaceViewModel
            .darkModeDidChangePublisher
            .sink { [weak self] in
                if let self = self {
                    self.handleDarkModeDidChange()
                }
            }
        
        purchasedDidChangeCancellable = toolInterfaceViewModel
            .purchasedDidChangePublisher
            .sink { [weak self] in
                if let self = self {
                    self.handleDarkModeDidChange()
                }
            }
        
        let orientation = toolInterfaceViewModel.orientation
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getBottomRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getBottomRowSeparatorHeightBottom(orientation: orientation)
        
        let standardRowCount = ToolInterfaceTheme.getBottomMenuStandardRowCount(orientation: orientation)
        let videoRecordRowCount = ToolInterfaceTheme.getBottomMenuVideoRecordRowCount(orientation: orientation)
        let videoExportRowCount = ToolInterfaceTheme.getBottomMenuVideoExportRowCount(orientation: orientation)
        let zoomRowCount = ToolInterfaceTheme.getBottomMenuZoomRowCount(orientation: orientation)
        
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
        
        addSubview(containerView)
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, 
                               toItem: self, attribute: .left, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, 
                               toItem: self, attribute: .right, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, 
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                               constant: 512.0),
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, 
                               toItem: self, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
        ])
        
        containerView.addSubview(materialViewLightMode)
        containerView.addConstraints([
            NSLayoutConstraint(item: materialViewLightMode, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewLightMode, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        containerView.addSubview(materialViewDarkMode)
        containerView.addConstraints([
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: materialViewDarkMode, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        if ApplicationController.isDarkModeEnabled {
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
        }
        
        containerView.addSubview(videoExportView)
        addConstraints([
            videoExportViewLeftConstraint,
            NSLayoutConstraint(item: videoExportView, attribute: .width, relatedBy: .equal, 
                               toItem: self, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: videoExportView, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
        ])
        videoExportView.addConstraint(NSLayoutConstraint(item: videoExportView, attribute: .height,
                                                         relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: CGFloat(totalVideoExportMenuHeight)))
        
        containerView.addSubview(videoRecordView)
        addConstraints([
            videoRecordViewLeftConstraint,
            NSLayoutConstraint(item: videoRecordView, attribute: .width, relatedBy: .equal, 
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: videoRecordView, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
        ])
        videoRecordView.addConstraint(NSLayoutConstraint(item: videoRecordView, attribute: .height,
                                                         relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                         multiplier: 1.0,
                                                         constant: CGFloat(totalVideoRecordMenuHeight)))
        
        containerView.addSubview(zoomView)
        addConstraints([
            zoomViewLeftConstraint,
            NSLayoutConstraint(item: zoomView, attribute: .width, relatedBy: .equal, 
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: zoomView, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, 
                               constant: 0.0),
        ])
        zoomView.addConstraint(NSLayoutConstraint(item: zoomView, attribute: .height,
                                                  relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(totalZoomMenuHeight)))
        
        containerView.addSubview(standardView)
        addConstraints([
            standardViewLeftConstraint,
            NSLayoutConstraint(item: standardView, attribute: .width, relatedBy: .equal, 
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: standardView, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
        ])
        standardView.addConstraint(NSLayoutConstraint(item: standardView, attribute: .height,
                                                      relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                      multiplier: 1.0,
                                                      constant: CGFloat(totalStandardMenuHeight)))
        
        let shadowHeight = ToolInterfaceTheme.getBottomMenuShadowHeight(orientation: orientation)
        
        addSubview(shadowView)
        addConstraints([
            NSLayoutConstraint(item: shadowView, attribute: .left, relatedBy: .equal, 
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        ])
        shadowView.addConstraint(NSLayoutConstraint(item: shadowView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                    attribute: .notAnAttribute, multiplier: 1.0,
                                                    constant: CGFloat(shadowHeight)))
        
        standardView.setup(width: width, safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
        zoomView.setup(width: width, safeAreaLeft: safeAreaLeft,
                       safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
        videoRecordView.setup(width: width, safeAreaLeft: safeAreaLeft,
                              safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
        videoExportView.setup(width: width, safeAreaLeft: safeAreaLeft,
                              safeAreaRight: safeAreaRight, safeAreaBottom: safeAreaBottom)
    }
    
    func refreshShadowDisplay() {
        shadowLayer.frame = shadowView.bounds
    }
    
    func snapExpanded(configuration: InterfaceConfigurationPhone, snapStandardMenus: Bool) {
        if configuration.isVideoExportEnabled {
            snapToVideoExport()
        } else if configuration.isVideoRecordEnabled {
            snapToVideoRecord()
        } else {
            if snapStandardMenus {
                standardView.snapRowContent(configuration: configuration)
            }
            snapToStandard()
        }
    }
}
