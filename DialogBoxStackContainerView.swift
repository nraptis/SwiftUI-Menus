//
//  AlertStackView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/19/24.
//

import UIKit

class DialogBoxStackContainerView: UIView {
    
    
    static func getDialogWidth() -> Int {
        return 280
        /*
        if Device.isPad {
            return 320
        } else {
            
        }
        */
    }
    
    static func getMaxDialogHeight(orientation: Orientation,
                                   screenHeight: Int,
                                   safeAreaTop: Int,
                                   safeAreaBottom: Int) -> Int {
        let maxSafeArea = max(safeAreaTop, safeAreaBottom)
        let extraPadding: Int
        if Device.isPad {
            extraPadding = 120
        } else {
            if orientation.isLandscape {
                extraPadding = 12
            } else {
                extraPadding = 72
            }
        }
        
        var result = screenHeight
        result -= (maxSafeArea + extraPadding) * 2
        return result
    }
    
    static func getPushInOffsetX(orientation: Orientation,
                                 screenWidth: Int,
                                 screenHeight: Int,
                                 safeAreaLeft: Int,
                                 safeAreaRight: Int,
                                 safeAreaTop: Int,
                                 safeAreaBottom: Int) -> Int {
        if orientation.isPortrait {
            return 0
        } else {
            return 120
        }
    }
    
    static func getPushInOffsetY(orientation: Orientation,
                                 screenWidth: Int,
                                 screenHeight: Int,
                                 safeAreaLeft: Int,
                                 safeAreaRight: Int,
                                 safeAreaTop: Int,
                                 safeAreaBottom: Int) -> Int {
        if orientation.isPortrait {
            return 120
        } else {
            return 0
        }
    }
    
    static func getPushOutOffsetX(orientation: Orientation,
                                  screenWidth: Int,
                                  screenHeight: Int,
                                  safeAreaLeft: Int,
                                  safeAreaRight: Int,
                                  safeAreaTop: Int,
                                  safeAreaBottom: Int) -> Int {
        if orientation.isPortrait {
            return 0
        } else {
            return -120
        }
    }
    
    static func getPushOutOffsetY(orientation: Orientation,
                                  screenWidth: Int,
                                  screenHeight: Int,
                                  safeAreaLeft: Int,
                                  safeAreaRight: Int,
                                  safeAreaTop: Int,
                                  safeAreaBottom: Int) -> Int {
        if orientation.isPortrait {
            return -120
        } else {
            return 0
        }
    }
    
    let keyboardHandler = KeyboardHandler()
    
