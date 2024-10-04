//
//  DraggableMenuTimeLineContainerView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import UIKit

class DraggableMenuTimeLineContainerView: UIView, TimeLineContainerConforming {
    
    func skinButtonForSelected(button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 2.0
        button.backgroundColor = UIColor.blue
        button.setTitleColor(UIColor.white, for: .normal)
    }
    
    func skinButtonForNotSelected(button: UIButton) {
        button.layer.borderColor = UIColor.clear.cgColor
        button.layer.borderWidth = 0.0
        button.backgroundColor = UIColor.green
        button.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    func handleSelectedJiggleDidChange() {
        handleSelectedSwatchDidChange()
    }
    
    func handleSelectedSwatchDidChange() {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                let selectedSwatch = selectedJiggle.timeLine.selectedSwatch
                switch selectedSwatch.swatch {
                case .x:
                    skinButtonForSelected(button: buttonX)
                    skinButtonForNotSelected(button: buttonY)
                    skinButtonForNotSelected(button: buttonScale)
                    skinButtonForNotSelected(button: buttonRotation)
                case .y:
                    skinButtonForNotSelected(button: buttonX)
                    skinButtonForSelected(button: buttonY)
                    skinButtonForNotSelected(button: buttonScale)
                    skinButtonForNotSelected(button: buttonRotation)
                case .scale:
                    skinButtonForNotSelected(button: buttonX)
                    skinButtonForNotSelected(button: buttonY)
                    skinButtonForSelected(button: buttonScale)
                    skinButtonForNotSelected(button: buttonRotation)
                case .rotation:
                    skinButtonForNotSelected(button: buttonX)
                    skinButtonForNotSelected(button: buttonY)
                    skinButtonForNotSelected(button: buttonScale)
                    skinButtonForSelected(button: buttonRotation)
                }
                
            } else {
                skinButtonForNotSelected(button: buttonX)
                skinButtonForNotSelected(button: buttonY)
                skinButtonForNotSelected(button: buttonScale)
                skinButtonForNotSelected(button: buttonRotation)
            }
            
        }
        
    }
    
    lazy var buttonX: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eXXo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonY: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eYYo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonRotation: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eRRo", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonScale: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("eSKSKo", for: .normal)
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
    
    lazy var timeLineContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var timeLineClippingView: TimeLineClippingView = {
        let orientation = toolInterfaceViewModel.orientation
        let insetLeft = ToolInterfaceTheme.getDraggableMenuTimeLineInsetLeft()
        let insetRight = ToolInterfaceTheme.getDraggableMenuTimeLineInsetRight()
        let insetTop = ToolInterfaceTheme.getDraggableMenuTimeLineInsetTop()
        let insetBottom = ToolInterfaceTheme.getDraggableMenuTimeLineInsetBottom()
        let cornerRadius = ToolInterfaceTheme.getDraggableMenuTimeLineCornerRadius()
        let result = TimeLineClippingView(insetLeft: insetLeft, insetRight: insetRight, insetTop: insetTop,
                                       insetBottom: insetBottom, cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var timeLineView: TimeLineView = {
        let cornerRadius = ToolInterfaceTheme.getDraggableMenuTimeLineCornerRadius()
        let result = TimeLineView(cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    func handleDarkModeDidChange() {
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
        
        containerView.addSubview(timeLineContainerView)
        containerView.addConstraints([
            NSLayoutConstraint(item: timeLineContainerView, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineContainerView, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: timeLineContainerView, attribute: .width, relatedBy: .equal,
                               toItem: containerView, attribute: .width, multiplier: 1.0,
                               constant: 0.0)
        ])
        
        let insetLeft = ToolInterfaceTheme.getDraggableMenuTimeLineInsetLeft()
        let insetRight = ToolInterfaceTheme.getDraggableMenuTimeLineInsetRight()
        let insetTop = ToolInterfaceTheme.getDraggableMenuTimeLineInsetTop()
        let insetBottom = ToolInterfaceTheme.getDraggableMenuTimeLineInsetBottom()
        
        timeLineContainerView.addSubview(timeLineView)
        timeLineContainerView.addConstraints([
            NSLayoutConstraint(item: timeLineView, attribute: .left, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .left, multiplier: 1.0, constant: CGFloat(insetLeft)),
            NSLayoutConstraint(item: timeLineView, attribute: .right, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .right, multiplier: 1.0, constant: CGFloat(-insetRight)),
            NSLayoutConstraint(item: timeLineView, attribute: .top, relatedBy: .equal,
                               toItem: timeLineContainerView, attribute: .top, multiplier: 1.0, constant: CGFloat(insetTop)),
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
                               toItem: timeLineContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
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
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 96.0),
            NSLayoutConstraint(item: buttonX, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0),
            
        ])
        buttonX.addTarget(self, action: #selector(clickX), for: .touchUpInside)
        
        addSubview(buttonY)
        addConstraints([
            buttonY.leftAnchor.constraint(equalTo: leftAnchor),
            buttonY.topAnchor.constraint(equalTo: topAnchor, constant: 40.0)
        ])
        buttonY.addConstraints([
            NSLayoutConstraint(item: buttonY, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 96.0),
            NSLayoutConstraint(item: buttonY, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0),
            
        ])
        buttonY.addTarget(self, action: #selector(clickY), for: .touchUpInside)
        
        addSubview(buttonRotation)
        addConstraints([
            buttonRotation.leftAnchor.constraint(equalTo: leftAnchor),
            buttonRotation.topAnchor.constraint(equalTo: topAnchor, constant: 80.0)
        ])
        buttonRotation.addConstraints([
            NSLayoutConstraint(item: buttonRotation, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 96.0),
            NSLayoutConstraint(item: buttonRotation, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0),
            
        ])
        buttonRotation.addTarget(self, action: #selector(clickRotation), for: .touchUpInside)
        
        addSubview(buttonScale)
        addConstraints([
            buttonScale.leftAnchor.constraint(equalTo: leftAnchor),
            buttonScale.topAnchor.constraint(equalTo: topAnchor, constant: 120.0)
        ])
        buttonScale.addConstraints([
            NSLayoutConstraint(item: buttonScale, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 96.0),
            NSLayoutConstraint(item: buttonScale, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 40.0),
            
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
