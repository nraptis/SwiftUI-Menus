//
//  RootViewController.swift
//  Jiggle III
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit
import CoreMotion

/*
extension DispatchQueue {

    static func displayLink(times: Int, completion: @escaping () -> Void) {
        var fireCount = 0
        var displayLink: CADisplayLink?

        displayLink = CADisplayLink(target: BlockWrapper {
            fireCount += 1
            if fireCount == times {
                displayLink?.invalidate()
                displayLink = nil
                completion()
            }
        }, selector: #selector(BlockWrapper.invoke))

        displayLink?.add(to: .main, forMode: .common)
    }
}
*/

private class BlockWrapper {
    private let block: () -> Void

    init(_ block: @escaping () -> Void) {
        self.block = block
    }

    @objc func invoke() {
        block()
    }
}

class RootViewController: UIViewController {
    
    let motionManager = CMMotionManager()

    
    lazy var containerView: UIView = {
        let result = UIView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let rootViewModel: RootViewModel
    required init(rootViewModel: RootViewModel) {
        
        self.rootViewModel = rootViewModel
        
        super.init(nibName: "RootViewController", bundle: .main)
        
        view.addSubview(containerView)
        
        view.addConstraints([
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.layoutIfNeeded()
        
        /*
         self.timer = Timer.scheduledTimer(timeInterval: 1.0 / 60.0,
         target: self,
         selector: #selector(Self.update),
         userInfo: nil,
         repeats: true)
         */
        
        if motionManager.isGyroAvailable {
            
            motionManager.gyroUpdateInterval = 1.0 / 60.0
            motionManager.startGyroUpdates(to: .main) { gyroData, error in
                if let gyroData = gyroData {
                    var jerkX = CGFloat(gyroData.rotationRate.x)
                    var jerkY = CGFloat(gyroData.rotationRate.y)
                    
                    if let rootViewModel = ApplicationController.rootViewModel {
                        if let windowScene = rootViewModel.windowScene {
                            let _jerkX = jerkX
                            let _jerkY = jerkY
                            switch windowScene.interfaceOrientation {
                            case .portraitUpsideDown:
                                //
                                jerkX = _jerkY
                                jerkY = _jerkX
                                //
                            case .landscapeLeft:
                                //
                                jerkX = -_jerkX
                                jerkY = -_jerkY
                                //
                            case .landscapeRight:
                                //
                                jerkX = _jerkX
                                jerkY = _jerkY
                                //
                            default:
                                //
                                jerkX = -_jerkY
                                jerkY = -_jerkX
                                //
                            }
                        }
                    }
                    
                    ApplicationController.recordGyroDirectionHistory(jerkX: Float(jerkX),
                                                                     jerkY: Float(jerkY))
                    
                }
            }
        }
    }
    
    weak var timer: Timer?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //@MainActor
    var isPushing = false
    //@MainActor
    private var viewController: UIViewController?
    //@MainActor
    func push(viewController: UIViewController,
              fromOrientation: Orientation,
              toOrientation: Orientation,
              fixedOrientation: Bool,
              animated: Bool,
              reversed: Bool,
              completion: @escaping () -> Void) {
        
        if isPushing {
            fatalError("Double Push, RVC...")
        }
        
        if let view = viewController.view {
            view.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(view)
            if fixedOrientation {
                var width = ApplicationController.widthPortrait
                var height = ApplicationController.heightPortrait
                switch toOrientation {
                case .landscape:
                    width = ApplicationController.widthLandscape
                    height = ApplicationController.heightLandscape
                case .portrait:
                    width = ApplicationController.widthPortrait
                    height = ApplicationController.heightPortrait
                }
                containerView.addConstraints([
                    view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                    view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
                ])
                view.addConstraints([
                    NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(width)),
                    NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(height))
                ])
            } else {
                containerView.addConstraints([
                    view.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                    view.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                    view.topAnchor.constraint(equalTo: containerView.topAnchor),
                    view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
                ])
            }
            view.layoutIfNeeded()
        }
        
        let previousViewController = self.viewController
        self.viewController = viewController
        
        if let previousViewController = previousViewController {
            if let metalViewController = previousViewController as? MetalViewController {
                print("Stopping Timer")
                metalViewController.stopTimer()
            }
            if let jiggleContainerViewController = previousViewController as? JiggleContainerViewController {
                print("Stopping Timer")
                jiggleContainerViewController.jiggleViewController.stopTimer()
            }
            
            if let imageImportViewController = previousViewController as? ImageImportViewController {
                imageImportViewController.stopTimer()
            }
            
        }
        
        //
        //If the supported interface orientations changes, this may cause an unwanted
        //rotation. However, it is best to always reload the supported orientations.
        //If we do not always do this, we will lose rotate-ability when switching
        //from locked orientation into a switch-able orientation.
        //
        
        setNeedsUpdateOfSupportedInterfaceOrientations()
        
        if fromOrientation.isLandscape != toOrientation.isLandscape {
            if fixedOrientation {
                var interfaceOrientationMask = UIInterfaceOrientationMask(rawValue: 0)
                if toOrientation.isLandscape {
                    interfaceOrientationMask = interfaceOrientationMask.union(.landscapeLeft)
                    interfaceOrientationMask = interfaceOrientationMask.union(.landscapeRight)
                } else {
                    interfaceOrientationMask = interfaceOrientationMask.union(.portrait)
                    interfaceOrientationMask = interfaceOrientationMask.union(.portraitUpsideDown)
                }
                rootViewModel.windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: interfaceOrientationMask)) { error in
                    print("Request Geometry Update Error!")
                    print("\(error.localizedDescription)")
                }
            }
        }
        
