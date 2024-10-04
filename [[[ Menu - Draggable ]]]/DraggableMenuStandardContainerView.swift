//
//  DraggableMenuStandardView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/25/24.
//

import UIKit

class DraggableMenuStandardContainerView: UIView, PrimaryMenuStandardContainerConforming {
    
    func handleSelectedJiggleDidChange() {
        timeLineContainerView.handleSelectedJiggleDidChange()
    }
    
    func handleSelectedSwatchDidChange() {
        timeLineContainerView.handleSelectedSwatchDidChange()
    }
    
    var isModeAnimating = false
    
    lazy var separatorTop: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
        return result
    }()
    
    lazy var topMenuViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: topMenuView, attribute: .left, relatedBy: .equal, toItem: self,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var topMenuView: DraggableMenuTopMenuView = {
        let result = DraggableMenuTopMenuView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var bottomMenuView: DraggableMenuBottomMenuView = {
        let result = DraggableMenuBottomMenuView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: graphContainerView, attribute: .left, relatedBy: .equal, toItem: self,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var graphContainerView: DraggableMenuGraphContainerView = {
        let result = DraggableMenuGraphContainerView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var timeLineContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: timeLineContainerView, attribute: .left, relatedBy: .equal, toItem: self,
                           attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var timeLineContainerView: DraggableMenuTimeLineContainerView = {
        let result = DraggableMenuTimeLineContainerView(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var separatorMiddle: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorMiddleDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorMiddleLight
        }
        return result
    }()
    
    lazy var separatorBottom: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
        return result
    }()
    
    func handleDarkModeDidChange() {
        
        topMenuView.handleDarkModeDidChange()
        bottomMenuView.handleDarkModeDidChange()
        
        graphContainerView.handleDarkModeDidChange()
        timeLineContainerView.handleDarkModeDidChange()
        
        if ApplicationController.isDarkModeEnabled {
            separatorTop.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            separatorTop.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
        if ApplicationController.isDarkModeEnabled {
            separatorMiddle.backgroundColor = ToolInterfaceTheme._separatorMiddleDark
        } else {
            separatorMiddle.backgroundColor = ToolInterfaceTheme._separatorMiddleLight
        }
        if ApplicationController.isDarkModeEnabled {
            separatorBottom.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentDark
        } else {
            separatorBottom.backgroundColor = ToolInterfaceTheme._separatorPadBarAdjacentLight
        }
    }
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(width: Int) {
        
        let orientation = toolInterfaceViewModel.orientation
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeight()
        let rowSeparatorHeightTop = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightTop()
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getDraggableMenuRowSeparatorHeightBottom()
        
        let topHalfRowCount = ToolInterfaceTheme.getDraggableMenuStandardTopHalfRowCount()
        let bottomHalfRowCount = ToolInterfaceTheme.getDraggableMenuStandardBottomHalfRowCount()
        
        // Top half is this:
        var topHalfHeight = (topHalfRowCount * rowHeight)
        if topHalfRowCount > 1 {
            topHalfHeight += (rowSeparatorHeight) * (topHalfRowCount - 1)
        }
        
        var bottomHalfHeight = (bottomHalfRowCount * rowHeight)
        if bottomHalfRowCount > 1 {
            bottomHalfHeight += (rowSeparatorHeight) * (bottomHalfRowCount - 1)
        }
        
        var toolRowY = 0
        addSubview(separatorTop)
        addConstraints([
            NSLayoutConstraint(item: separatorTop, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        separatorTop.addConstraint(NSLayoutConstraint(item: separatorTop, attribute: .height, relatedBy: .equal, toItem: nil,
                                                      attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightTop)))
        
        toolRowY += rowSeparatorHeightTop
        
        addSubview(topMenuView)
        addConstraints([
            topMenuViewLeftConstraint,
            NSLayoutConstraint(item: topMenuView, attribute: .width, relatedBy: .equal, toItem: self,
                               attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topMenuView, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        topMenuView.addConstraint(NSLayoutConstraint(item: topMenuView, attribute: .height, 
                                                              relatedBy: .equal, toItem: nil, attribute: .notAnAttribute,
                                                              multiplier: 1.0, constant: CGFloat(topHalfHeight)))
        
        addSubview(graphContainerView)
        addConstraints([
            graphContainerViewLeftConstraint,
            NSLayoutConstraint(item: graphContainerView, attribute: .width, relatedBy: .equal, toItem: self,
                               attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        graphContainerView.addConstraint(NSLayoutConstraint(item: graphContainerView, attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0, constant: CGFloat(topHalfHeight)))
        
        addSubview(timeLineContainerView)
        addConstraints([
            timeLineContainerViewLeftConstraint,
            NSLayoutConstraint(item: timeLineContainerView, attribute: .width, relatedBy: .equal, toItem: self,
                               attribute: .width, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineContainerView, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        timeLineContainerView.addConstraint(NSLayoutConstraint(item: timeLineContainerView, attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0, constant: CGFloat(topHalfHeight)))
        
        toolRowY += topHalfHeight
        
        addSubview(separatorMiddle)
        addConstraints([
            NSLayoutConstraint(item: separatorMiddle, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorMiddle, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorMiddle, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        separatorMiddle.addConstraint(NSLayoutConstraint(item: separatorMiddle, attribute: .height, relatedBy: .equal, toItem: nil,
                                                      attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeight)))
        
       
        toolRowY += rowSeparatorHeight
        
        
        addSubview(bottomMenuView)
        addConstraints([
            NSLayoutConstraint(item: bottomMenuView, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomMenuView, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomMenuView, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        bottomMenuView.addConstraint(NSLayoutConstraint(item: bottomMenuView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                                 attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(bottomHalfHeight)))
        
        addSubview(separatorBottom)
        addConstraints([
            NSLayoutConstraint(item: separatorBottom, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        separatorBottom.addConstraint(NSLayoutConstraint(item: separatorBottom, attribute: .height, relatedBy: .equal, toItem: nil,
                                                         attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightBottom)))
        
        graphContainerView.setup(width: width)
        timeLineContainerView.setup(width: width)
        topMenuView.setup(width: width)
        bottomMenuView.setup(width: width)
    }
    
    func getSecondaryMenu() -> (any MenuPartWithRowsConforming)? {
        return bottomMenuView
    }
    
}