    lazy var buttonPush1: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("Push 1", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonPush2: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("Push 2", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonPush3: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("Push 3", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonPopAll: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("Pop All", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    lazy var buttonPopCurrent: UIButton = {
        let result = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.setTitle("Pop Curr", for: .normal)
        result.backgroundColor = UIColor.green
        result.layer.cornerRadius = 16.0
        result.clipsToBounds = true
        result.setTitleColor(UIColor.black, for: .normal)
        return result
    }()
    
    var isAnimatingStackIn = false
    var isAnimatingStackOut = false
    var isAnimatingDialogIn = false
    var isAnimatingDialogOut = false
    var isAnimatingScreenRotation = false
    
    
    var dialogBoxViews = [DialogBoxView]()
    
    var orientation = Orientation.landscape
    var screenWidth = 0
    var screenHeight = 0
    var safeAreaLeft = 0
    var safeAreaRight = 0
    var safeAreaTop = 0
    var safeAreaBottom = 0
    
    lazy var dialogBoxContainerViewCenterYConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: dialogBoxContainerView, attribute: .centerY, relatedBy: .equal, toItem: self,
                           attribute: .centerY, multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var dialogBoxContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var tapGestureRecognizer: UITapGestureRecognizer = {
        let result = UITapGestureRecognizer(target: self, action: #selector(didTap(_:)))
        result.delegate = self
        result.cancelsTouchesInView = false
        result.numberOfTapsRequired = 1
        result.delaysTouchesEnded = false
        return result
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(dialogBoxContainerView)
        dialogBoxContainerView.addConstraints([
            NSLayoutConstraint(item: dialogBoxContainerView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 4096.0),
            NSLayoutConstraint(item: dialogBoxContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 4096.0),
        ])
        addConstraints([dialogBoxContainerViewCenterYConstraint,
                        NSLayoutConstraint(item: dialogBoxContainerView, attribute: .centerX, relatedBy: .equal, toItem: self,
                                           attribute: .centerX, multiplier: 1.0, constant: 0.0)
                       ])
        
        addSubview(buttonPopAll)
        buttonPopAll.addConstraints([NSLayoutConstraint(item: buttonPopAll,
                                                        attribute: .width, relatedBy: .equal,
                                                        toItem: nil, attribute: .notAnAttribute,
                                                        multiplier: 1.0, constant: 90.0)])
        buttonPopAll.addConstraints([NSLayoutConstraint(item: buttonPopAll,
                                                        attribute: .height, relatedBy: .equal,
                                                        toItem: nil, attribute: .notAnAttribute,
                                                        multiplier: 1.0, constant: 44.0)])
        buttonPopAll.addTarget(self, action: #selector(Self.clickPopAll(sender:)), for: .touchUpInside)
        self.addConstraints([
            NSLayoutConstraint(item: buttonPopAll, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: -24.0),
            NSLayoutConstraint(item: buttonPopAll, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0, constant: -64.0),
        ])
        
        addSubview(buttonPopCurrent)
        buttonPopCurrent.addConstraints([NSLayoutConstraint(item: buttonPopCurrent,
                                                            attribute: .width, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0, constant: 90.0)])
        buttonPopCurrent.addConstraints([NSLayoutConstraint(item: buttonPopCurrent,
                                                            attribute: .height, relatedBy: .equal,
                                                            toItem: nil, attribute: .notAnAttribute,
                                                            multiplier: 1.0, constant: 44.0)])
        buttonPopCurrent.addTarget(self, action: #selector(Self.clickPopCurrent(sender:)), for: .touchUpInside)
        self.addConstraints([
            NSLayoutConstraint(item: buttonPopCurrent, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 24.0),
            NSLayoutConstraint(item: buttonPopCurrent, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0, constant: -64.0),
        ])
        
        addSubview(buttonPush1)
        buttonPush1.addConstraints([NSLayoutConstraint(item: buttonPush1,
                                                       attribute: .width, relatedBy: .equal,
                                                       toItem: nil, attribute: .notAnAttribute,
                                                       multiplier: 1.0, constant: 90.0)])
        buttonPush1.addConstraints([NSLayoutConstraint(item: buttonPush1,
                                                       attribute: .height, relatedBy: .equal,
                                                       toItem: nil, attribute: .notAnAttribute,
                                                       multiplier: 1.0, constant: 44.0)])
        buttonPush1.addTarget(self, action: #selector(Self.clickPush1(sender:)), for: .touchUpInside)
        self.addConstraints([
            NSLayoutConstraint(item: buttonPush1, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 24.0),
            NSLayoutConstraint(item: buttonPush1, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: 64.0),
        ])
        
        addSubview(buttonPush2)
        buttonPush2.addConstraints([NSLayoutConstraint(item: buttonPush2,
                                                       attribute: .width, relatedBy: .equal,
                                                       toItem: nil, attribute: .notAnAttribute,
                                                       multiplier: 1.0, constant: 90.0)])
        buttonPush2.addConstraints([NSLayoutConstraint(item: buttonPush2,
                                                       attribute: .height, relatedBy: .equal,
                                                       toItem: nil, attribute: .notAnAttribute,
                                                       multiplier: 1.0, constant: 44.0)])
        buttonPush2.addTarget(self, action: #selector(Self.clickPush2(sender:)), for: .touchUpInside)
        self.addConstraints([
            NSLayoutConstraint(item: buttonPush2, attribute: .centerX, relatedBy: .equal,
                               toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: buttonPush2, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: 64.0),
        ])
        
        addSubview(buttonPush3)
        buttonPush3.addConstraints([NSLayoutConstraint(item: buttonPush3,
                                                       attribute: .width, relatedBy: .equal,
                                                       toItem: nil, attribute: .notAnAttribute,
                                                       multiplier: 1.0, constant: 90.0)])
        buttonPush3.addConstraints([NSLayoutConstraint(item: buttonPush3,
                                                       attribute: .height, relatedBy: .equal,
                                                       toItem: nil, attribute: .notAnAttribute,
                                                       multiplier: 1.0, constant: 44.0)])
        buttonPush3.addTarget(self, action: #selector(Self.clickPush3(sender:)), for: .touchUpInside)
        self.addConstraints([
            NSLayoutConstraint(item: buttonPush3, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: -24.0),
            NSLayoutConstraint(item: buttonPush3, attribute: .top, relatedBy: .equal,
                               toItem: self, attribute: .top, multiplier: 1.0, constant: 64.0),
        ])
        
        keyboardHandler.willExpandHandler = { [weak self] height, duration, animationOptions in
            self?.keyboardWillExpand(height: height, duration: duration, animationOptions: animationOptions)
        }
        
        keyboardHandler.willCollapseHandler = { [weak self] duration, animationOptions in
            self?.keyboardWillCollapse(duration: duration, animationOptions: animationOptions)
        }
        
        dialogBoxContainerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var _keyboardTicks = 0
    private var _keyboardHeight: CGFloat = 0.0
    
    func update() {
        
        if _keyboardTicks > 1 {
            _keyboardTicks -= 1
        } else if _keyboardTicks == 1 {
            
            if isAnimatingStackIn == false &&
                isAnimatingStackOut == false &&
                isAnimatingDialogIn == false &&
                isAnimatingDialogOut == false &&
                isAnimatingScreenRotation == false {
                _keyboardTicks = 0
            }
        }
    }
    
    @objc func clickPush1(sender: UIButton) {
        print("clickPush1")
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(DialogBoxModel.junkTestTiddoes)
        }
    }
    
    @objc func clickPush2(sender: UIButton) {
        print("clickPush2")
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(DialogBoxModel.junkTestAllTitles)
        }
    }
    
    @objc func clickPush3(sender: UIButton) {
        print("clickPush3")
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(DialogBoxModel.junkTest) { _ in
                print("asdf FDSA asdf FDSA")
            }
        }
    }
    
    @objc func clickPopAll(sender: UIButton) {
        print("clickPopAll")
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.popDialogStack { result in
                print("Pop'D ALL (A:\(result))")
            }
        }
    }
    
    @objc func clickPopCurrent(sender: UIButton) {
        print("clickPopCurrent")
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.popDialogBox() { result in
                print("Pop'D ONE (B:\(result))")
            }
        }
    }
    
    func getNumberOfDialogs() -> Int {
        return dialogBoxViews.count
    }
    
    func handleSafeArea(safeAreaLeft: Int, safeAreaRight: Int, safeAreaTop: Int, safeAreaBottom: Int) {
        
        print("DialogBoxStackContainerView.handleSafeAreaME(l:\(self.safeAreaLeft), r: \(self.safeAreaRight), t: \(self.safeAreaTop), b: \(self.safeAreaBottom))")
        print("DialogBoxStackContainerView.handleSafeAreaYOU(l:\(safeAreaLeft), r: \(safeAreaRight), t: \(safeAreaTop), b: \(safeAreaBottom))")
        
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        if isAnimatingScreenRotation {
            print("DialogBoxStackContainerView.handleSafeAreaYOU(DURING_ROTATIN, CANCEL!!!")
            return
        }
        
        if dialogBoxViews.count > 0 {
            snap(dialogBoxViews[dialogBoxViews.count - 1])
        }
    }
    
    
    func handleOrientationChange_A(orientation: Orientation,
                                   screenWidth: Int,
                                   screenHeight: Int) {
        print("DialogBoxStackContainerView.handleOrientationChange_A(\(orientation), sw: \(screenWidth), sh: \(screenHeight))")
        
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
    }
    
    func handleOrientationChange_B(safeAreaLeft: Int,
                                   safeAreaRight: Int,
                                   safeAreaTop: Int,
                                   safeAreaBottom: Int) {
        
        print("DialogBoxStackContainerView.handleOrientationChange_B_ME(l:\(self.safeAreaLeft), r: \(self.safeAreaRight), t: \(self.safeAreaTop), b: \(self.safeAreaBottom))")
        print("DialogBoxStackContainerView.handleOrientationChange_B_YOU(l:\(safeAreaLeft), r: \(safeAreaRight), t: \(safeAreaTop), b: \(safeAreaBottom))")
        
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        if dialogBoxViews.count > 0 {
            snap(dialogBoxViews[dialogBoxViews.count - 1])
        }
    }
    
    func handleOrientationChange_C() {
        print("DialogBoxStackContainerView.handleOrientationChange_C")
        if let targetedView = targetedView {
            if _keyboardHeight <= 8.0 {
                if dialogBoxContainerViewCenterYConstraint.constant != 0.0 {
                    UIView.animate(withDuration: 0.36, delay: 0.0) {
                        self.dialogBoxContainerViewCenterYConstraint.constant = 0.0
                        self.setNeedsLayout()
                        self.layoutIfNeeded()
                    }
                }
            } else {
                if let frameInContainer = targetedView.frame(in: dialogBoxContainerView) {
                    let containerRestingFrameY = bounds.size.height / 2.0 - dialogBoxContainerView.bounds.size.height / 2.0
                    var frameBottom = containerRestingFrameY
                    if dialogBoxViews.count > 0 {
                        let dialogBoxView = dialogBoxViews[dialogBoxViews.count - 1]
                        frameBottom += dialogBoxView.frame.maxY
                    } else {
                        frameBottom += frameInContainer.maxY
                    }
                    
                    let keyboardTop = bounds.size.height - _keyboardHeight
                    if frameBottom > keyboardTop {
                        let shiftAmount = CGFloat(keyboardTop - frameBottom)
                        if dialogBoxContainerViewCenterYConstraint.constant != shiftAmount {
                            UIView.animate(withDuration: 0.36, delay: 0.0) {
                                self.dialogBoxContainerViewCenterYConstraint.constant = shiftAmount
                                self.setNeedsLayout()
                                self.layoutIfNeeded()
                            }
                        }
                    } else {
                        if dialogBoxContainerViewCenterYConstraint.constant != 0.0 {
                            UIView.animate(withDuration: 0.36, delay: 0.0) {
                                self.dialogBoxContainerViewCenterYConstraint.constant = 0.0
                                self.setNeedsLayout()
                                self.layoutIfNeeded()
                            }
                        }
                    }
                }
            }
        } else {
            if dialogBoxContainerViewCenterYConstraint.constant != 0.0 {
                UIView.animate(withDuration: 0.36, delay: 0.0) {
                    self.dialogBoxContainerViewCenterYConstraint.constant = 0.0
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    func keyboardWillExpand(height: CGFloat, duration: TimeInterval, animationOptions: UIView.AnimationOptions) {
        print("*** keyboardWillExpand: \(0.0)")
        
        _keyboardHeight = height
        if isAnimatingScreenRotation || duration < 0.01 {
            _keyboardTicks = 3
        } else {
            keyboardInstantAnimation(duration: duration, animationOptions: animationOptions)
        }
    }
    
    func keyboardWillCollapse(duration: TimeInterval, animationOptions: UIView.AnimationOptions) {
        print("*** keyboardWillCollapse: \(0.0)")
        _keyboardHeight = 0.0
        if isAnimatingScreenRotation || duration < 0.01 {
            _keyboardTicks = 3
        } else {
            keyboardInstantAnimation(duration: duration, animationOptions: animationOptions)
        }
    }
    
    func keyboardInstantAnimation(duration: TimeInterval, animationOptions: UIView.AnimationOptions) {
        if let targetedView = targetedView {
            if _keyboardHeight <= 8.0 {
                if dialogBoxContainerViewCenterYConstraint.constant != 0.0 {
                    UIView.animate(withDuration: duration, delay: 0.0, options: animationOptions) {
                        self.dialogBoxContainerViewCenterYConstraint.constant = 0.0
                        self.setNeedsLayout()
                        self.layoutIfNeeded()
                    }
                }
            } else {
                if let frameInContainer = targetedView.frame(in: dialogBoxContainerView) {
                    let containerRestingFrameY = bounds.size.height / 2.0 - dialogBoxContainerView.bounds.size.height / 2.0
                    var frameBottom = containerRestingFrameY
                    if dialogBoxViews.count > 0 {
                        let dialogBoxView = dialogBoxViews[dialogBoxViews.count - 1]
                        frameBottom += dialogBoxView.frame.maxY
                    } else {
                        frameBottom += frameInContainer.maxY
                    }
                    let keyboardTop = bounds.size.height - _keyboardHeight
                    if frameBottom > keyboardTop {
                        let shiftAmount = CGFloat(keyboardTop - frameBottom)
                        if dialogBoxContainerViewCenterYConstraint.constant != shiftAmount {
                            UIView.animate(withDuration: duration, delay: 0.0, options: animationOptions) {
                                self.dialogBoxContainerViewCenterYConstraint.constant = shiftAmount
                                self.setNeedsLayout()
                                self.layoutIfNeeded()
                            }
                        }
                    } else {
                        if dialogBoxContainerViewCenterYConstraint.constant != 0.0 {
                            UIView.animate(withDuration: duration, delay: 0.0, options: animationOptions) {
                                self.dialogBoxContainerViewCenterYConstraint.constant = 0.0
                                self.setNeedsLayout()
                                self.layoutIfNeeded()
                            }
                        }
                    }
                }
            }
        } else {
            if dialogBoxContainerViewCenterYConstraint.constant != 0.0 {
                UIView.animate(withDuration: duration, delay: 0.0, options: animationOptions) {
                    self.dialogBoxContainerViewCenterYConstraint.constant = 0.0
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    func animateIn(dialogBox: DialogBoxModel,
                   orientation: Orientation,
                   screenWidth: Int,
                   screenHeight: Int,
                   safeAreaLeft: Int,
                   safeAreaRight: Int,
                   safeAreaTop: Int,
                   safeAreaBottom: Int,
                   completion: @escaping (() -> Void)) {
        
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        //self.alpha = 0.0
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        let dialogBoxView = DialogBoxView(dialogBox: dialogBox,
                                          orientation: orientation,
                                          screenWidth: screenWidth,
                                          screenHeight: screenHeight,
                                          safeAreaLeft: safeAreaLeft,
                                          safeAreaRight: safeAreaRight,
                                          safeAreaTop: safeAreaTop,
                                          safeAreaBottom: safeAreaBottom)
        add(dialogBoxView: dialogBoxView)
        
        backgroundColor = UIColor(red: 0.0125, green: 0.0125, blue: 0.02, alpha: 0.0)
        dialogBoxView.transform = CGAffineTransform(scaleX: 0.44, y: 0.44)
        dialogBoxView.alpha = 0.0
        
        isAnimatingStackIn = true
        UIView.animate(withDuration: 0.52, delay: 0.0, usingSpringWithDamping: 32.0, initialSpringVelocity: 16.0) {
            dialogBoxView.transform = CGAffineTransform.identity
            dialogBoxView.alpha = 1.0
            self.backgroundColor = UIColor(red: 0.0125, green: 0.0125, blue: 0.02, alpha: 0.65)
            self.isAnimatingStackIn = false
            completion()
        }
    }
    
    func animateOut(orientation: Orientation,
                    screenWidth: Int,
                    screenHeight: Int,
                    safeAreaLeft: Int,
                    safeAreaRight: Int,
                    safeAreaTop: Int,
                    safeAreaBottom: Int,
                    completion: @escaping (() -> Void)) {
        
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        isAnimatingStackOut = true
        UIView.animate(withDuration: 0.52,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseOut,
                       animations: {
            
            
            self.backgroundColor = UIColor(red: 0.0125, green: 0.0125, blue: 0.02, alpha: 0.0)
            
            if self.dialogBoxViews.count > 0 {
                let dialogBoxView = self.dialogBoxViews[self.dialogBoxViews.count - 1]
                dialogBoxView.transform = CGAffineTransform(scaleX: 0.44, y: 0.44)
                dialogBoxView.alpha = 0.0
            }
        }) { _ in
            for dialogBoxView in self.dialogBoxViews {
                dialogBoxView.layer.removeAllAnimations()
                dialogBoxView.removeFromSuperview()
                self.dispose(dialogBoxView: dialogBoxView)
            }
            self.dialogBoxViews.removeAll(keepingCapacity: true)
            self.isAnimatingStackOut = false
            completion()
        }
    }
    
    func getPushInOffsetX() -> Int {
        Self.getPushInOffsetX(orientation: orientation,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              safeAreaLeft: safeAreaLeft,
                              safeAreaRight: safeAreaRight,
                              safeAreaTop: safeAreaTop,
                              safeAreaBottom: safeAreaBottom)
    }
    
    func getPushInOffsetY() -> Int {
        Self.getPushInOffsetY(orientation: orientation,
                              screenWidth: screenWidth,
                              screenHeight: screenHeight,
                              safeAreaLeft: safeAreaLeft,
                              safeAreaRight: safeAreaRight,
                              safeAreaTop: safeAreaTop,
                              safeAreaBottom: safeAreaBottom)
    }
    
    func getPushOutOffsetX() -> Int {
        Self.getPushOutOffsetX(orientation: orientation,
                               screenWidth: screenWidth,
                               screenHeight: screenHeight,
                               safeAreaLeft: safeAreaLeft,
                               safeAreaRight: safeAreaRight,
                               safeAreaTop: safeAreaTop,
                               safeAreaBottom: safeAreaBottom)
    }
    
    func getPushOutOffsetY() -> Int {
        Self.getPushOutOffsetY(orientation: orientation,
                               screenWidth: screenWidth,
                               screenHeight: screenHeight,
                               safeAreaLeft: safeAreaLeft,
                               safeAreaRight: safeAreaRight,
                               safeAreaTop: safeAreaTop,
                               safeAreaBottom: safeAreaBottom)
    }
    
    func getPushInForwardTransform() -> CGAffineTransform {
        let pushInOffsetX = getPushInOffsetX()
        let pushInOffsetY = getPushInOffsetY()
        var pushInTransform = CGAffineTransform(translationX: CGFloat(pushInOffsetX),
                                                y: CGFloat(pushInOffsetY))
        pushInTransform = CGAffineTransformScale(pushInTransform, 0.44, 0.44)
        return pushInTransform
    }
    
    func getPushInBackwardTransform() -> CGAffineTransform {
        let pushInOffsetX = getPushInOffsetX()
        let pushInOffsetY = getPushInOffsetY()
        var pushInTransform = CGAffineTransform(translationX: CGFloat(-pushInOffsetX),
                                                y: CGFloat(-pushInOffsetY))
        pushInTransform = CGAffineTransformScale(pushInTransform, 0.44, 0.44)
        return pushInTransform
    }
    
    func getPushOutForwardTransform() -> CGAffineTransform {
        let pushOutOffsetX = getPushOutOffsetX()
        let pushOutOffsetY = getPushOutOffsetY()
        var pushOutTransform = CGAffineTransform(translationX: CGFloat(pushOutOffsetX),
                                                 y: CGFloat(pushOutOffsetY))
        pushOutTransform = CGAffineTransformScale(pushOutTransform, 0.44, 0.44)
        return pushOutTransform
    }
    
    func getPushOutBackwardTransform() -> CGAffineTransform {
        let pushOutOffsetX = getPushOutOffsetX()
        let pushOutOffsetY = getPushOutOffsetY()
        var pushOutTransform = CGAffineTransform(translationX: CGFloat(-pushOutOffsetX),
                                                 y: CGFloat(-pushOutOffsetY))
        pushOutTransform = CGAffineTransformScale(pushOutTransform, 0.44, 0.44)
        return pushOutTransform
    }
    
    func pushDialog(dialogBox: DialogBoxModel,
                    orientation: Orientation,
                    screenWidth: Int,
                    screenHeight: Int,
                    safeAreaLeft: Int,
                    safeAreaRight: Int,
                    safeAreaTop: Int,
                    safeAreaBottom: Int,
                    completion: @escaping (() -> Void)) {
        
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        let dialogBoxViewReplace = DialogBoxView(dialogBox: dialogBox,
                                                 orientation: orientation,
                                                 screenWidth: screenWidth,
                                                 screenHeight: screenHeight,
                                                 safeAreaLeft: safeAreaLeft,
                                                 safeAreaRight: safeAreaRight,
                                                 safeAreaTop: safeAreaTop,
                                                 safeAreaBottom: safeAreaBottom)
        
        add(dialogBoxView: dialogBoxViewReplace)
        
        if dialogBoxViews.count > 1 {
            let dialogBoxViewPop = dialogBoxViews[dialogBoxViews.count - 2]
            
            let pushInTransform = getPushInForwardTransform()
            let pushOutTransform = getPushOutForwardTransform()
            
            dialogBoxViewPop.activate()
            dialogBoxViewPop.alpha = 1.0
            dialogBoxViewPop.transform = CGAffineTransform.identity
            
            dialogBoxViewReplace.activate()
            dialogBoxViewReplace.alpha = 0.0
            dialogBoxViewReplace.transform = pushInTransform
            
            UIView.animate(withDuration: 0.36) {
                dialogBoxViewReplace.transform = CGAffineTransform.identity
                dialogBoxViewReplace.alpha = 1.0
                
                dialogBoxViewPop.transform = pushOutTransform
                dialogBoxViewPop.alpha = 0.0
            } completion: { _ in
                dialogBoxViewPop.deactivate()
                self.dismissKeyboard()
            }
            
        } else {
            dialogBoxViewReplace.transform = CGAffineTransform(scaleX: 0.44, y: 0.44)
            dialogBoxViewReplace.alpha = 0.0
            UIView.animate(withDuration: 0.36, delay: 0.0, usingSpringWithDamping: 32.0, initialSpringVelocity: 16.0) {
                dialogBoxViewReplace.transform = CGAffineTransform.identity
                dialogBoxViewReplace.alpha = 1.0
            }
        }
    }
    
    //newGuides
    func replaceDialog(dialogBox: DialogBoxModel,
                       orientation: Orientation,
                       screenWidth: Int,
                       screenHeight: Int,
                       safeAreaLeft: Int,
                       safeAreaRight: Int,
                       safeAreaTop: Int,
                       safeAreaBottom: Int,
                       completion: @escaping (() -> Void)) {
        
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        let dialogBoxViewReplace = DialogBoxView(dialogBox: dialogBox,
                                                 orientation: orientation,
                                                 screenWidth: screenWidth,
                                                 screenHeight: screenHeight,
                                                 safeAreaLeft: safeAreaLeft,
                                                 safeAreaRight: safeAreaRight,
                                                 safeAreaTop: safeAreaTop,
                                                 safeAreaBottom: safeAreaBottom)
        
        add(dialogBoxView: dialogBoxViewReplace)
        
        if dialogBoxViews.count > 1 {
            let dialogBoxViewPop = dialogBoxViews[dialogBoxViews.count - 2]
            
            let pushInTransform = getPushInForwardTransform()
            let pushOutTransform = getPushOutForwardTransform()
            
            dialogBoxViewPop.activate()
            dialogBoxViewPop.alpha = 1.0
            dialogBoxViewPop.transform = CGAffineTransform.identity
            
            dialogBoxViewReplace.activate()
            dialogBoxViewReplace.alpha = 0.0
            dialogBoxViewReplace.transform = pushInTransform
            
            UIView.animate(withDuration: 0.36) {
                dialogBoxViewReplace.transform = CGAffineTransform.identity
                dialogBoxViewReplace.alpha = 1.0
                
                dialogBoxViewPop.transform = pushOutTransform
                dialogBoxViewPop.alpha = 0.0
            } completion: { _ in
                dialogBoxViewPop.deactivate()
                dialogBoxViewPop.layer.removeAllAnimations()
                dialogBoxViewPop.removeFromSuperview()
                self.dispose(dialogBoxView: dialogBoxViewPop)
                self.remove(dialogBoxView: dialogBoxViewPop)
                self.dismissKeyboard()
            }
            
        } else {
            dialogBoxViewReplace.transform = CGAffineTransform(scaleX: 0.44, y: 0.44)
            dialogBoxViewReplace.alpha = 0.0
            UIView.animate(withDuration: 0.36, delay: 0.0, usingSpringWithDamping: 32.0, initialSpringVelocity: 16.0) {
                dialogBoxViewReplace.transform = CGAffineTransform.identity
                dialogBoxViewReplace.alpha = 1.0
            }
        }
    }
    
    func popDialog(orientation: Orientation,
                   screenWidth: Int,
                   screenHeight: Int,
                   safeAreaLeft: Int,
                   safeAreaRight: Int,
                   safeAreaTop: Int,
                   safeAreaBottom: Int,
                   completion: @escaping (() -> Void)) {
        
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        if dialogBoxViews.count <= 1 {
            animateOut(orientation: orientation,
                       screenWidth: screenWidth,
                       screenHeight: screenHeight,
                       safeAreaLeft: safeAreaLeft,
                       safeAreaRight: safeAreaRight,
                       safeAreaTop: safeAreaTop,
                       safeAreaBottom: safeAreaBottom,
                       completion: completion)
        } else {
            
            let dialogBoxViewPop = dialogBoxViews[dialogBoxViews.count - 1]
            let dialogBoxViewReplace = dialogBoxViews[dialogBoxViews.count - 2]
            
            let pushInTransform = getPushInBackwardTransform()
            let pushOutTransform = getPushOutBackwardTransform()
            
            dialogBoxViewPop.activate()
            dialogBoxViewPop.alpha = 1.0
            dialogBoxViewPop.transform = CGAffineTransform.identity
            
            dialogBoxViewReplace.activate()
            dialogBoxViewReplace.alpha = 0.0
            dialogBoxViewReplace.transform = pushInTransform
            
            UIView.animate(withDuration: 0.36) {
                dialogBoxViewReplace.transform = CGAffineTransform.identity
                dialogBoxViewReplace.alpha = 1.0
                dialogBoxViewPop.transform = pushOutTransform
                dialogBoxViewPop.alpha = 0.0
            } completion: { _ in
                dialogBoxViewPop.deactivate()
                dialogBoxViewPop.layer.removeAllAnimations()
                dialogBoxViewPop.removeFromSuperview()
                self.dispose(dialogBoxView: dialogBoxViewPop)
                self.remove(dialogBoxView: dialogBoxViewPop)
                self.dismissKeyboard()
                completion()
            }
        }
    }
    
    private func remove(dialogBoxView: DialogBoxView) {
        var reloop = true
        while reloop {
            reloop = false
            var removeIndex = -1
            for dialogBoxIndex in 0..<dialogBoxViews.count {
                if dialogBoxViews[dialogBoxIndex] === dialogBoxView {
                    removeIndex = dialogBoxIndex
                }
            }
            if removeIndex != -1 {
                reloop = true
                dialogBoxViews.remove(at: removeIndex)
            }
        }
        dialogBoxView.deactivate()
        dialogBoxView.layer.removeAllAnimations()
        dialogBoxView.removeFromSuperview()
    }
    
    private func dispose(dialogBoxView: DialogBoxView) {
        for rowView in dialogBoxView.bodyRowViews {
            disposeRow(uiView: rowView)
        }
        for rowView in dialogBoxView.buttonRowViews {
            disposeRow(uiView: rowView)
        }
    }
    
    private func linkRow(uiView: UIView) {
        if let rowView = uiView as? DialogBoxRowViewOneButton {
            rowView.dialogBoxStackContainerView = self
        }
        if let rowView = uiView as? DialogBoxRowViewTwoButtons {
            rowView.dialogBoxStackContainerView = self
        }
        if let rowView = uiView as? DialogBoxRowViewMessageBody {
            rowView.dialogBoxStackContainerView = self
        }
        if let rowView = uiView as? DialogBoxRowViewTitleBar {
            rowView.dialogBoxStackContainerView = self
        }
        if let rowView = uiView as? DialogBoxRowViewEmptySpace {
            rowView.dialogBoxStackContainerView = self
        }
        if let rowView = uiView as? DialogBoxRowViewInputBox {
            rowView.dialogBoxStackContainerView = self
        }
        if let rowView = uiView as? DialogBoxRowViewEditThumb {
            rowView.dialogBoxStackContainerView = self
        }
    }
    
    private func disposeRow(uiView: UIView) {
        if let rowView = uiView as? DialogBoxRowViewOneButton {
            rowView.dispose()
        }
        if let rowView = uiView as? DialogBoxRowViewTwoButtons {
            rowView.dispose()
        }
        if let rowView = uiView as? DialogBoxRowViewMessageBody {
            rowView.dispose()
        }
        if let rowView = uiView as? DialogBoxRowViewTitleBar {
            rowView.dispose()
        }
        if let rowView = uiView as? DialogBoxRowViewEmptySpace {
            rowView.dispose()
        }
        if let rowView = uiView as? DialogBoxRowViewInputBox {
            rowView.dispose()
        }
        if let rowView = uiView as? DialogBoxRowViewEditThumb {
            rowView.dispose()
        }
    }
    
    private func add(dialogBoxView: DialogBoxView) {
        dialogBoxViews.append(dialogBoxView)
        dialogBoxContainerView.addSubview(dialogBoxView)
        
        dialogBoxView.translatesAutoresizingMaskIntoConstraints = false
        dialogBoxContainerView.addConstraints([
            NSLayoutConstraint(item: dialogBoxView, attribute: .centerX, relatedBy: .equal, 
                               toItem: dialogBoxContainerView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dialogBoxView, attribute: .centerY, relatedBy: .equal,
                               toItem: dialogBoxContainerView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        ])
        
        let width = Self.getDialogWidth()
        dialogBoxView.widthConstraint.constant = CGFloat(width)
        setNeedsLayout()
        layoutIfNeeded()
        
        snap(dialogBoxView)
        
        for rowView in dialogBoxView.bodyRowViews {
            linkRow(uiView: rowView)
        }
        for rowView in dialogBoxView.buttonRowViews {
            linkRow(uiView: rowView)
        }
    }
    
    @objc func didTap(_ tapGestureRecognizer: UITapGestureRecognizer) -> Void {
        dismissKeyboard()
    }
    
    func dismissKeyboard() {
        for subview1 in subviews {
            subview1.resignFirstResponder()
            for subview2 in subview1.subviews {
                subview2.resignFirstResponder()
                for subview3 in subview2.subviews {
                    subview3.resignFirstResponder()
                    for subview4 in subview3.subviews {
                        subview4.resignFirstResponder()
                        for subview5 in subview4.subviews {
                            subview5.resignFirstResponder()
                            for subview6 in subview5.subviews {
                                subview6.resignFirstResponder()
                                for subview7 in subview6.subviews {
                                    subview7.resignFirstResponder()
                                    for subview8 in subview7.subviews {
                                        subview8.resignFirstResponder()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func snap(_ dialogBoxView: DialogBoxView) {
        
        let measuredHeightTop = Int(dialogBoxView.scrollContentTop.bounds.size.height + 1.0)
        let measuredHeightBottom = Int(dialogBoxView.scrollContentBottom.bounds.size.height + 1.0)
        
        let availableHeight = Self.getMaxDialogHeight(orientation: orientation,
                                                      screenHeight: screenHeight,
                                                      safeAreaTop: safeAreaTop,
                                                      safeAreaBottom: safeAreaBottom)
        
        if (measuredHeightTop + measuredHeightBottom + DialogTheme.separatorHeight) <= availableHeight {
            dialogBoxView.scrollViewTopHeightConstraint.constant = CGFloat(measuredHeightTop)
            dialogBoxView.scrollViewBottomHeightConstraint.constant = CGFloat(measuredHeightBottom)
        } else {
            let halfHeight = ((measuredHeightTop + measuredHeightBottom) - DialogTheme.separatorHeight) / 2
            if measuredHeightTop < halfHeight {
                dialogBoxView.scrollViewTopHeightConstraint.constant = CGFloat(measuredHeightTop)
                let bottomHeight = availableHeight - (measuredHeightTop + DialogTheme.separatorHeight)
                dialogBoxView.scrollViewBottomHeightConstraint.constant = CGFloat(bottomHeight)
            } else if measuredHeightBottom < halfHeight {
                dialogBoxView.scrollViewBottomHeightConstraint.constant = CGFloat(measuredHeightBottom)
                let topHeight = availableHeight - (measuredHeightBottom + DialogTheme.separatorHeight)
                dialogBoxView.scrollViewTopHeightConstraint.constant = CGFloat(topHeight)
            } else {
                let topHeight = (availableHeight - DialogTheme.separatorHeight) / 2
                let bottomHeight = availableHeight - (topHeight + DialogTheme.separatorHeight)
                dialogBoxView.scrollViewTopHeightConstraint.constant = CGFloat(topHeight)
                dialogBoxView.scrollViewBottomHeightConstraint.constant = CGFloat(bottomHeight)
            }
        }
    }
    
    weak var targetedView: UIView?
    func setTargetedView(uiView: UIView?) {
        self.targetedView = uiView
    }
}

extension DialogBoxStackContainerView: UIGestureRecognizerDelegate {
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let position = gestureRecognizer.location(in: dialogBoxContainerView)
        if dialogBoxViews.count > 0 {
            let dialogBoxView = dialogBoxViews[dialogBoxViews.count - 1]
            return !dialogBoxView.frame.contains(position)
        }
        return true
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let position = gestureRecognizer.location(in: dialogBoxContainerView)
        if dialogBoxViews.count > 0 {
            let dialogBoxView = dialogBoxViews[dialogBoxViews.count - 1]
            return !dialogBoxView.frame.contains(position)
        }
        return true
    }
}