        if !animated {
            if let previousViewController = previousViewController {
                if let jiggleContainerViewController = previousViewController as? JiggleContainerViewController {
                    jiggleContainerViewController.handleExit()
                }
                previousViewController.view.layer.removeAllAnimations()
                previousViewController.view.removeFromSuperview()
            }
            completion()
        } else {
            guard let previousViewController = previousViewController else {
                completion()
                return
            }
            
            let previousStartOffsetX: CGFloat = 0.0
            let previousStartOffsetY: CGFloat = 0.0
            var previousEndOffsetX: CGFloat = 0.0
            var previousEndOffsetY: CGFloat = 0.0
            
            var currentStartOffsetX: CGFloat = 0.0
            var currentStartOffsetY: CGFloat = 0.0
            let currentEndOffsetX: CGFloat = 0.0
            let currentEndOffsetY: CGFloat = 0.0
            
            if fromOrientation.isLandscape == toOrientation.isLandscape {
                // Animate in from the right / left, using width...
                let amount = toOrientation.isLandscape ? ApplicationController.widthLandscape : ApplicationController.widthPortrait
                if reversed {
                    previousEndOffsetX = CGFloat(amount)
                    currentStartOffsetX = CGFloat(-amount)
                } else {
                    previousEndOffsetX = CGFloat(-amount)
                    currentStartOffsetX = CGFloat(amount)
                }
                
            } else {
                // Animate in from the bottom / top, using max dimension...
                
                let amount = max(ApplicationController.widthPortrait, ApplicationController.heightPortrait)
                if reversed {
                    previousEndOffsetY = CGFloat(amount)
                    currentStartOffsetY = CGFloat(-amount)
                } else {
                    previousEndOffsetY = CGFloat(-amount)
                    currentStartOffsetY = CGFloat(amount)
                }
            }
            
            let previousStartAffine = CGAffineTransform.init(translationX: previousStartOffsetX, y: previousStartOffsetY)
            let previousEndAffine = CGAffineTransform.init(translationX: previousEndOffsetX, y: previousEndOffsetY)
            let currentStartAffine = CGAffineTransform.init(translationX: currentStartOffsetX, y: currentStartOffsetY)
            let currentEndAffine = CGAffineTransform.init(translationX: currentEndOffsetX, y: currentEndOffsetY)
            
            previousViewController.view.transform = previousStartAffine
            viewController.view.transform = currentStartAffine
            
            isPushing = true
            print("PUSH!! (AAA) [isPushing = true]")
            
            //DispatchQueue.displayLink(times: 1) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            
                print("PUSH!! (BBB) [Display Link]")
                
                
                if let jiggleContainerViewController = previousViewController as? JiggleContainerViewController {
                    jiggleContainerViewController.handleExit()
                }
                
                UIView.animate(withDuration: 0.44) {
                
                    previousViewController.view.transform = previousEndAffine
                    viewController.view.transform = currentEndAffine
                    
                    print("PUSH!! (CCC) [Animus]")
                } completion: { _ in
                    previousViewController.view.layer.removeAllAnimations()
                    previousViewController.view.removeFromSuperview()
                    self.viewController = viewController
                    self.isPushing = false
                    completion()
                    
                    print("PUSH!! (DDD) [Devos Animus]")
                }
            }
            
            
            //DispatchQueue.main.async {
                
                
            //}
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if size.width > size.height {
            rootViewModel.orientation = .landscape
            if let dialogBoxStackContainerView = dialogBoxStackContainerView {
                let screenWidth = Int(ApplicationController.widthLandscape + 0.5)
                let screenHeight = Int(ApplicationController.heightLandscape + 0.5)
                dialogBoxStackContainerView.isAnimatingScreenRotation = true
                dialogBoxStackContainerView.handleOrientationChange_A(orientation: .landscape,
                                                                      screenWidth: screenWidth,
                                                                      screenHeight: screenHeight)
            }
            
            if let imageImportViewController = viewController as? ImageImportViewController {
                let screenWidth = Int(ApplicationController.widthLandscape + 0.5)
                let screenHeight = Int(ApplicationController.heightLandscape + 0.5)
                imageImportViewController.isAnimatingScreenRotation = true
                imageImportViewController.handleOrientationChange_A(orientation: .landscape,
                                                                    screenWidth: screenWidth,
                                                                    screenHeight: screenHeight)
            }
            
            if let loadSceneViewController = viewController as? LoadSceneViewController {
                let screenWidth = Int(ApplicationController.widthLandscape + 0.5)
                let screenHeight = Int(ApplicationController.heightLandscape + 0.5)
                loadSceneViewController.isAnimatingScreenRotation = true
                loadSceneViewController.handleOrientationChange_A(orientation: .landscape,
                                                                  screenWidth: screenWidth,
                                                                  screenHeight: screenHeight)
            }
            
            
            //isAnimatingScreenRotation
        } else {
            rootViewModel.orientation = .portrait
            if let dialogBoxStackContainerView = dialogBoxStackContainerView {
                let screenWidth = Int(ApplicationController.widthPortrait + 0.5)
                let screenHeight = Int(ApplicationController.heightPortrait + 0.5)
                dialogBoxStackContainerView.isAnimatingScreenRotation = true
                dialogBoxStackContainerView.handleOrientationChange_A(orientation: .portrait,
                                                                      screenWidth: screenWidth,
                                                                      screenHeight: screenHeight)
            }
            
            if let imageImportViewController = viewController as? ImageImportViewController {
                let screenWidth = Int(ApplicationController.widthPortrait + 0.5)
                let screenHeight = Int(ApplicationController.heightPortrait + 0.5)
                imageImportViewController.isAnimatingScreenRotation = true
                imageImportViewController.handleOrientationChange_A(orientation: .portrait,
                                                                    screenWidth: screenWidth,
                                                                    screenHeight: screenHeight)
            }
            
            if let loadSceneViewController = viewController as? LoadSceneViewController {
                let screenWidth = Int(ApplicationController.widthPortrait + 0.5)
                let screenHeight = Int(ApplicationController.heightPortrait + 0.5)
                loadSceneViewController.isAnimatingScreenRotation = true
                loadSceneViewController.handleOrientationChange_A(orientation: .portrait,
                                                                  screenWidth: screenWidth,
                                                                  screenHeight: screenHeight)
            }
        }
        
