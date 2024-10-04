//
//  TopMenuView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit
import Combine

class TopMenuView: UIView, PrimaryMenuConforming {
    
    func handleSelectedJiggleDidChange() {
        print("TopMenuView => handleSelectedJiggleDidChange")
        standardContainerView.handleSelectedJiggleDidChange()
    }
    
    func handleSelectedSwatchDidChange() {
        print("TopMenuView => handleSelectedSwatchDidChange")
        standardContainerView.handleSelectedJiggleDidChange()
    }
    
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
        result.colors = [ToolInterfaceTheme._shadowInner.cgColor,
                         ToolInterfaceTheme._shadowMiddle.cgColor,
                         ToolInterfaceTheme._shadowOuter.cgColor]
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
    
    lazy var standardContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: standardContainerView, attribute: .left, relatedBy: .equal,
                           toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var standardContainerView: TopMenuStandardContainerView = {
        let result = TopMenuStandardContainerView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var videoRecordViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: videoRecordView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var videoRecordView: TopMenuVideoRecordView = {
        let result = TopMenuVideoRecordView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var videoExportViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: videoExportView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()

    lazy var videoExportView: TopMenuVideoExportView = {
        let result = TopMenuVideoExportView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var zoomViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: zoomView, attribute: .left, relatedBy: .equal, toItem: containerView,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()

    lazy var zoomView: TopMenuZoomView = {
        let result = TopMenuZoomView(toolInterfaceViewModel: toolInterfaceViewModel)
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
    
    func handleSafeArea(width: Int, safeAreaLeft: Int, safeAreaRight: Int, safeAreaTop: Int) {
        standardContainerView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                             safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        videoRecordView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                       safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        videoExportView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                       safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        zoomView.handleSafeArea(width: width, safeAreaLeft: safeAreaLeft,
                                safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
    }
    
    func handleDarkModeDidChange() {
        if ApplicationController.isDarkModeEnabled {
            materialViewDarkMode.activate()
            materialViewLightMode.deactivate()
        } else {
            materialViewDarkMode.deactivate()
            materialViewLightMode.activate()
        }
        standardContainerView.handleDarkModeDidChange()
        videoRecordView.handleDarkModeDidChange()
        videoExportView.handleDarkModeDidChange()
        zoomView.handleDarkModeDidChange()
    }
    
    private var darkModeDidChangeCancellable: AnyCancellable?
    private var selectedJiggleDidChangeCancellable: AnyCancellable?
    private var selectedTimeLineSwatchChangeCancellable: AnyCancellable?
    
    func setup(width: Int,
               safeAreaLeft: Int,
               safeAreaRight: Int,
               safeAreaTop: Int) {
      
        
        darkModeDidChangeCancellable = toolInterfaceViewModel
            .darkModeDidChangePublisher
            .sink { [weak self] in
                if let self = self {
                    self.handleDarkModeDidChange()
                }
            }
        
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            selectedJiggleDidChangeCancellable = jiggleDocument
                .selectedJiggleDidChangePublisher
                .sink { [weak self] in
                    if let self = self {
                        self.handleSelectedJiggleDidChange()
                    }
                }
            selectedTimeLineSwatchChangeCancellable = jiggleDocument
                .selectedTimeLineSwatchUpdatePublisher
                .sink { [weak self] in
                    if let self = self {
                        self.handleSelectedSwatchDidChange()
                    }
                }
        }
        
        
        let orientation = toolInterfaceViewModel.orientation
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        
        let videoRecordRowCount = ToolInterfaceTheme.getTopMenuVideoRecordRowCount(orientation: orientation)
        let videoExportRowCount = ToolInterfaceTheme.getTopMenuVideoExportRowCount(orientation: orientation)
        let zoomRowCount = ToolInterfaceTheme.getTopMenuZoomRowCount(orientation: orientation)
        
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
        
        backgroundColor = ToolInterfaceTheme._toolbarBackground
        
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
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0,
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
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: videoExportView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0,
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
            NSLayoutConstraint(item: videoRecordView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0, 
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
            NSLayoutConstraint(item: zoomView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0),
        ])
        zoomView.addConstraint(NSLayoutConstraint(item: zoomView, attribute: .height,
                                                  relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                  multiplier: 1.0,
                                                  constant: CGFloat(totalZoomMenuHeight)))
        
        containerView.addSubview(standardContainerView)
        addConstraints([
            standardContainerViewLeftConstraint,
            NSLayoutConstraint(item: standardContainerView, attribute: .width, relatedBy: .equal, 
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: standardContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0, 
                               constant: 0.0),
        ])
        standardContainerView.addConstraint(NSLayoutConstraint(item: standardContainerView, attribute: .height,
                                                               relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                               multiplier: 1.0, 
                                                               constant: CGFloat(512.0)))
        
        let shadowHeight = ToolInterfaceTheme.getTopMenuShadowHeight(orientation: orientation)
        addSubview(shadowView)
        addConstraints([
            NSLayoutConstraint(item: shadowView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(shadowHeight)),
            NSLayoutConstraint(item: shadowView, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        standardContainerView.setup(width: width, safeAreaLeft: safeAreaLeft,
                                    safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        zoomView.setup(width: width, safeAreaLeft: safeAreaLeft,
                       safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        videoRecordView.setup(width: width, safeAreaLeft: safeAreaLeft,
                              safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
        videoExportView.setup(width: width, safeAreaLeft: safeAreaLeft,
                              safeAreaRight: safeAreaRight, safeAreaTop: safeAreaTop)
    }
    
    func refreshGraphDisplay() {
        standardContainerView.refreshGraphDisplay()
    }
    
    func refreshTimeLineDisplay() {
        standardContainerView.refreshTimeLineDisplay()
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
                if configuration.isGraph {
                    standardContainerView.snapToGraph()
                } else if configuration.isTimeLine {
                    standardContainerView.snapToTimeLine()
                } else {
                    standardContainerView.snapToTopMenu()
                    standardContainerView.topMenuView.snapRowContent(configuration: configuration)
                }
            }
            snapToStandard()
        }
    }
}
