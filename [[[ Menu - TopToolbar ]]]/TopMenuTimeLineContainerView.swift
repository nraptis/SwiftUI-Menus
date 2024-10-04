//
//  TopMenuTimeLineContainerView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import UIKit

class TopMenuTimeLineContainerView: UIView, TimeLineContainerConforming {

    func handleSelectedJiggleDidChange() {
        print("DraggableMenuStandardContainerView => handleSelectedJiggleDidChange")
        
    }
    
    func handleSelectedSwatchDidChange() {
        print("DraggableMenuStandardContainerView => handleSelectedSwatchDidChange")
    }
    
    lazy var buttonX: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eXo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonY: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eYo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonRotation: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eRo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonScale: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eSKo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
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
    
    lazy var timeLineContainerViewLeftConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: timeLineContainerView, attribute: .left, relatedBy: .equal,
                           toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var timeLineContainerViewWidthConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: timeLineContainerView, attribute: .width, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var timeLineContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var timeLineClippingView: TimeLineClippingView = {
        let orientation = toolInterfaceViewModel.orientation
        let insetLeft = ToolInterfaceTheme.getTopTimeLineInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getTopTimeLineInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getTopTimeLineInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopTimeLineInsetBottom(orientation: orientation)
        let cornerRadius = ToolInterfaceTheme.getTopTimeLineCornerRadius(orientation: orientation)
        let result = TimeLineClippingView(insetLeft: insetLeft, insetRight: insetRight, insetTop: insetTop,
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
    
    lazy var timeLineView: TimeLineView = {
        let orientation = toolInterfaceViewModel.orientation
        let cornerRadius = ToolInterfaceTheme.getTopTimeLineCornerRadius(orientation: orientation)
        let result = TimeLineView(cornerRadius: cornerRadius)
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
        timeLineClippingView.setNeedsDisplay()
        timeLineView.setNeedsDisplay()
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
        let timeLineContainerLeft = safeAreaLeft
        let timeLineContainerWidth = (width) - (safeAreaRight + timeLineContainerLeft)
        timeLineContainerViewWidthConstraint.constant = CGFloat(timeLineContainerWidth)
        timeLineContainerViewLeftConstraint.constant = CGFloat(timeLineContainerLeft)
    }
    
    func setup(width: Int,
               safeAreaLeft: Int,
               safeAreaRight: Int,
               safeAreaTop: Int) {
        
        let orientation = toolInterfaceViewModel.orientation
        
        let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        
        let timeLineContainerHeight = MenuHeightCategoryPhoneTop.get(category: .timeLine, orientation: orientation)
        let sideMenuHeight = (timeLineContainerHeight - rowSeparatorHeightTop - rowSeparatorHeightBottom)
        
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
        
        //timeLineContainerHeight
        
        let separatorOffsetY = (timeLineContainerHeight - (rowSeparatorHeightTop))
        
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
        
        containerView.addSubview(timeLineContainerView)
        containerView.addConstraints([
            timeLineContainerViewLeftConstraint,
            NSLayoutConstraint(item: timeLineContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-rowSeparatorHeightBottom)),
            timeLineContainerViewWidthConstraint
        ])
        timeLineContainerView.addConstraint(NSLayoutConstraint(item: timeLineContainerView,
                                                            attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0, constant: CGFloat(sideMenuHeight)))
        
        let timeLineContainerLeft = safeAreaLeft
        let timeLineContainerWidth = (width) - (safeAreaRight + timeLineContainerLeft)
        timeLineContainerViewWidthConstraint.constant = CGFloat(timeLineContainerWidth)
        timeLineContainerViewLeftConstraint.constant = CGFloat(timeLineContainerLeft)
        
        timeLineContainerView.addSubview(dragBlockerView)
        timeLineContainerView.addConstraints([
            NSLayoutConstraint(item: dragBlockerView, attribute: .left, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dragBlockerView, attribute: .right, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dragBlockerView, attribute: .top, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            
        ])
        dragBlockerView.addConstraint(dragBlockerViewHeightConstraint)
        
        let insetLeft = ToolInterfaceTheme.getTopTimeLineInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getTopTimeLineInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getTopTimeLineInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopTimeLineInsetBottom(orientation: orientation)
        
        timeLineContainerView.addSubview(timeLineView)
        timeLineContainerView.addConstraints([
            NSLayoutConstraint(item: timeLineView, attribute: .left, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .left, multiplier: 1.0, constant: CGFloat(insetLeft)),
            NSLayoutConstraint(item: timeLineView, attribute: .right, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .right, multiplier: 1.0, constant: CGFloat(-insetRight)),
            NSLayoutConstraint(item: timeLineView, attribute: .top, relatedBy: .equal,
                               toItem: dragBlockerView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(insetTop)),
            NSLayoutConstraint(item: timeLineView, attribute: .bottom, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(-insetBottom))
        ])
        
        timeLineContainerView.addSubview(timeLineClippingView)
        timeLineContainerView.addConstraints([
            NSLayoutConstraint(item: timeLineClippingView, attribute: .left, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineClippingView, attribute: .right, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineClippingView, attribute: .top, relatedBy: .equal,
                               toItem: dragBlockerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineClippingView, attribute: .bottom, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        
        
        addSubview(buttonX)
        addConstraints([
            buttonX.leftAnchor.constraint(equalTo: leftAnchor),
            buttonX.topAnchor.constraint(equalTo: topAnchor, constant: 0.0)
        ])
        buttonX.addConstraints([
            NSLayoutConstraint(item: buttonX, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 66.0),
            NSLayoutConstraint(item: buttonX, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0),
            
        ])
        buttonX.addTarget(self, action: #selector(clickX), for: .touchUpInside)
        
        addSubview(buttonY)
        addConstraints([
            buttonY.leftAnchor.constraint(equalTo: leftAnchor),
            buttonY.topAnchor.constraint(equalTo: topAnchor, constant: 30.0)
        ])
        buttonY.addConstraints([
            NSLayoutConstraint(item: buttonY, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 66.0),
            NSLayoutConstraint(item: buttonY, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0),
            
        ])
        buttonY.addTarget(self, action: #selector(clickY), for: .touchUpInside)
        
        addSubview(buttonRotation)
        addConstraints([
            buttonRotation.leftAnchor.constraint(equalTo: leftAnchor),
            buttonRotation.topAnchor.constraint(equalTo: topAnchor, constant: 60.0)
        ])
        buttonRotation.addConstraints([
            NSLayoutConstraint(item: buttonRotation, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 66.0),
            NSLayoutConstraint(item: buttonRotation, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0),
            
        ])
        buttonRotation.addTarget(self, action: #selector(clickRotation), for: .touchUpInside)
        
        addSubview(buttonScale)
        addConstraints([
            buttonScale.leftAnchor.constraint(equalTo: leftAnchor),
            buttonScale.topAnchor.constraint(equalTo: topAnchor, constant: 90.0)
        ])
        buttonScale.addConstraints([
            NSLayoutConstraint(item: buttonScale, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 66.0),
            NSLayoutConstraint(item: buttonScale, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 30.0),
            
        ])
        buttonScale.addTarget(self, action: #selector(clickScale), for: .touchUpInside)
        
        
    }
    
    @objc func clickX() {
        print("X Clicked")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            let jiggleViewModel = jiggleViewController.jiggleViewModel
            let selectedJiggle = jiggleViewModel.getSelectedJiggle()
            if let selectedJiggle = selectedJiggle {
                selectedJiggle.timeLine.selectedSwatch = selectedJiggle.timeLine.swatchPositionX
                if let jiggleDocument = ApplicationController.shared.jiggleDocument {
                    jiggleDocument.selectedTimeLineSwatchUpdatePublisher.send(())
                }
            }
            jiggleViewController.toolInterfaceViewModel.handleTimelinePointCountDidChange()
            jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
        }
    }
    
    @objc func clickY() {
        print("Y Clicked")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            let jiggleViewModel = jiggleViewController.jiggleViewModel
            let selectedJiggle = jiggleViewModel.getSelectedJiggle()
            if let selectedJiggle = selectedJiggle {
                selectedJiggle.timeLine.selectedSwatch = selectedJiggle.timeLine.swatchPositionY
                if let jiggleDocument = ApplicationController.shared.jiggleDocument {
                    jiggleDocument.selectedTimeLineSwatchUpdatePublisher.send(())
                }
            }
            jiggleViewController.toolInterfaceViewModel.handleTimelinePointCountDidChange()
            jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
        }
    }
    
    @objc func clickScale() {
        print("Scale Clicked")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            let jiggleViewModel = jiggleViewController.jiggleViewModel
            let selectedJiggle = jiggleViewModel.getSelectedJiggle()
            if let selectedJiggle = selectedJiggle {
                selectedJiggle.timeLine.selectedSwatch = selectedJiggle.timeLine.swatchScale
                if let jiggleDocument = ApplicationController.shared.jiggleDocument {
                    jiggleDocument.selectedTimeLineSwatchUpdatePublisher.send(())
                }
            }
            jiggleViewController.toolInterfaceViewModel.handleTimelinePointCountDidChange()
            jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
        }
    }
    
    @objc func clickRotation() {
        print("Rotation Clicked")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            let jiggleViewModel = jiggleViewController.jiggleViewModel
            let selectedJiggle = jiggleViewModel.getSelectedJiggle()
            if let selectedJiggle = selectedJiggle {
                selectedJiggle.timeLine.selectedSwatch = selectedJiggle.timeLine.swatchRotation
                if let jiggleDocument = ApplicationController.shared.jiggleDocument {
                    jiggleDocument.selectedTimeLineSwatchUpdatePublisher.send(())
                }
            }
            jiggleViewController.toolInterfaceViewModel.handleTimelinePointCountDidChange()
            jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
            
        }
    }
    
}