        coordinator.animate { _ in
            let safeAreaLeft = Int(self.view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(self.view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(self.view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(self.view.safeAreaInsets.bottom + 0.5)
            if let dialogBoxStackContainerView = self.dialogBoxStackContainerView {
                dialogBoxStackContainerView.handleOrientationChange_B(safeAreaLeft: safeAreaLeft,
                                                                      safeAreaRight: safeAreaRight,
                                                                      safeAreaTop: safeAreaTop,
                                                                      safeAreaBottom: safeAreaBottom)
                
            }
            
            if let imageImportViewController = self.viewController as? ImageImportViewController {
                imageImportViewController.handleOrientationChange_B(safeAreaLeft: safeAreaLeft,
                                                                    safeAreaRight: safeAreaRight,
                                                                    safeAreaTop: safeAreaTop,
                                                                    safeAreaBottom: safeAreaBottom)
            }
            
            if let loadSceneViewController = self.viewController as? LoadSceneViewController {
                loadSceneViewController.handleOrientationChange_B(safeAreaLeft: safeAreaLeft,
                                                                  safeAreaRight: safeAreaRight,
                                                                  safeAreaTop: safeAreaTop,
                                                                  safeAreaBottom: safeAreaBottom)
            }
            
        } completion: { _ in
            DispatchQueue.main.async {
                if let dialogBoxStackContainerView = self.dialogBoxStackContainerView {
                    dialogBoxStackContainerView.isAnimatingScreenRotation = false
                    dialogBoxStackContainerView.handleOrientationChange_C()
                }
                if let imageImportViewController = self.viewController as? ImageImportViewController {
                    imageImportViewController.isAnimatingScreenRotation = false
                    imageImportViewController.handleOrientationChange_C()
                }
                if let loadSceneViewController = self.viewController as? LoadSceneViewController {
                    loadSceneViewController.isAnimatingScreenRotation = false
                    loadSceneViewController.handleOrientationChange_C()
                }
            }
        }
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if let viewController = viewController {
            return viewController.supportedInterfaceOrientations
        }
        return [.portrait, .portraitUpsideDown, .landscapeLeft, .landscapeRight]
    }
    
    func getPresentationViewController() -> UIViewController {
        var result: UIViewController! = self
        while let presentedViewController = result.presentedViewController {
            result = presentedViewController
        }
        return result
    }
    
    func showAlertMessageBrokenJiggle() {
        let title = "broke jiggle"
        let message = "this doesnt work"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageTooManyPoints() {
        let title = "too many points"
        let message = "thats too many"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageTooFewPoints() {
        let title = "too few points"
        let message = "thats too few"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageMaxJiggleCountOverflow() {
        let title = GeneralStringLibrary.generalMaxJiggleCountTitle()
        let message = GeneralStringLibrary.generalMaxJiggleCountMessage(maxJiggleCount: JiggleDocument.maxJiggleCount)
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageMaxGuideCountOverflow() {
        let title = "too many rings"
        let message = "its too many"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageCannotPlaceJiggle() {
        let title = "cannot palce"
        let message = "theres not a palce for this"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageDrawJiggleTooLong() {
        let title = "too long"
        let message = "this drawing is too long"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageDrawJiggleComplex() {
        let title = "self intersect"
        let message = "this is illegal drawing"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageDrawJiggleIllegal() {
        let title = "something wrong"
        let message = "please try again"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageDrawJiggleTooFewPoints() {
        let title = "not enough points"
        let message = "u neeed 3"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageDrawJiggleTooManyPoints() {
        let title = "too many points"
        let message = "its too many"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageSelectedJiggleRequired() {
        let title = "No Jiggles Selected"
        let message = "Select a Jiggle before you do this"
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessageSelectedGuideRequired() {
        let title = "No Ring Selected"
        let message = "Select a Jiggle before you do this."
        showAlertMessage(title: title, message: message)
    }
    
    func showAlertMessage(title: String?, message: String?) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: GeneralStringLibrary.generalTextOkay(), style: .default) { _ in
            print("dismiss'd")
        }
        
        alert.addAction(okayAction)
        getPresentationViewController().present(alert, animated: true)
    }
    
    func showAlertMessage(alertController: UIAlertController) {
        getPresentationViewController().present(alertController, animated: true)
        
    }
    //JiggleDocument.maxJiggleCount
    
    func getOrientation() -> Orientation {
        if let jiggleViewController = viewController as? JiggleViewController {
            return jiggleViewController.jiggleDocument.orientation
        } else {
            return Orientation(interfaceOrientation: rootViewModel.windowScene.interfaceOrientation)
        }
    }
    
    private(set) var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    @MainActor func pushDialogBox(_ model: DialogBoxModel) {
        pushDialogBox(model) { _ in }
    }
    
    @MainActor func pushDialogBox(_ model: DialogBoxModel, completion: @escaping ((Bool) -> Void)) {
        
        let orientation = getOrientation()
        let screenWidth: Int
        let screenHeight: Int
        switch orientation {
        case .landscape:
            screenWidth = Int(ApplicationController.widthLandscape + 0.5)
            screenHeight = Int(ApplicationController.heightLandscape + 0.5)
        case .portrait:
            screenWidth = Int(ApplicationController.widthPortrait + 0.5)
            screenHeight = Int(ApplicationController.heightPortrait + 0.5)
        }
        let safeAreaLeft = Int(view.safeAreaInsets.left + 0.5)
        let safeAreaRight = Int(view.safeAreaInsets.right + 0.5)
        let safeAreaTop = Int(view.safeAreaInsets.top + 0.5)
        let safeAreaBottom = Int(view.safeAreaInsets.bottom + 0.5)
        
        if let dialogBoxStackContainerView = dialogBoxStackContainerView {
            if dialogBoxStackContainerView.isAnimatingStackIn ||
                dialogBoxStackContainerView.isAnimatingStackOut ||
                dialogBoxStackContainerView.isAnimatingDialogIn ||
                dialogBoxStackContainerView.isAnimatingDialogOut {
                print("pushDialogBox -- fizzle -- already doing dialog action...")
                completion(false)
                return
            }
            
            dialogBoxStackContainerView.pushDialog(dialogBox: model,
                                                   orientation: orientation,
                                                   screenWidth: screenWidth,
                                                   screenHeight: screenHeight,
                                                   safeAreaLeft: safeAreaLeft,
                                                   safeAreaRight: safeAreaRight,
                                                   safeAreaTop: safeAreaTop,
                                                   safeAreaBottom: safeAreaBottom) {
                completion(true)
            }
        } else {
            let dialogBoxStackContainerView = DialogBoxStackContainerView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
            self.dialogBoxStackContainerView = dialogBoxStackContainerView
            dialogBoxStackContainerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(dialogBoxStackContainerView)
            containerView.addConstraints([
                dialogBoxStackContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                dialogBoxStackContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                dialogBoxStackContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                dialogBoxStackContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
            
            dialogBoxStackContainerView.animateIn(dialogBox: model,
                                                  orientation: orientation,
                                                  screenWidth: screenWidth,
                                                  screenHeight: screenHeight,
                                                  safeAreaLeft: safeAreaLeft,
                                                  safeAreaRight: safeAreaRight,
                                                  safeAreaTop: safeAreaTop,
                                                  safeAreaBottom: safeAreaBottom) {
                completion(true)
            }
        }
    }
    
    func replaceDialogBox(_ model: DialogBoxModel) {
        replaceDialogBox(model) { _ in }
    }
    
    func replaceDialogBox(_ model: DialogBoxModel, completion: @escaping ((Bool) -> Void)) {
        
        let orientation = getOrientation()
        let screenWidth: Int
        let screenHeight: Int
        switch orientation {
        case .landscape:
            screenWidth = Int(ApplicationController.widthLandscape + 0.5)
            screenHeight = Int(ApplicationController.heightLandscape + 0.5)
        case .portrait:
            screenWidth = Int(ApplicationController.widthPortrait + 0.5)
            screenHeight = Int(ApplicationController.heightPortrait + 0.5)
        }
        let safeAreaLeft = Int(view.safeAreaInsets.left + 0.5)
        let safeAreaRight = Int(view.safeAreaInsets.right + 0.5)
        let safeAreaTop = Int(view.safeAreaInsets.top + 0.5)
        let safeAreaBottom = Int(view.safeAreaInsets.bottom + 0.5)
        
        if let dialogBoxStackContainerView = dialogBoxStackContainerView {
            if dialogBoxStackContainerView.isAnimatingStackIn ||
                dialogBoxStackContainerView.isAnimatingStackOut ||
                dialogBoxStackContainerView.isAnimatingDialogIn ||
                dialogBoxStackContainerView.isAnimatingDialogOut {
                print("pushDialogBox -- fizzle -- already doing dialog action...")
                completion(false)
                return
            }
            
            dialogBoxStackContainerView.replaceDialog(dialogBox: model,
                                                      orientation: orientation,
                                                      screenWidth: screenWidth,
                                                      screenHeight: screenHeight,
                                                      safeAreaLeft: safeAreaLeft,
                                                      safeAreaRight: safeAreaRight,
                                                      safeAreaTop: safeAreaTop,
                                                      safeAreaBottom: safeAreaBottom) {
                completion(true)
            }
        } else {
            let dialogBoxStackContainerView = DialogBoxStackContainerView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
            self.dialogBoxStackContainerView = dialogBoxStackContainerView
            dialogBoxStackContainerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(dialogBoxStackContainerView)
            containerView.addConstraints([
                dialogBoxStackContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                dialogBoxStackContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                dialogBoxStackContainerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                dialogBoxStackContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])
            
            dialogBoxStackContainerView.animateIn(dialogBox: model,
                                                  orientation: orientation,
                                                  screenWidth: screenWidth,
                                                  screenHeight: screenHeight,
                                                  safeAreaLeft: safeAreaLeft,
                                                  safeAreaRight: safeAreaRight,
                                                  safeAreaTop: safeAreaTop,
                                                  safeAreaBottom: safeAreaBottom) {
                completion(true)
            }
        }
    }
    
    func popDialogBox() {
        popDialogBox { _ in }
    }
    
    func popDialogBox(completion: @escaping ((Bool) -> Void)) {
        if let dialogBoxStackContainerView = dialogBoxStackContainerView {
            if dialogBoxStackContainerView.isAnimatingStackIn ||
                dialogBoxStackContainerView.isAnimatingStackOut ||
                dialogBoxStackContainerView.isAnimatingDialogIn ||
                dialogBoxStackContainerView.isAnimatingDialogOut {
                print("popDialogBox -- fizzle -- already doing dialog action...")
                completion(false)
                return
            }
            
            let orientation = getOrientation()
            let screenWidth: Int
            let screenHeight: Int
            switch orientation {
            case .landscape:
                screenWidth = Int(ApplicationController.widthLandscape + 0.5)
                screenHeight = Int(ApplicationController.heightLandscape + 0.5)
            case .portrait:
                screenWidth = Int(ApplicationController.widthPortrait + 0.5)
                screenHeight = Int(ApplicationController.heightPortrait + 0.5)
            }
            let safeAreaLeft = Int(view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(view.safeAreaInsets.bottom + 0.5)
            
            dialogBoxStackContainerView.popDialog(orientation: orientation,
                                                  screenWidth: screenWidth, 
                                                  screenHeight: screenHeight, 
                                                  safeAreaLeft: safeAreaLeft,
                                                  safeAreaRight: safeAreaRight,
                                                  safeAreaTop: safeAreaTop,
                                                  safeAreaBottom: safeAreaBottom) {
                if dialogBoxStackContainerView.getNumberOfDialogs() == 0 {
                    dialogBoxStackContainerView.layer.removeAllAnimations()
                    dialogBoxStackContainerView.removeFromSuperview()
                    self.dialogBoxStackContainerView = nil
                }
                completion(true)
            }
        } else {
            print("popDialogBox -- fizzle -- doesn't exist...")
            completion(false)
        }
    }
    
    func popDialogStack(completion: @escaping ((Bool) -> Void)) {
        if let dialogBoxStackContainerView = dialogBoxStackContainerView {
            if dialogBoxStackContainerView.isAnimatingStackIn ||
                dialogBoxStackContainerView.isAnimatingStackOut ||
                dialogBoxStackContainerView.isAnimatingDialogIn ||
                dialogBoxStackContainerView.isAnimatingDialogOut {
                print("popDialogStack -- fizzle -- already doing dialog action...")
                completion(false)
                return
            }
            
            let orientation = getOrientation()
            let screenWidth: Int
            let screenHeight: Int
            switch orientation {
            case .landscape:
                screenWidth = Int(ApplicationController.widthLandscape + 0.5)
                screenHeight = Int(ApplicationController.heightLandscape + 0.5)
            case .portrait:
                screenWidth = Int(ApplicationController.widthPortrait + 0.5)
                screenHeight = Int(ApplicationController.heightPortrait + 0.5)
            }
            let safeAreaLeft = Int(view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(view.safeAreaInsets.bottom + 0.5)
            
            dialogBoxStackContainerView.animateOut(orientation: orientation,
                                                   screenWidth: screenWidth,
                                                   screenHeight: screenHeight,
                                                   safeAreaLeft: safeAreaLeft,
                                                   safeAreaRight: safeAreaRight,
                                                   safeAreaTop: safeAreaTop,
                                                   safeAreaBottom: safeAreaBottom) {
                dialogBoxStackContainerView.layer.removeAllAnimations()
                dialogBoxStackContainerView.removeFromSuperview()
                self.dialogBoxStackContainerView = nil
                completion(true)
            }
            
        } else {
            print("popDialogStack -- fizzle -- doesn't exist...")
            completion(false)
        }
    }
    
    override func viewSafeAreaInsetsDidChange() {
        print("RootViewController.viewSafeAreaInsetsDidChange()")
        
        super.viewSafeAreaInsetsDidChange()
        
        if let dialogBoxStackContainerView = dialogBoxStackContainerView {
            let safeAreaLeft = Int(view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(view.safeAreaInsets.bottom + 0.5)
            dialogBoxStackContainerView.handleSafeArea(safeAreaLeft: safeAreaLeft,
                                                       safeAreaRight: safeAreaRight,
                                                       safeAreaTop: safeAreaTop,
                                                       safeAreaBottom: safeAreaBottom)
        }
    }
}
