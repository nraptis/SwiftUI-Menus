//
//  MenuPartConforming.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/3/24.
//

import UIKit

protocol PrimaryOrSecondaryMenuConforming: AnyObject where Self: UIView {
    var isModeAnimating: Bool { set get }
    
    associatedtype VideoRecordViewType: MenuPartWithRowsConforming
    var videoRecordView: VideoRecordViewType { set get }
    var videoRecordViewLeftConstraint: NSLayoutConstraint { set get }
    
    associatedtype VideoExportViewType: MenuPartWithRowsConforming
    var videoExportView: VideoExportViewType { set get }
    var videoExportViewLeftConstraint: NSLayoutConstraint { set get }
    
    associatedtype ZoomViewType: MenuPartWithRowsConforming
    var zoomView: ZoomViewType { set get }
    var zoomViewLeftConstraint: NSLayoutConstraint { set get }
}

// On iPad, this is the whole menu (except top and bottom book-ends)
// On iPhone, this is the top menu, all of it.
protocol PrimaryMenuConforming: AnyObject, PrimaryOrSecondaryMenuConforming where Self: UIView {
    associatedtype StandardContainerViewType: PrimaryMenuStandardContainerConforming
    var standardContainerView: StandardContainerViewType { set get }
    var standardContainerViewLeftConstraint: NSLayoutConstraint { set get }
}

// On iPhone, this is the bottom menu, all of it.
protocol SecondaryMenuConforming: AnyObject, PrimaryOrSecondaryMenuConforming where Self: UIView {
    associatedtype StandardViewType: MenuPartWithRowsConforming
    var standardView: StandardViewType { set get }
    var standardViewLeftConstraint: NSLayoutConstraint { set get }
}

protocol BottomMenuConforming: AnyObject, PrimaryOrSecondaryMenuConforming where Self: UIView {
    associatedtype StandardContainerViewType: MenuPartWithRowsConforming
    var standardContainerView: StandardContainerViewType { set get }
    var standardContainerViewLeftConstraint: NSLayoutConstraint { set get }
}

// On iPad, the whole menu is "PrimaryMenuStandardContainerConforming"
// There is an important difference

// On iphone, its the whole top menu, swutch to graph mode...
// On the ipad, it's not the whole "top menu"...

protocol PrimaryMenuStandardContainerConforming: AnyObject where Self: UIView {
    
    var isGraphModeAnimating: Bool { set get }
    
    associatedtype GraphContainerViewType: GraphContainerConforming
    var graphContainerView: GraphContainerViewType { set get }
    var graphContainerViewLeftConstraint: NSLayoutConstraint { set get }
    
    // This is the *TOP* menu, which juggles along-side
    // the graph... It's either the graph or this...
    associatedtype TopMenuViewType: MenuPartWithRowsConforming
    var topMenuView: TopMenuViewType { set get }
    var topMenuViewLeftConstraint: NSLayoutConstraint { set get }
    
    // On the iPad, sometimes we want to:
    //  1.) Animate the graph and *NOT* animate the "top" menu
    //  2.) At the same time, animate the "bottom" menu.
    
    func getSecondaryMenu() -> (any MenuPartWithRowsConforming)?
    
}

protocol GraphContainerConforming: AnyObject where Self: UIView {
    var graphClippingView: GraphClippingView { set get }
    var graphView: GraphView { set get }
    
    associatedtype SideMenuViewType: MenuPartWithRowsConforming
    var sideMenuView: SideMenuViewType { set get }
}

protocol MenuPartWithRowsConforming: AnyObject where Self: UIView {
    
    var toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay { get }
    
    var rowViews: [ToolRowView] { get set }
    var separatorViews: [UIView] { get set }
    
    func getNumberOfRows() -> Int
    func getWidthSource() -> ToolRowViewContent.WidthSource
    func getToolRow(at index: Int) -> ToolRow?
    
    func handleDarkModeDidChange()
}

extension MenuPartWithRowsConforming {
    
    func _handleDarkModeDidChange() {
        for rowView in rowViews {
            rowView.handleDarkModeDidChange(orientation: toolInterfaceLayoutRelay.orientation)
        }
        if ApplicationController.isDarkModeEnabled {
            for separatorView in separatorViews {
                separatorView.backgroundColor = ToolInterfaceTheme._separatorMiddleDark
            }
        } else {
            for separatorView in separatorViews {
                separatorView.backgroundColor = ToolInterfaceTheme._separatorMiddleLight
            }
        }
    }
    
    func handleDarkModeDidChange() {
        _handleDarkModeDidChange()
    }
    
