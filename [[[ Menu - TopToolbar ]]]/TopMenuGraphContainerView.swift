//
//  TopMenuGraphContainerView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/27/24.
//

import UIKit

class TopMenuGraphContainerView: UIView, GraphContainerConforming {

    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var separatorTop: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneInterfaceAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneInterfaceAdjacentLight
        }
        return result
    }()
    
    lazy var graphContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: graphContainerView, attribute: .left, relatedBy: .equal,
                           toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var graphContainerViewWidthConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: graphContainerView, attribute: .width, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var graphContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphClippingView: GraphClippingView = {
        let orientation = toolInterfaceViewModel.orientation
        let insetLeft = ToolInterfaceTheme.getTopGraphInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getTopGraphInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getTopGraphInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopGraphInsetBottom(orientation: orientation)
        let cornerRadius = ToolInterfaceTheme.getTopGraphCornerRadius(orientation: orientation)
        let result = GraphClippingView(insetLeft: insetLeft, insetRight: insetRight, insetTop: insetTop,
                                       insetBottom: insetBottom, cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var dragBlockerViewHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: dragBlockerView, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0)
    }()
    
    lazy var dragBlockerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphView: GraphView = {
        let orientation = toolInterfaceViewModel.orientation
        let cornerRadius = ToolInterfaceTheme.getTopGraphCornerRadius(orientation: orientation)
        let result = GraphView(cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var separatorBottom: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        if ApplicationController.isDarkModeEnabled {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneSceneAdjacentDark
        } else {
            result.backgroundColor = ToolInterfaceTheme._separatorPhoneSceneAdjacentLight
        }
        return result
    }()
    
    func handleDarkModeDidChange() {
        if ApplicationController.isDarkModeEnabled {
            separatorTop.backgroundColor = ToolInterfaceTheme._separatorPhoneInterfaceAdjacentDark
        } else {
            separatorTop.backgroundColor = ToolInterfaceTheme._separatorPhoneInterfaceAdjacentLight
        }
        if ApplicationController.isDarkModeEnabled {
            separatorBottom.backgroundColor = ToolInterfaceTheme._separatorPhoneSceneAdjacentDark
        } else {
            separatorBottom.backgroundColor = ToolInterfaceTheme._separatorPhoneSceneAdjacentLight
        }
        graphClippingView.setNeedsDisplay()
        graphView.setNeedsDisplay()
        print("TopMenuGraphContainerView ==> handleDarkModeDidChange")
    }
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handleSafeArea(width: Int, safeAreaLeft: Int, safeAreaRight: Int, safeAreaTop: Int) {
        let graphContainerLeft = safeAreaLeft
        let graphContainerWidth = (width) - (safeAreaRight + graphContainerLeft)
        graphContainerViewWidthConstraint.constant = CGFloat(graphContainerWidth)
        graphContainerViewLeftConstraint.constant = CGFloat(graphContainerLeft)
    }
    
    func setup(width: Int,
               safeAreaLeft: Int,
               safeAreaRight: Int,
               safeAreaTop: Int) {
        
        let orientation = toolInterfaceViewModel.orientation
        
        let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        
        let graphContainerHeight = MenuHeightCategoryPhoneTop.get(category: .graph, orientation: orientation)
        let sideMenuHeight = (graphContainerHeight - rowSeparatorHeightTop - rowSeparatorHeightBottom)
        
        addSubview(containerView)
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        //graphContainerHeight
        
        let separatorOffsetY = (graphContainerHeight - (rowSeparatorHeightTop))
        
        containerView.addSubview(separatorTop)
        containerView.addConstraints([
            NSLayoutConstraint(item: separatorTop, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-separatorOffsetY)),
        ])
        separatorTop.addConstraint(NSLayoutConstraint(item: separatorTop, attribute: .height, relatedBy: .equal, toItem: nil,
                                                      attribute: .notAnAttribute, multiplier: 1.0,
                                                      constant: CGFloat(rowSeparatorHeightTop)))
        
        containerView.addSubview(separatorBottom)
        containerView.addConstraints([
            NSLayoutConstraint(item: separatorBottom, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        separatorBottom.addConstraint(NSLayoutConstraint(item: separatorBottom, attribute: .height, relatedBy: .equal, toItem: nil,
                                                         attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightBottom)))
        
        containerView.addSubview(graphContainerView)
        containerView.addConstraints([
            graphContainerViewLeftConstraint,
            NSLayoutConstraint(item: graphContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-rowSeparatorHeightBottom)),
            graphContainerViewWidthConstraint
        ])
        graphContainerView.addConstraint(NSLayoutConstraint(item: graphContainerView,
                                                            attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0, constant: CGFloat(sideMenuHeight)))
        
        let graphContainerLeft = safeAreaLeft
        let graphContainerWidth = (width) - (safeAreaRight + graphContainerLeft)
        graphContainerViewWidthConstraint.constant = CGFloat(graphContainerWidth)
        graphContainerViewLeftConstraint.constant = CGFloat(graphContainerLeft)
        
        graphContainerView.addSubview(dragBlockerView)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: dragBlockerView, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dragBlockerView, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dragBlockerView, attribute: .top, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            
        ])
        dragBlockerView.addConstraint(dragBlockerViewHeightConstraint)
        
        let insetLeft = ToolInterfaceTheme.getTopGraphInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getTopGraphInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getTopGraphInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopGraphInsetBottom(orientation: orientation)
        
        graphContainerView.addSubview(graphView)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: graphView, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: CGFloat(insetLeft)),
            NSLayoutConstraint(item: graphView, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: CGFloat(-insetRight)),
            NSLayoutConstraint(item: graphView, attribute: .top, relatedBy: .equal,
                               toItem: dragBlockerView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(insetTop)),
            NSLayoutConstraint(item: graphView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(-insetBottom))
        ])
        
        graphContainerView.addSubview(graphClippingView)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: graphClippingView, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .top, relatedBy: .equal,
                               toItem: dragBlockerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
    }
}
