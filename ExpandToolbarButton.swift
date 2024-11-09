//
//  ExpandToolbarButton.swift
//  Bounce
//
//  Created by Raptis, Nicholas on 9/28/17.
//  Copyright © 2017 Darkswarm LLC. All rights reserved.
//

import UIKit

class ExpandToolbarButton: DrawableButton, UIGestureRecognizerDelegate {
    
    static let imageFrameDark = UIImage(named: "phone_ec_box_dark") ?? UIImage()
    static let imageFrameDarkPressed = UIImage(named: "phone_ec_box_dark_pressed") ?? UIImage()
    
    static let imageFrameLight = UIImage(named: "phone_ec_box_light") ?? UIImage()
    static let imageFrameLightPressed = UIImage(named: "phone_ec_box_light_pressed") ?? UIImage()
    
    static let imageArrowDownDark = UIImage(named: "phone_ec_arrow_down_dark") ?? UIImage()
    static let imageArrowDownLight = UIImage(named: "phone_ec_arrow_down_light") ?? UIImage()
    
    static let imageArrowUpDark = UIImage(named: "phone_ec_arrow_up_dark") ?? UIImage()
    static let imageArrowUpLight = UIImage(named: "phone_ec_arrow_up_light") ?? UIImage()
    
    lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        let result = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        return result
    }()
    
    var isDragging = false
    var dragStartGestureX = CGFloat(0.0)
    var dragStartConstraintLeft = CGFloat(0.0)

    let isAtTopOfScreen: Bool
    var isUpArrow: Bool = false
    
    var masterBoundsWidth = CGFloat(320.0)
    var masterSafeAreaLeft = CGFloat(0.0)
    var masterSafeAreaRight = CGFloat(0.0)
    
    lazy var renderContent: ExpandToolbarButtonRenderContent = {
       let result = ExpandToolbarButtonRenderContent(expandToolbarButton: self,
                                                     isAtTopOfScreen: isAtTopOfScreen)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    weak var leftConstraint: NSLayoutConstraint?
    required init(isAtTopOfScreen: Bool) {
        self.isAtTopOfScreen = isAtTopOfScreen
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        setNeedsDisplay()
        
        longPressRecognizer.cancelsTouchesInView = true
        longPressRecognizer.delegate = self
        addGestureRecognizer(longPressRecognizer)
        
        clipsToBounds = false
        
        addSubview(renderContent)
        renderContent.isUserInteractionEnabled = false
        addConstraints([
            renderContent.leftAnchor.constraint(equalTo: leftAnchor, constant: -16.0),
            renderContent.rightAnchor.constraint(equalTo: rightAnchor, constant: 16.0),
            renderContent.topAnchor.constraint(equalTo: topAnchor, constant: -16.0),
            renderContent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 16.0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(top: Bool) {
        super.setUp()
    }
    
    func update(deltaTime: Float) {
        
        renderContent.update(deltaTime: deltaTime,
                             isDragging: isDragging)
    }
    
    @objc func handleLongPress() {
        guard let rootViewController = ApplicationController.rootViewController else {
            return
        }
            
        guard let rootView = rootViewController.view else {
            return
        }
        let point = longPressRecognizer.location(in: rootView)
        switch(longPressRecognizer.state) {
        case .began:
            dragStartGestureX = point.x
            dragStartConstraintLeft = 0.0
            if let leftConstraint = leftConstraint {
                dragStartConstraintLeft = leftConstraint.constant
            }
            isDragging = true
            break
        case .changed:
            if isDragging {
                
                print("=.=.=.=")
                
                print("BBB masterBoundsWidth = \(masterBoundsWidth)")
                print("BBB masterSafeAreaLeft = \(masterSafeAreaLeft)")
                print("BBB masterSafeAreaRight = \(masterSafeAreaRight)")
                
                print("=.=.=.=")
                
                if let leftConstraint = leftConstraint {
                    let dragMaxX = masterBoundsWidth - bounds.width - masterSafeAreaRight
                    let dragMinX = masterSafeAreaLeft
                    var newLeft = dragStartConstraintLeft + (point.x - dragStartGestureX)
                    if newLeft < dragMinX { newLeft = dragMinX }
                    if newLeft > dragMaxX { newLeft = dragMaxX }
                    leftConstraint.constant = newLeft
                    renderContent.updateTransform()
                }
            }
            break
        default:
            isDragging = false
            break
        }
    }
    
    @objc override internal func didToggleControlState() {
        super.didToggleControlState()
        if isPressed {
            renderContent.alpha = 0.75
        } else {
            renderContent.alpha = 1.0
        }
    }
}
