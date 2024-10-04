//
//  DraggableMenuStandardGraphMenuContainerView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import UIKit

class DraggableMenuGraphContainerView: UIView, GraphContainerConforming {
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphClippingView: GraphClippingView = {
        let orientation = toolInterfaceViewModel.orientation
        let insetLeft = ToolInterfaceTheme.getDraggableMenuGraphInsetLeft()
        let insetRight = ToolInterfaceTheme.getDraggableMenuGraphInsetRight()
        let insetTop = ToolInterfaceTheme.getDraggableMenuGraphInsetTop()
        let insetBottom = ToolInterfaceTheme.getDraggableMenuGraphInsetBottom()
        let cornerRadius = ToolInterfaceTheme.getDraggableMenuGraphCornerRadius()
        let result = GraphClippingView(insetLeft: insetLeft, insetRight: insetRight, insetTop: insetTop,
                                       insetBottom: insetBottom, cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphView: GraphView = {
        let cornerRadius = ToolInterfaceTheme.getDraggableMenuGraphCornerRadius()
        let result = GraphView(cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    func handleDarkModeDidChange() {
        graphClippingView.setNeedsDisplay()
        graphView.setNeedsDisplay()
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
        
        containerView.addSubview(graphContainerView)
        containerView.addConstraints([
            NSLayoutConstraint(item: graphContainerView, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .width, relatedBy: .equal,
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0)
        ])
        
        let insetLeft = ToolInterfaceTheme.getDraggableMenuGraphInsetLeft()
        let insetRight = ToolInterfaceTheme.getDraggableMenuGraphInsetRight()
        let insetTop = ToolInterfaceTheme.getDraggableMenuGraphInsetTop()
        let insetBottom = ToolInterfaceTheme.getDraggableMenuGraphInsetBottom()
        
        graphContainerView.addSubview(graphView)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: graphView, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: CGFloat(insetLeft)),
            NSLayoutConstraint(item: graphView, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: CGFloat(-insetRight)),
            NSLayoutConstraint(item: graphView, attribute: .top, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0, constant: CGFloat(insetTop)),
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
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
    }
}