    private func getToolRows() -> [ToolRow] {
        let numberOfRows = getNumberOfRows()
        var toolRows = [ToolRow]()
        for rowIndex in 0..<numberOfRows {
            if let toolRow = getToolRow(at: rowIndex) {
                toolRows.append(toolRow)
            }
        }
        return toolRows
    }
    
    func snapRowContent(configuration: any InterfaceConfigurationConforming) {
        let toolRows = getToolRows()
        let widthSource = getWidthSource()
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.snapRowContent(configuration: configuration,
                                                  toolRows: toolRows,
                                                  widthSource: widthSource)
        }
    }
    
    func animateRowContent_Step1(configuration: any InterfaceConfigurationConforming, reversed: Bool) {
        let toolRows = getToolRows()
        let widthSource = getWidthSource()
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.animateRowContent_Step1(configuration: configuration,
                                                           toolRows: toolRows,
                                                           widthSource: widthSource,
                                                           reversed: reversed)
        }
    }
    
    func animateRowContent_Step2(configuration: any InterfaceConfigurationConforming, reversed: Bool, time: CGFloat) {
        let toolRows = getToolRows()
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.animateRowContent_Step2(configuration: configuration,
                                                           toolRows: toolRows,
                                                           reversed: reversed,
                                                           time: time)
        }
    }
    
    func setupRows(width: Int,
                   offset: Int,
                   rowHeight: Int,
                   rowSeparatorHeight: Int,
                   reversed: Bool) {
        
        let orientation = toolInterfaceLayoutRelay.orientation
        
        let numberOfRows = getNumberOfRows()
        let numberOfRows1 = (numberOfRows - 1)
        
        var rowIndex = 0
        
        if reversed {
            var bottomY = (-offset)
            while rowIndex < numberOfRows {
                let rowView = generateRowView(at: rowIndex, width: width, orientation: orientation)
                
                addSubview(rowView)
                rowViews.append(rowView)
                
                let leftConstraint = rowView.toolRow.getLeftConstraint(rowView, self)
                
                rowView.addConstraints([
                    NSLayoutConstraint(item: rowView, attribute: .height,
                                       relatedBy: .equal, toItem: nil,
                                       attribute: .notAnAttribute, multiplier: 1.0,
                                       constant: CGFloat(rowHeight))
                ])
                addConstraints([
                    leftConstraint,
                    NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal,
                                       toItem: self, attribute: .bottom, multiplier: 1.0, constant: CGFloat(bottomY)),
                ])
                                                            
                bottomY -= rowHeight
                
                if rowIndex < numberOfRows1 {
                    let separatorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
                    separatorView.translatesAutoresizingMaskIntoConstraints = false
                    if ApplicationController.isDarkModeEnabled {
                        separatorView.backgroundColor = ToolInterfaceTheme._separatorMiddleDark
                    } else {
                        separatorView.backgroundColor = ToolInterfaceTheme._separatorMiddleLight
                    }
                    addSubview(separatorView)
                    separatorViews.append(separatorView)
                    addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                           toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                           toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .bottom, relatedBy: .equal,
                                           toItem: self, attribute: .bottom, multiplier: 1.0, constant: CGFloat(bottomY)),
                    ])
                    separatorView.addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .height,
                                           relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: CGFloat(rowSeparatorHeight))
                    ])
                    bottomY -= rowSeparatorHeight
                }
                rowIndex += 1
            }
        } else {
            var topY = (offset)
            while rowIndex < numberOfRows {
                let rowView = generateRowView(at: rowIndex, width: width, orientation: orientation)
                
                addSubview(rowView)
                rowViews.append(rowView)
                
                let leftConstraint = rowView.toolRow.getLeftConstraint(rowView, self)
                
                rowView.addConstraints([
                    NSLayoutConstraint(item: rowView, attribute: .height,
                                       relatedBy: .equal, toItem: nil,
                                       attribute: .notAnAttribute, multiplier: 1.0,
                                       constant: CGFloat(rowHeight))
                ])
                addConstraints([
                    leftConstraint,
                    NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal,
                                       toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(topY)),
                ])
                                                            
                topY += rowHeight
                
                if rowIndex < numberOfRows1 {
                    let separatorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
                    separatorView.translatesAutoresizingMaskIntoConstraints = false
                    if ApplicationController.isDarkModeEnabled {
                        separatorView.backgroundColor = ToolInterfaceTheme._separatorMiddleDark
                    } else {
                        separatorView.backgroundColor = ToolInterfaceTheme._separatorMiddleLight
                    }
                    addSubview(separatorView)
                    separatorViews.append(separatorView)
                    addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                           toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                           toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal,
                                           toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(topY)),
                    ])
                    separatorView.addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .height,
                                           relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: CGFloat(rowSeparatorHeight))
                    ])
                    topY += rowSeparatorHeight
                }
                rowIndex += 1
            }
        }
    }
    
    private func generateRowView(at index: Int, width: Int, orientation: Orientation) -> ToolRowView {
        
        if index >= 0 && index < getNumberOfRows() {
            if let toolRow = getToolRow(at: index) {
                if toolRow._widthConstraint == nil {
                    let rowView = ToolRowView(toolInterfaceLayoutRelay: toolInterfaceLayoutRelay,
                                              toolRow: toolRow,
                                              widthSource: getWidthSource(),
                                              orientation: orientation)
                    let widthConstraint = toolRow.getWidthConstraint(rowView)
                    widthConstraint.constant = CGFloat(width)
                    rowView.addConstraint(widthConstraint)
                    
                    return rowView
                } else {
                    print("Fetched Row Twice @ \(index) With \(getWidthSource()) And \(getNumberOfRows())")
                }
            }
        }
        
        let toolRow = ToolRow(slot: .unknown)
        let rowView = ToolRowView(toolInterfaceLayoutRelay: toolInterfaceLayoutRelay,
                                  toolRow: toolRow,
                                  widthSource: getWidthSource(),
                                  orientation: orientation)
        let widthConstraint = toolRow.getWidthConstraint(rowView)
        widthConstraint.constant = CGFloat(width)
        rowView.addConstraint(widthConstraint)
        
        return rowView
    }
}

