//
//  JiggleContainerViewController.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/18/24.
//

import UIKit

class JiggleContainerViewController: UIViewController {
    
    
    
    var isSideMenuAnimationActive = false
    
    lazy var sideMenuLeftConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: sideMenuView,
                                  attribute: .left, relatedBy: .equal,
                                  toItem: view, attribute: .left,
                                  multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var sideMenuWidthConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: sideMenuView,
                                  attribute: .width, relatedBy: .equal,
                                  toItem: nil, attribute: .notAnAttribute,
                                  multiplier: 1.0, constant: 200.0)
    }()
    
    lazy var sideMenuView: SideMenuView = {
        let result = SideMenuView(toolInterfaceViewModel: jiggleViewController.toolInterfaceViewModel,
                                  orientation: jiggleViewController.jiggleDocument.orientation)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.anchorPoint = CGPointMake(0.5, 0.5)
        return result
    }()
    
    lazy var snapshotContainerViewLeftConstraint: NSLayoutConstraint = {
        return NSLayoutConstraint(item: snapshotContainerView,
                                  attribute: .left, relatedBy: .equal,
                                  toItem: view, attribute: .left,
                                  multiplier: 1.0, constant: 0.0)
    }()
    
    lazy var snapshotContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.anchorPoint = CGPointMake(0.5, 0.5)
        return result
    }()
    
    weak var snapshotViewReference: UIView?
    
    let jiggleViewController: JiggleViewController
    required init(jiggleViewModel: JiggleViewModel,
                  jiggleScene: JiggleScene,
                  jiggleDocument: JiggleDocument) {
        
        
        self.jiggleViewController = JiggleViewController(jiggleViewModel: jiggleViewModel,
                                                         jiggleScene: jiggleScene,
                                                         jiggleDocument: jiggleDocument)
        super.init(nibName: nil, bundle: nil)
        
        view.clipsToBounds = true
        
        jiggleViewController.jiggleContainerViewController = self
        jiggleViewController.view.anchorPoint = CGPointMake(0.5, 0.5)
        jiggleViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(sideMenuView)
        sideMenuView.addConstraint(sideMenuWidthConstraint)
        view.addConstraints([
            sideMenuLeftConstraint,
            NSLayoutConstraint(item: sideMenuView, attribute: .top, relatedBy: .equal,
                               toItem: view, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: sideMenuView, attribute: .bottom, relatedBy: .equal,
                               toItem: view, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0)
        ])
        sideMenuView.deactivate()
        
        view.addSubview(snapshotContainerView)
        view.addConstraints([
            snapshotContainerViewLeftConstraint,
            snapshotContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            snapshotContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            snapshotContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        snapshotContainerView.deactivate()
        
        view.addSubview(jiggleViewController.view)
        view.addConstraints([
            jiggleViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            jiggleViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            jiggleViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            jiggleViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
        
        
        /*
        var gyroDir: CGPoint {
            var result = CGPoint.zero
            if let gyroData = ApplicationController.shared.motionManager.gyroData {
                var jerkX = CGFloat(gyroData.rotationRate.x)
                var jerkY = CGFloat(gyroData.rotationRate.y)
                let hold = jerkX
                if Device.orientation == .landscapeLeft {
                    jerkX = -jerkX
                } else if Device.orientation == .landscapeRight {
                    jerkY = -jerkY
                } else if Device.orientation == .portraitUpsideDown {
                    jerkX = -jerkY
                    jerkY = -hold
                } else {
                    jerkX = jerkY
                    jerkY = hold
                }
                result.x = jerkX
                result.y = jerkY
            }
            return result
        }
        */
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillResignActive(notification:)),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationDidBecomeActive(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        
    }
    
    func awake(jiggleViewModel: JiggleViewModel, jiggleScene: JiggleScene) {
        jiggleViewController.load()
        jiggleViewController.loadComplete()
        jiggleViewModel.handleWakeUpBegin()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] JiggleContainerViewController")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    override func viewSafeAreaInsetsDidChange() {
        
        let orientation = jiggleViewController.jiggleDocument.orientation
        
        let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
        let safeAreaRight = Int(ApplicationController.rootViewController.view.safeAreaInsets.right + 0.5)
        let safeAreaTop = Int(ApplicationController.rootViewController.view.safeAreaInsets.top + 0.5)
        let safeAreaBottom = Int(ApplicationController.rootViewController.view.safeAreaInsets.bottom + 0.5)
        
        jiggleViewController.handleSafeAreaDidChange(safeAreaLeft: safeAreaLeft,
                                                     safeAreaRight: safeAreaRight,
                                                     safeAreaTop: safeAreaTop,
                                                     safeAreaBottom: safeAreaBottom)
        
        let appHeight: Int
        switch orientation {
        case .landscape:
            appHeight = Int(ApplicationController.heightLandscape + 0.5)
        case .portrait:
            appHeight = Int(ApplicationController.heightPortrait + 0.5)
        }
        let sideMenuWidth = ToolInterfaceTheme.getSideMenuWidth(orientation: orientation)
        sideMenuWidthConstraint.constant = CGFloat(sideMenuWidth + safeAreaLeft)
        
        let containerWidth = sideMenuWidth + safeAreaLeft
        let containerHeight = appHeight
        
        if containerWidth != sideMenuView.sideMenuViewModel.containerWidth {
            sideMenuView.sideMenuViewModel.containerWidth = containerWidth
        }
        if containerWidth != sideMenuView.sideMenuViewModel.containerHeight {
            sideMenuView.sideMenuViewModel.containerHeight = containerHeight
        }
        if safeAreaLeft != sideMenuView.sideMenuViewModel.safeAreaLeft {
            sideMenuView.sideMenuViewModel.safeAreaLeft = safeAreaLeft
        }
        if safeAreaTop != sideMenuView.sideMenuViewModel.safeAreaTop {
            sideMenuView.sideMenuViewModel.safeAreaTop = safeAreaTop
        }
        if safeAreaBottom != sideMenuView.sideMenuViewModel.safeAreaBottom {
            sideMenuView.sideMenuViewModel.safeAreaBottom = safeAreaBottom
        }
        
        sideMenuView.handleSafeArea(safeAreaLeft: safeAreaLeft,
                                    safeAreaRight: safeAreaRight,
                                    safeAreaTop: safeAreaTop,
                                    safeAreaBottom: safeAreaBottom)
        
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if jiggleViewController.jiggleDocument.orientation.isLandscape {
            return [.landscapeLeft, .landscapeRight]
        } else {
            return [.portrait, .portraitUpsideDown]
        }
    }
    
    func sideMenuEnter() {
        
        if isSideMenuAnimationActive { return }
        
        if let snapshotViewReference = self.snapshotViewReference {
            snapshotViewReference.removeFromSuperview()
            self.snapshotViewReference = nil
        }
        
        if let snapshotViewReference = jiggleViewController.view.snapshotView(afterScreenUpdates: false) {
            self.snapshotViewReference = snapshotViewReference
            snapshotViewReference.translatesAutoresizingMaskIntoConstraints = true
            snapshotContainerView.addSubview(snapshotViewReference)
            snapshotViewReference.frame = snapshotContainerView.bounds
        }
        
        jiggleViewController.view.deactivate()
        snapshotContainerView.activate()
        sideMenuView.activate()
        
        let orientation = jiggleViewController.jiggleDocument.orientation
        
        let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
        let sideMenuWidth = ToolInterfaceTheme.getSideMenuWidth(orientation: orientation)
        let containerWidth = sideMenuWidth + safeAreaLeft
        
        let sideMenuStartTransform = CGAffineTransform(scaleX: 0.72, y: 0.72)
        sideMenuLeftConstraint.constant = CGFloat(-(containerWidth / 2))
        sideMenuView.transform = sideMenuStartTransform
        
        snapshotContainerViewLeftConstraint.constant = CGFloat(0.0)
        let jiggleEndTransform = CGAffineTransform(scaleX: 0.835, y: 0.835)
        snapshotContainerView.transform = CGAffineTransform.identity
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        isSideMenuAnimationActive = true
        
        UIView.animate(withDuration: 0.52,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseOut,
                       animations: {
            self.sideMenuView.transform = CGAffineTransform.identity
            self.sideMenuLeftConstraint.constant = CGFloat(0.0)
            self.snapshotContainerViewLeftConstraint.constant = CGFloat(containerWidth)
            self.snapshotContainerView.transform = jiggleEndTransform
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
        }) { _ in
            self.isSideMenuAnimationActive = false
        }
    }
    
    func sideMenuExit() {
        
        if isSideMenuAnimationActive { return }
        
        let orientation = jiggleViewController.jiggleDocument.orientation
        
        let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
        let sideMenuWidth = ToolInterfaceTheme.getSideMenuWidth(orientation: orientation)
        let containerWidth = sideMenuWidth + safeAreaLeft
        
        let sideMenuEndTransform = CGAffineTransform(scaleX: 0.72, y: 0.72)
        
        sideMenuView.transform = CGAffineTransform.identity
        sideMenuView.activate()
        
        snapshotContainerViewLeftConstraint.constant = CGFloat(containerWidth)
        let jiggleStartTransform = CGAffineTransform(scaleX: 0.835, y: 0.835)
        snapshotContainerView.transform = jiggleStartTransform
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        isSideMenuAnimationActive = true
        
        UIView.animate(withDuration: 0.52,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseOut,
                       animations: {
            self.sideMenuView.transform = sideMenuEndTransform
            self.sideMenuLeftConstraint.constant = CGFloat(-(containerWidth / 2))
            self.snapshotContainerViewLeftConstraint.constant = CGFloat(0.0)
            self.snapshotContainerView.transform = CGAffineTransform.identity
            
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
        }) { _ in
            self.isSideMenuAnimationActive = false
            self.sideMenuView.deactivate()
            self.snapshotContainerView.deactivate()
            if let snapshotViewReference = self.snapshotViewReference {
                snapshotViewReference.removeFromSuperview()
                self.snapshotViewReference = nil
            }
            self.jiggleViewController.view.activate()
        }
        
    }
    
    func handleExit() {
        print("JiggleContainerViewController.handleExit()")
        jiggleViewController.handleExit()
    }
    
    @objc func applicationWillResignActive(notification: NSNotification) {
        print("JiggleContainerViewController.applicationWillResignActive")
        jiggleViewController.applicationWillResignActive()
    }

    @objc func applicationDidBecomeActive(notification: NSNotification) {
        print("JiggleContainerViewController.applicationDidBecomeActive")
        jiggleViewController.applicationDidBecomeActive()
    }
    
}
