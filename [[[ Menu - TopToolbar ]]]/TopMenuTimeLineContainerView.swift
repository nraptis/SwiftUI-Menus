//
//  TopMenuTimeLineContainerView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import UIKit

class TopMenuTimeLineContainerView: UIView, TimeLineContainerConforming {

    func handleSelectedJiggleDidChange() {
        print("TopMenuTimeLineContainerView => handleSelectedJiggleDidChange")
        
    }
    
    func handleSelectedSwatchDidChange() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.timeLineSelectedSwatch {
            case .x:
                turnOnX()
                turnOffY()
                turnOffScale()
                turnOffRotation()
            case .y:
                turnOffX()
                turnOnY()
                turnOffScale()
                turnOffRotation()
            case .scale:
                turnOffX()
                turnOffY()
                turnOnScale()
                turnOffRotation()
            case .rotation:
                turnOffX()
                turnOffY()
                turnOffScale()
                turnOnRotation()
            }
        }
    }
    
    private func getSelectedX() -> Bool {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.timeLineSelectedSwatch {
            case .x:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
    
    private func getSelectedY() -> Bool {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.timeLineSelectedSwatch {
            case .y:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
    
    private func getSelectedScale() -> Bool {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.timeLineSelectedSwatch {
            case .scale:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
    
    private func getSelectedRotation() -> Bool {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.timeLineSelectedSwatch {
            case .rotation:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
    
    private func turnOffX() {
        if buttonX.isSelectedSwatch == true {
            buttonX.isSelectedSwatch = false
            buttonX.setNeedsDisplay()
        }
    }
    private func turnOnX() {
        if buttonX.isSelectedSwatch == false {
            buttonX.isSelectedSwatch = true
            buttonX.setNeedsDisplay()
        }
    }
    
    private func turnOffY() {
        if buttonY.isSelectedSwatch == true {
            buttonY.isSelectedSwatch = false
            buttonY.setNeedsDisplay()
        }
    }
    private func turnOnY() {
        if buttonY.isSelectedSwatch == false {
            buttonY.isSelectedSwatch = true
            buttonY.setNeedsDisplay()
        }
    }
    
    private func turnOffScale() {
        if buttonScale.isSelectedSwatch == true {
            buttonScale.isSelectedSwatch = false
            buttonScale.setNeedsDisplay()
        }
    }
    private func turnOnScale() {
        if buttonScale.isSelectedSwatch == false {
            buttonScale.isSelectedSwatch = true
            buttonScale.setNeedsDisplay()
        }
    }
    
    private func turnOffRotation() {
        if buttonRotation.isSelectedSwatch == true {
            buttonRotation.isSelectedSwatch = false
            buttonRotation.setNeedsDisplay()
        }
    }
    private func turnOnRotation() {
        if buttonRotation.isSelectedSwatch == false {
            buttonRotation.isSelectedSwatch = true
            buttonRotation.setNeedsDisplay()
        }
    }
    
    lazy var buttonXBottomConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonX, attribute: .bottom, relatedBy: .equal, toItem: self,
                           attribute: .bottom, multiplier: 1.0, constant: 0.0)
    }()
    lazy var buttonXHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonX, attribute: .height, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(44))
    }()
    lazy var buttonX: TimeLineButton = {
        let orientation = toolInterfaceViewModel.orientation
        let imageDark = ToolInterfaceTheme.timeLineButtonX(orientation: toolInterfaceViewModel.orientation, isDarkMode: true)
        let imageLight = ToolInterfaceTheme.timeLineButtonX(orientation: toolInterfaceViewModel.orientation, isDarkMode: false)
        let isSelectedSwatch = getSelectedX()
        let result = TimeLineButton(cornerRadius: 6,
                                    imageDark: imageDark,
                                    imageLight: imageLight,
                                    isSelectedSwatch: isSelectedSwatch)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var buttonYBottomConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonY, attribute: .bottom, relatedBy: .equal, toItem: self,
                           attribute: .bottom, multiplier: 1.0, constant: 0.0)
    }()
    lazy var buttonYHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonY, attribute: .height, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(44))
    }()
    lazy var buttonY: TimeLineButton = {
        let orientation = toolInterfaceViewModel.orientation
        let imageDark = ToolInterfaceTheme.timeLineButtonY(orientation: toolInterfaceViewModel.orientation, isDarkMode: true)
        let imageLight = ToolInterfaceTheme.timeLineButtonY(orientation: toolInterfaceViewModel.orientation, isDarkMode: false)
        let isSelectedSwatch = getSelectedY()
        let result = TimeLineButton(cornerRadius: 6,
                                    imageDark: imageDark,
                                    imageLight: imageLight,
                                    isSelectedSwatch: isSelectedSwatch)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var buttonScaleBottomConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonScale, attribute: .bottom, relatedBy: .equal, toItem: self,
                           attribute: .bottom, multiplier: 1.0, constant: 0.0)
    }()
    lazy var buttonScaleHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonScale, attribute: .height, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(44))
    }()
    lazy var buttonScale: TimeLineButton = {
        let orientation = toolInterfaceViewModel.orientation
        let imageDark = ToolInterfaceTheme.timeLineButtonScale(orientation: toolInterfaceViewModel.orientation, isDarkMode: true)
        let imageLight = ToolInterfaceTheme.timeLineButtonScale(orientation: toolInterfaceViewModel.orientation, isDarkMode: false)
        let isSelectedSwatch = getSelectedScale()
        let result = TimeLineButton(cornerRadius: 6,
                                    imageDark: imageDark,
                                    imageLight: imageLight,
                                    isSelectedSwatch: isSelectedSwatch)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var buttonRotationBottomConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonRotation, attribute: .bottom, relatedBy: .equal, toItem: self,
                           attribute: .bottom, multiplier: 1.0, constant: 0.0)
    }()
    lazy var buttonRotationHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: buttonRotation, attribute: .height, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(44))
    }()
    lazy var buttonRotation: TimeLineButton = {
        let orientation = toolInterfaceViewModel.orientation
        let imageDark = ToolInterfaceTheme.timeLineButtonRotation(orientation: toolInterfaceViewModel.orientation, isDarkMode: true)
        let imageLight = ToolInterfaceTheme.timeLineButtonRotation(orientation: toolInterfaceViewModel.orientation, isDarkMode: false)
        let isSelectedSwatch = getSelectedRotation()
        let result = TimeLineButton(cornerRadius: 6,
                                    imageDark: imageDark,
                                    imageLight: imageLight,
                                    isSelectedSwatch: isSelectedSwatch)
        result.translatesAutoresizingMaskIntoConstraints = false
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
        
        buttonX.setNeedsDisplay()
        buttonY.setNeedsDisplay()
        buttonScale.setNeedsDisplay()
        buttonRotation.setNeedsDisplay()
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
        
        
        let buttonWidth: Int
        let buttonHeight: Int
        let buttonSpacing: Int
        let buttonLeft: Int
        var buttonBottomY = -ToolInterfaceTheme.getTopTimeLineInsetBottom(orientation: orientation)
        switch orientation {
        case .landscape:
            buttonWidth = 66
            buttonHeight = 32
            buttonSpacing = 2
            buttonLeft = 2
            buttonBottomY -= 2
        case .portrait:
            buttonWidth = 66
            buttonHeight = 44
            buttonSpacing = 6
            buttonLeft = 2
            buttonBottomY -= 2
        }
        
        addSubview(buttonRotation)
        addConstraints([
            buttonRotation.leftAnchor.constraint(equalTo: timeLineClippingView.leftAnchor, constant: CGFloat(buttonLeft)),
            buttonRotationBottomConstraint
        ])
        buttonRotation.addConstraints([
            NSLayoutConstraint(item: buttonRotation, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(buttonWidth)),
            buttonRotationHeightConstraint
            
        ])
        buttonRotation.addTarget(self, action: #selector(clickRotation), for: .touchUpInside)
        buttonRotationBottomConstraint.constant = CGFloat(buttonBottomY)
        
        buttonBottomY -= buttonHeight
        buttonBottomY -= buttonSpacing
        
        addSubview(buttonScale)
        addConstraints([
            buttonScale.leftAnchor.constraint(equalTo: timeLineClippingView.leftAnchor, constant: CGFloat(buttonLeft)),
            buttonScaleBottomConstraint
        ])
        buttonScale.addConstraints([
            NSLayoutConstraint(item: buttonScale, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(buttonWidth)),
            buttonScaleHeightConstraint
            
        ])
        buttonScale.addTarget(self, action: #selector(clickScale), for: .touchUpInside)
        buttonScaleBottomConstraint.constant = CGFloat(buttonBottomY)
        
        buttonBottomY -= buttonHeight
        buttonBottomY -= buttonSpacing
        
        addSubview(buttonY)
        addConstraints([
            buttonY.leftAnchor.constraint(equalTo: timeLineClippingView.leftAnchor, constant: CGFloat(buttonLeft)),
            buttonYBottomConstraint
        ])
        buttonY.addConstraints([
            NSLayoutConstraint(item: buttonY, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(buttonWidth)),
            buttonYHeightConstraint
            
        ])
        buttonY.addTarget(self, action: #selector(clickY), for: .touchUpInside)
        buttonYBottomConstraint.constant = CGFloat(buttonBottomY)
        
        buttonBottomY -= buttonHeight
        buttonBottomY -= buttonSpacing
        
        addSubview(buttonX)
        addConstraints([
            buttonX.leftAnchor.constraint(equalTo: timeLineClippingView.leftAnchor, constant: CGFloat(buttonLeft)),
            buttonXBottomConstraint
            
        ])
        buttonX.addConstraints([
            NSLayoutConstraint(item: buttonX, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(buttonWidth)),
            buttonXHeightConstraint
            
        ])
        buttonX.addTarget(self, action: #selector(clickX), for: .touchUpInside)
        buttonXBottomConstraint.constant = CGFloat(buttonBottomY)
        
        let blockerHeight = ToolInterfaceTheme.getTopBlockerHeight(orientation: orientation,
                                                                   safeAreaTop: safeAreaTop)
        handleBlockerHeightOrSafeAreaDidChange(blockerHeight: blockerHeight,
                                               safeAreaTop: safeAreaTop,
                                               orientation: orientation)
    }
    
    @objc func clickX() {
        print("X Clicked")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            jiggleViewController.selectTimeLineSwatch(swatch: .x)
        }
        /*
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
        */
    }
    
    @objc func clickY() {
        print("Y Clicked")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            jiggleViewController.selectTimeLineSwatch(swatch: .y)
        }
        /*
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
        */
    }
    
    @objc func clickScale() {
        print("Scale Clicked")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            jiggleViewController.selectTimeLineSwatch(swatch: .scale)
        }
        /*
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
        */
    }
    
    @objc func clickRotation() {
        print("Rotation Clicked")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            jiggleViewController.selectTimeLineSwatch(swatch: .rotation)
        }
        /*
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
        */
    }
    
    func handleBlockerHeightOrSafeAreaDidChange(blockerHeight: Int,
                                                safeAreaTop: Int,
                                                orientation: Orientation) {
        
        let insetTop = ToolInterfaceTheme.getTopTimeLineInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopTimeLineInsetBottom(orientation: orientation)

        let availableSpace = MenuHeightCategoryPhoneTop.get(category: .timeLine, orientation: orientation) - insetTop - blockerHeight - insetBottom
        
        let buttonBaseHeight = availableSpace / 4
        
        var buttonHeightX = buttonBaseHeight
        var buttonHeightY = buttonBaseHeight
        var buttonHeightScale = buttonBaseHeight
        var buttonHeightRotation = buttonBaseHeight
        var spaceRemaining = availableSpace - (buttonHeightX + buttonHeightY + buttonHeightScale + buttonHeightRotation)
        
        var fudge = 0
        while spaceRemaining > 0 && fudge < 10 {
            if spaceRemaining > 0 {
                buttonHeightX += 1
                spaceRemaining -= 1
            }
            if spaceRemaining > 0 {
                buttonHeightY += 1
                spaceRemaining -= 1
            }
            if spaceRemaining > 0 {
                buttonHeightScale += 1
                spaceRemaining -= 1
            }
            if spaceRemaining > 0 {
                buttonHeightRotation += 1
                spaceRemaining -= 1
            }
            fudge += 1
        }
        
        var buttonY = -insetBottom
        
        buttonRotationBottomConstraint.constant = CGFloat(buttonY)
        buttonRotationHeightConstraint.constant = CGFloat(buttonHeightRotation)
        
        buttonY -= buttonHeightRotation
        
        buttonScaleBottomConstraint.constant = CGFloat(buttonY)
        buttonScaleHeightConstraint.constant = CGFloat(buttonHeightScale)
        
        buttonY -= buttonHeightScale
        
        buttonYBottomConstraint.constant = CGFloat(buttonY)
        buttonYHeightConstraint.constant = CGFloat(buttonHeightY)
        
        buttonY -= buttonHeightY
        
        buttonXBottomConstraint.constant = CGFloat(buttonY)
        buttonXHeightConstraint.constant = CGFloat(buttonHeightX)
    }
}