extension PrimaryMenuStandardContainerConforming {
    
    func refreshGraphDisplay() {
        graphContainerView.graphClippingView.setNeedsDisplay()
        graphContainerView.graphView.setNeedsDisplay()
    }
    
    func graphModeEnableAnimated(reversed: Bool, time: CGFloat) {
        isGraphModeAnimating = true
        transitionChildren(previousView: topMenuView,
                           previousConstraint: topMenuViewLeftConstraint,
                           currentView: graphContainerView,
                           currentConstraint: graphContainerViewLeftConstraint,
                           reversed: reversed,
                           time: time) {
            self.isGraphModeAnimating = false
        }
    }
    
    func graphModeEnableSnap() {
        isGraphModeAnimating = false
        graphContainerViewLeftConstraint.constant = 0.0
        graphContainerView.activate()
        topMenuView.deactivate()
    }
    
    func graphModeDisableAnimated(reversed: Bool, time: CGFloat) {
        isGraphModeAnimating = true
        transitionChildren(previousView: graphContainerView,
                           previousConstraint: graphContainerViewLeftConstraint,
                           currentView: topMenuView,
                           currentConstraint: topMenuViewLeftConstraint,
                           reversed: reversed,
                           time: time) {
            self.isGraphModeAnimating = false
        }
    }
    
    func graphModeDisableSnap() {
        isGraphModeAnimating = false
        topMenuViewLeftConstraint.constant = 0.0
        topMenuView.activate()
        graphContainerView.deactivate()
    }
}

extension PrimaryMenuConforming {
    
