//
//  MenuPartConforming.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/3/24.
//

import UIKit

protocol PrimaryOrSecondaryMenuConforming: AnyObject where Self: UIView {
    @MainActor var isModeAnimating: Bool { set get }
    
    associatedtype VideoRecordViewType: MenuPartWithRowsConforming
    @MainActor var videoRecordView: VideoRecordViewType { set get }
    @MainActor var videoRecordViewLeftConstraint: NSLayoutConstraint { set get }
    
    associatedtype VideoExportViewType: MenuPartWithRowsConforming
    @MainActor var videoExportView: VideoExportViewType { set get }
    @MainActor var videoExportViewLeftConstraint: NSLayoutConstraint { set get }
    
    associatedtype ZoomViewType: MenuPartWithRowsConforming
    @MainActor var zoomView: ZoomViewType { set get }
    @MainActor var zoomViewLeftConstraint: NSLayoutConstraint { set get }
}

// On iPad, this is the whole menu (except top and bottom book-ends)
// On iPhone, this is the top menu, all of it.
protocol PrimaryMenuConforming: AnyObject, PrimaryOrSecondaryMenuConforming where Self: UIView {
    associatedtype StandardContainerViewType: PrimaryMenuStandardContainerConforming
    @MainActor var standardContainerView: StandardContainerViewType { set get }
    @MainActor var standardContainerViewLeftConstraint: NSLayoutConstraint { set get }
}

// On iPhone, this is the bottom menu, all of it.
protocol SecondaryMenuConforming: AnyObject, PrimaryOrSecondaryMenuConforming where Self: UIView {
    associatedtype StandardViewType: MenuPartWithRowsConforming
    @MainActor var standardView: StandardViewType { set get }
    @MainActor var standardViewLeftConstraint: NSLayoutConstraint { set get }
}

protocol BottomMenuConforming: AnyObject, PrimaryOrSecondaryMenuConforming where Self: UIView {
    associatedtype StandardContainerViewType: MenuPartWithRowsConforming
    @MainActor var standardContainerView: StandardContainerViewType { set get }
    @MainActor var standardContainerViewLeftConstraint: NSLayoutConstraint { set get }
}

// On iPad, the whole menu is "PrimaryMenuStandardContainerConforming"
// There is an important difference

// On iphone, its the whole top menu, swutch to graph mode...
// On the ipad, it's not the whole "top menu"...

protocol PrimaryMenuStandardContainerConforming: AnyObject where Self: UIView {
    
    @MainActor var isModeAnimating: Bool { set get }
    
    @MainActor func handleDarkModeDidChange()
    @MainActor func handleSelectedJiggleDidChange()
    @MainActor func handleSelectedSwatchDidChange()
    
    associatedtype GraphContainerViewType: GraphContainerConforming
    @MainActor var graphContainerView: GraphContainerViewType { set get }
    @MainActor var graphContainerViewLeftConstraint: NSLayoutConstraint { set get }
    
    associatedtype TimeLineContainerViewType: TimeLineContainerConforming
    @MainActor var timeLineContainerView: TimeLineContainerViewType { set get }
    @MainActor var timeLineContainerViewLeftConstraint: NSLayoutConstraint { set get }
    
    // This is the *TOP* menu, which juggles along-side
    // the graph... It's either the graph or this...
    associatedtype TopMenuViewType: MenuPartWithRowsConforming
    @MainActor var topMenuView: TopMenuViewType { set get }
    @MainActor var topMenuViewLeftConstraint: NSLayoutConstraint { set get }
    
    // On the iPad, sometimes we want to:
    //  1.) Animate the graph and *NOT* animate the "top" menu
    //  2.) At the same time, animate the "bottom" menu.
    
    @MainActor func getSecondaryMenu() -> (any MenuPartWithRowsConforming)?
    
}

protocol GraphContainerConforming: AnyObject where Self: UIView {
    @MainActor var graphClippingView: GraphClippingView { set get }
    @MainActor var graphView: GraphView { set get }
}

protocol TimeLineContainerConforming: AnyObject where Self: UIView {
    @MainActor var timeLineClippingView: TimeLineClippingView { set get }
    @MainActor var timeLineView: TimeLineView { set get }
}

protocol MenuPartWithRowsConforming: AnyObject where Self: UIView {
    
    @MainActor var toolInterfaceLayoutRelay: ToolInterfaceLayoutRelay { get }
    