    func animateFromStandardToVideoExport(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardContainerView, previousConstraint: standardContainerViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoExportToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: standardContainerView, currentConstraint: standardContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromStandardToVideoRecord(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardContainerView, previousConstraint: standardContainerViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoRecordToStandard(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: standardContainerView, currentConstraint: standardContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoRecordToVideoExport(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoExportToVideoRecord(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoExportToZoom(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromZoomToVideoExport(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoRecordToZoom(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromZoomToVideoRecord(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromStandardToZoom(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardContainerView, previousConstraint: standardContainerViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromZoomToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: standardContainerView, currentConstraint: standardContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func snapToStandard() {
        standardContainerView.activate()
        standardContainerViewLeftConstraint.constant = 0.0
        videoRecordView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    func snapToVideoRecord() {
        videoRecordView.activate()
        videoRecordViewLeftConstraint.constant = 0.0
        standardContainerView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    func snapToVideoExport() {
        videoExportView.activate()
        videoExportViewLeftConstraint.constant = 0.0
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        zoomView.deactivate()
    }
    
    func snapToZoom() {
        zoomView.activate()
        zoomViewLeftConstraint.constant = 0.0
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        videoExportView.deactivate()
    }
    
    func handle_Step1(actionPrimary: InterfacePrimaryMenuAction,
                      actionSecondary: InterfaceSecondaryMenuAction,
                      configuration: any InterfaceConfigurationConforming,
                      reversed: Bool) {
    
        switch actionPrimary.startAction {
        case .snapGraphEnter:
            standardContainerView.graphModeEnableSnap()
            
        case .snapGraphExit:
            standardContainerView.graphModeDisableSnap()
            standardContainerView.topMenuView.snapRowContent(configuration: configuration)
            if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                secondaryMenu.snapRowContent(configuration: configuration)
            }
        case .none:
            break
        }
        
        switch actionPrimary.mainAction {
            
        case .none:
            break
        case .standard(let standardType):
            switch standardType {
            case .none:
                break
            case .updateRows:
                standardContainerView.topMenuView.animateRowContent_Step1(configuration: configuration,
                                                                    reversed: reversed)
                if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                    secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                          reversed: reversed)
                }
            case .graphEnter:
                switch actionSecondary.mainAction {
                case .standardUpdateRows:
                    if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                        secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                              reversed: reversed)
                    }
                default:
                    break
                }
                break
            case .graphExit:
                standardContainerView.topMenuView.snapRowContent(configuration: configuration)
                switch actionSecondary.mainAction {
                case .standardUpdateRows:
                    if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                        secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                              reversed: reversed)
                    }
                default:
                    break
                }
            }
        case .transition(let startPane, let endPane):
            break
        case .snap(let pane):
            switch pane {
            case .standard:
                snapToStandard()
            case .zoom:
                snapToZoom()
            case .videoRecord:
                snapToVideoRecord()
            case .videoExport:
                snapToVideoExport()
            }
        }
    }
    
    func handle_Step2(actionPrimary: InterfacePrimaryMenuAction,
                      actionSecondary: InterfaceSecondaryMenuAction,
                      configuration: any InterfaceConfigurationConforming,
                      reversed: Bool,
                      time: CGFloat) {
        switch actionPrimary.startAction {
        case .snapGraphEnter:
            break
        case .snapGraphExit:
            break
        case .none:
            break
        }
        
        switch actionPrimary.mainAction {
            
        case .none:
            break
        case .standard(let standardType):
            switch standardType {
            case .none:
                break
            case .updateRows:
                standardContainerView.topMenuView.animateRowContent_Step2(configuration: configuration,
                                                                          reversed: reversed,
                                                                          time: time)
                if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                    secondaryMenu.animateRowContent_Step2(configuration: configuration,
                                                          reversed: reversed,
                                                          time: time)
                }
            case .graphEnter:
                standardContainerView.graphModeEnableAnimated(reversed: reversed, time: time)
                switch actionSecondary.mainAction {
                case .standardUpdateRows:
                    if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                        secondaryMenu.animateRowContent_Step2(configuration: configuration,
                                                              reversed: reversed,
                                                              time: time)
                    }
                default:
                    break
                }
            case .graphExit:
                standardContainerView.graphModeDisableAnimated(reversed: reversed, time: time)
                switch actionSecondary.mainAction {
                case .standardUpdateRows:
                    if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                        secondaryMenu.animateRowContent_Step2(configuration: configuration,
                                                              reversed: reversed,
                                                              time: time)
                    }
                default:
                    break
                }
            }
        case .transition(let startPane, let endPane):
            switch startPane {
            case .standard:
                switch endPane {
                case .standard:
                    break
                case .zoom:
                    animateFromStandardToZoom(reversed: reversed, time: time)
                case .videoRecord:
                    animateFromStandardToVideoRecord(reversed: reversed, time: time)
                case .videoExport:
                    animateFromStandardToVideoExport(reversed: reversed, time: time)
                }
            case .zoom:
                switch endPane {
                case .standard:
                    animateFromZoomToStandard(reversed: reversed, time: time)
                case .zoom:
                    break
                case .videoRecord:
                    animateFromZoomToVideoRecord(reversed: reversed, time: time)
                case .videoExport:
                    animateFromZoomToVideoExport(reversed: reversed, time: time)
                }
            case .videoRecord:
                switch endPane {
                case .standard:
                    animateFromVideoRecordToStandard(reversed: reversed, time: time)
                case .zoom:
                    animateFromVideoRecordToZoom(reversed: reversed, time: time)
                case .videoRecord:
                    break
                case .videoExport:
                    animateFromVideoRecordToVideoExport(reversed: reversed, time: time)
                }
            case .videoExport:
                switch endPane {
                case .standard:
                    animateFromVideoExportToStandard(reversed: reversed, time: time)
                case .zoom:
                    animateFromVideoExportToZoom(reversed: reversed, time: time)
                case .videoRecord:
                    animateFromVideoExportToVideoRecord(reversed: reversed, time: time)
                case .videoExport:
                    break
                }
            }
        case .snap:
            break
        }
    }
}

extension SecondaryMenuConforming {
    
    func animateFromStandardToVideoExport(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardView, previousConstraint: standardViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoExportToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: standardView, currentConstraint: standardViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromStandardToVideoRecord(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardView, previousConstraint: standardViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoRecordToStandard(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: standardView, currentConstraint: standardViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoRecordToVideoExport(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoExportToVideoRecord(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoExportToZoom(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromZoomToVideoExport(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromVideoRecordToZoom(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromZoomToVideoRecord(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromStandardToZoom(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardView, previousConstraint: standardViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func animateFromZoomToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: standardView, currentConstraint: standardViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    func snapToStandard() {
        standardView.activate()
        standardViewLeftConstraint.constant = 0.0
        videoRecordView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    func snapToVideoRecord() {
        videoRecordView.activate()
        videoRecordViewLeftConstraint.constant = 0.0
        standardView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    func snapToVideoExport() {
        videoExportView.activate()
        videoExportViewLeftConstraint.constant = 0.0
        standardView.deactivate()
        videoRecordView.deactivate()
        zoomView.deactivate()
    }
    
    func snapToZoom() {
        zoomView.activate()
        zoomViewLeftConstraint.constant = 0.0
        standardView.deactivate()
        videoRecordView.deactivate()
        videoExportView.deactivate()
    }
    
    func handle_Step1(action: InterfaceSecondaryMenuAction,
                configuration: any InterfaceConfigurationConforming,
                reversed: Bool) {
    
        switch action.startAction {
        case .snapUpdateRows:
            standardView.snapRowContent(configuration: configuration)
        case .none:
            break
        }
        switch action.mainAction {
        case .none:
            break
        case .standardUpdateRows:
            standardView.animateRowContent_Step1(configuration: configuration,
                                                 reversed: reversed)
        case .transition:
            break
        case .snap(let pane):
            switch pane {
            case .standard:
                snapToStandard()
            case .zoom:
                snapToZoom()
            case .videoRecord:
                snapToVideoRecord()
            case .videoExport:
                snapToVideoExport()
            }
        }
    }
    
    func handle_Step2(action: InterfaceSecondaryMenuAction,
                      configuration: any InterfaceConfigurationConforming,
                      reversed: Bool,
                      time: CGFloat) {
    
        switch action.startAction {
        case .snapUpdateRows:
            break
        case .none:
            break
        }
        
        switch action.mainAction {
        case .none:
            break
        case .standardUpdateRows:
            standardView.animateRowContent_Step2(configuration: configuration,
                                                 reversed: reversed,
                                                 time: time)
        case .transition(let startPane, let endPane):
            switch startPane {
            case .standard:
                switch endPane {
                case .standard:
                    break
                case .zoom:
                    animateFromStandardToZoom(reversed: reversed, time: time)
                case .videoRecord:
                    animateFromStandardToVideoRecord(reversed: reversed, time: time)
                case .videoExport:
                    animateFromStandardToVideoExport(reversed: reversed, time: time)
                }
            case .zoom:
                switch endPane {
                case .standard:
                    animateFromZoomToStandard(reversed: reversed, time: time)
                case .zoom:
                    break
                case .videoRecord:
                    animateFromZoomToVideoRecord(reversed: reversed, time: time)
                case .videoExport:
                    animateFromZoomToVideoExport(reversed: reversed, time: time)
                }
            case .videoRecord:
                switch endPane {
                case .standard:
                    animateFromVideoRecordToStandard(reversed: reversed, time: time)
                case .zoom:
                    animateFromVideoRecordToZoom(reversed: reversed, time: time)
                case .videoRecord:
                    break
                case .videoExport:
                    animateFromVideoRecordToVideoExport(reversed: reversed, time: time)
                }
            case .videoExport:
                switch endPane {
                case .standard:
                    animateFromVideoExportToStandard(reversed: reversed, time: time)
                case .zoom:
                    animateFromVideoExportToZoom(reversed: reversed, time: time)
                case .videoRecord:
                    animateFromVideoExportToVideoRecord(reversed: reversed, time: time)
                case .videoExport:
                    break
                }
            }
        case .snap:
            break
        }
    }
}