    @MainActor var rowViews: [ToolRowView] { get set }
    @MainActor var separatorViews: [UIView] { get set }
    
    @MainActor func getNumberOfRows() -> Int
    @MainActor func getToolRow(at index: Int) -> ToolRow?
    
    @MainActor func handleDarkModeDidChange()
}

extension MenuPartWithRowsConforming {
    
    @MainActor func _handleDarkModeDidChange() {
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
    
    @MainActor func handleDarkModeDidChange() {
        _handleDarkModeDidChange()
    }
    
    @MainActor private func getToolRows() -> [ToolRow] {
        let numberOfRows = getNumberOfRows()
        var toolRows = [ToolRow]()
        for rowIndex in 0..<numberOfRows {
            if let toolRow = getToolRow(at: rowIndex) {
                toolRows.append(toolRow)
            }
        }
        return toolRows
    }
    
    @MainActor func snapRowContent(configuration: any InterfaceConfigurationConforming) {
        let toolRows = getToolRows()
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.snapRowContent(configuration: configuration,
                                                  toolRows: toolRows)
        }
    }
    
    @MainActor func animateRowContent_Step1(configuration: any InterfaceConfigurationConforming, reversed: Bool) {
        let toolRows = getToolRows()
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.animateRowContent_Step1(configuration: configuration,
                                                           toolRows: toolRows,
                                                           reversed: reversed)
        }
    }
    
    @MainActor func animateRowContent_Step2(configuration: any InterfaceConfigurationConforming, reversed: Bool, time: CGFloat) {
        let toolRows = getToolRows()
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.animateRowContent_Step2(configuration: configuration,
                                                           toolRows: toolRows,
                                                           reversed: reversed,
                                                           time: time)
        }
    }
    
    @MainActor func setupRows(width: Int,
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
    
    @MainActor private func generateRowView(at index: Int, width: Int, orientation: Orientation) -> ToolRowView {
        
        if index >= 0 && index < getNumberOfRows() {
            if let toolRow = getToolRow(at: index) {
                if toolRow._widthConstraint == nil {
                    let rowView = ToolRowView(toolInterfaceLayoutRelay: toolInterfaceLayoutRelay,
                                              toolRow: toolRow,
                                              orientation: orientation)
                    let widthConstraint = toolRow.getWidthConstraint(rowView)
                    widthConstraint.constant = CGFloat(width)
                    rowView.addConstraint(widthConstraint)
                    
                    return rowView
                } else {
                    print("Fetched Row Twice @ \(index) And \(getNumberOfRows())")
                }
            }
        }
        
        let toolRow = ToolRow(slot: .unknown)
        let rowView = ToolRowView(toolInterfaceLayoutRelay: toolInterfaceLayoutRelay,
                                  toolRow: toolRow,
                                  orientation: orientation)
        let widthConstraint = toolRow.getWidthConstraint(rowView)
        widthConstraint.constant = CGFloat(width)
        rowView.addConstraint(widthConstraint)
        
        return rowView
    }
}

extension PrimaryMenuStandardContainerConforming {
    
    @MainActor func refreshGraphDisplay() {
        graphContainerView.graphClippingView.setNeedsDisplay()
        graphContainerView.graphView.setNeedsDisplay()
    }
    
    @MainActor func refreshTimeLineDisplay() {
        timeLineContainerView.timeLineClippingView.setNeedsDisplay()
        timeLineContainerView.timeLineView.setNeedsDisplay()
    }
    
    @MainActor func animateFromTopMenuToGraph(reversed: Bool, time: CGFloat) {
        timeLineContainerView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: topMenuView, previousConstraint: topMenuViewLeftConstraint,
                           currentView: graphContainerView, currentConstraint: graphContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }

    @MainActor func animateFromGraphToTopMenu(reversed: Bool, time: CGFloat) {
        timeLineContainerView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: graphContainerView, previousConstraint: graphContainerViewLeftConstraint,
                           currentView: topMenuView, currentConstraint: topMenuViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }

    @MainActor func animateFromTopMenuToTimeLine(reversed: Bool, time: CGFloat) {
        graphContainerView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: topMenuView, previousConstraint: topMenuViewLeftConstraint,
                           currentView: timeLineContainerView, currentConstraint: timeLineContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }

    @MainActor func animateFromTimeLineToTopMenu(reversed: Bool, time: CGFloat) {
        graphContainerView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: timeLineContainerView, previousConstraint: timeLineContainerViewLeftConstraint,
                           currentView: topMenuView, currentConstraint: topMenuViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }

    @MainActor func animateFromTimeLineToGraph(reversed: Bool, time: CGFloat) {
        topMenuView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: timeLineContainerView, previousConstraint: timeLineContainerViewLeftConstraint,
                           currentView: graphContainerView, currentConstraint: graphContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }

    @MainActor func animateFromGraphToTimeLine(reversed: Bool, time: CGFloat) {
        topMenuView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: graphContainerView, previousConstraint: graphContainerViewLeftConstraint,
                           currentView: timeLineContainerView, currentConstraint: timeLineContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }

    @MainActor func snapToTopMenu() {
        topMenuView.activate()
        topMenuViewLeftConstraint.constant = 0.0
        timeLineContainerView.deactivate()
        graphContainerView.deactivate()
    }

    @MainActor func snapToTimeLine() {
        timeLineContainerView.activate()
        timeLineContainerViewLeftConstraint.constant = 0.0
        topMenuView.deactivate()
        graphContainerView.deactivate()
    }

    @MainActor func snapToGraph() {
        graphContainerView.activate()
        graphContainerViewLeftConstraint.constant = 0.0
        topMenuView.deactivate()
        timeLineContainerView.deactivate()
    }
    
}

extension PrimaryMenuConforming {
    
    @MainActor func animateFromStandardToVideoExport(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardContainerView, previousConstraint: standardContainerViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoExportToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: standardContainerView, currentConstraint: standardContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromStandardToVideoRecord(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardContainerView, previousConstraint: standardContainerViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoRecordToStandard(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: standardContainerView, currentConstraint: standardContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoRecordToVideoExport(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoExportToVideoRecord(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoExportToZoom(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromZoomToVideoExport(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoRecordToZoom(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromZoomToVideoRecord(reversed: Bool, time: CGFloat) {
        standardContainerView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromStandardToZoom(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardContainerView, previousConstraint: standardContainerViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromZoomToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: standardContainerView, currentConstraint: standardContainerViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func snapToStandard() {
        standardContainerView.activate()
        standardContainerViewLeftConstraint.constant = 0.0
        videoRecordView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    @MainActor func snapToVideoRecord() {
        videoRecordView.activate()
        videoRecordViewLeftConstraint.constant = 0.0
        standardContainerView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    @MainActor func snapToVideoExport() {
        videoExportView.activate()
        videoExportViewLeftConstraint.constant = 0.0
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        zoomView.deactivate()
    }
    
    @MainActor func snapToZoom() {
        zoomView.activate()
        zoomViewLeftConstraint.constant = 0.0
        standardContainerView.deactivate()
        videoRecordView.deactivate()
        videoExportView.deactivate()
    }
    
    @MainActor func handle_Step1(actionPrimary: InterfacePrimaryMenuAction,
                      actionSecondary: InterfaceSecondaryMenuAction,
                      configuration: any InterfaceConfigurationConforming,
                      reversed: Bool) {
        switch actionPrimary.startAction {
        case .snapGraph:
            standardContainerView.snapToGraph()
        case .snapMenu:
            standardContainerView.snapToTopMenu()
            standardContainerView.topMenuView.snapRowContent(configuration: configuration)
            if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                secondaryMenu.snapRowContent(configuration: configuration)
            }
        case .snapTimeLine:
            standardContainerView.snapToTimeLine()
        case .none:
            break
        }
        
        switch actionPrimary.mainAction {
        case .none:
            switch actionSecondary.mainAction {
            case .standardUpdateRows:
                if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                    secondaryMenu.animateRowContent_Step1(configuration: configuration, reversed: reversed)
                }
            default:
                break
            }
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
            case .transition(let startPane, let endPane):
                switch startPane {
                case .menu:
                    switch endPane {
                    case .menu:
                        // Menu to Menu
                        break
                    case .graph:
                        // Menu to Graph
                        if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                            secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                                  reversed: reversed)
                        }
                    case .timeLine:
                        // Menu to TimeLine
                        if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                            secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                                  reversed: reversed)
                        }
                    }
                case .graph:
                    switch endPane {
                    case .menu:
                        // Graph to Menu
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
                    case .graph:
                        // Graph to Graph
                        break
                    case .timeLine:
                        // Graph to TimeLine
                        if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                            secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                                  reversed: reversed)
                        }
                    }
                case .timeLine:
                    switch endPane {
                    case .menu:
                        // TimeLine to Menu
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
                    case .graph:
                        // TimeLine to Graph
                        if let secondaryMenu = standardContainerView.getSecondaryMenu() {
                            secondaryMenu.animateRowContent_Step1(configuration: configuration,
                                                                  reversed: reversed)
                        }
                    case .timeLine:
                        // TimeLine to TimeLine
                        break
                    }
                }
            }
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
    
    @MainActor func handle_Step2(actionPrimary: InterfacePrimaryMenuAction,
                      actionSecondary: InterfaceSecondaryMenuAction,
                      configuration: any InterfaceConfigurationConforming,
                      reversed: Bool,
                      time: CGFloat) {
        switch actionPrimary.mainAction {
            
        case .none:
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
            case .transition(let startPane, let endPane):
                switch startPane {
                case .menu:
                    switch endPane {
                    case .menu:
                        // Menu to Menu
                        break
                    case .graph:
                        // Menu to Graph
                        standardContainerView.animateFromTopMenuToGraph(reversed: reversed, time: time)
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
                    case .timeLine:
                        // Menu to TimeLine
                        standardContainerView.animateFromTopMenuToTimeLine(reversed: reversed, time: time)
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
                case .graph:
                    switch endPane {
                    case .menu:
                        // Graph to Menu
                        standardContainerView.animateFromGraphToTopMenu(reversed: reversed, time: time)
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
                    case .graph:
                        // Graph to Graph
                        break
                    case .timeLine:
                        // Graph to TimeLine
                        standardContainerView.animateFromGraphToTimeLine(reversed: reversed, time: time)
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
                case .timeLine:
                    switch endPane {
                    case .menu:
                        // TimeLine to Menu
                        standardContainerView.animateFromTimeLineToTopMenu(reversed: reversed, time: time)
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
                    case .graph:
                        // TimeLine to Graph
                        standardContainerView.animateFromTimeLineToGraph(reversed: reversed, time: time)
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
                    case .timeLine:
                        // TimeLine to TimeLine
                        break
                    }
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
    
    @MainActor func animateFromStandardToVideoExport(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardView, previousConstraint: standardViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoExportToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: standardView, currentConstraint: standardViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromStandardToVideoRecord(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardView, previousConstraint: standardViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoRecordToStandard(reversed: Bool, time: CGFloat) {
        videoExportView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: standardView, currentConstraint: standardViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoRecordToVideoExport(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoExportToVideoRecord(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        zoomView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoExportToZoom(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoExportView, previousConstraint: videoExportViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromZoomToVideoExport(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoRecordView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoExportView, currentConstraint: videoExportViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromVideoRecordToZoom(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: videoRecordView, previousConstraint: videoRecordViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromZoomToVideoRecord(reversed: Bool, time: CGFloat) {
        standardView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: videoRecordView, currentConstraint: videoRecordViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromStandardToZoom(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: standardView, previousConstraint: standardViewLeftConstraint,
                           currentView: zoomView, currentConstraint: zoomViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func animateFromZoomToStandard(reversed: Bool, time: CGFloat) {
        videoRecordView.deactivate()
        videoExportView.deactivate()
        isModeAnimating = true
        transitionChildren(previousView: zoomView, previousConstraint: zoomViewLeftConstraint,
                           currentView: standardView, currentConstraint: standardViewLeftConstraint,
                           reversed: reversed, time: time) {
            self.isModeAnimating = false
        }
    }
    
    @MainActor func snapToStandard() {
        standardView.activate()
        standardViewLeftConstraint.constant = 0.0
        videoRecordView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    @MainActor func snapToVideoRecord() {
        videoRecordView.activate()
        videoRecordViewLeftConstraint.constant = 0.0
        standardView.deactivate()
        videoExportView.deactivate()
        zoomView.deactivate()
    }
    
    @MainActor func snapToVideoExport() {
        videoExportView.activate()
        videoExportViewLeftConstraint.constant = 0.0
        standardView.deactivate()
        videoRecordView.deactivate()
        zoomView.deactivate()
    }
    
    @MainActor func snapToZoom() {
        zoomView.activate()
        zoomViewLeftConstraint.constant = 0.0
        standardView.deactivate()
        videoRecordView.deactivate()
        videoExportView.deactivate()
    }
    
    @MainActor func handle_Step1(action: InterfaceSecondaryMenuAction,
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
    
    @MainActor func handle_Step2(action: InterfaceSecondaryMenuAction,
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
