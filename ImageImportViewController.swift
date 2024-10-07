//
//  ImageImportViewController.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/31/24.
//

import UIKit
import SwiftUI

class ImageImportViewController: UIViewController {
    
    typealias Point = Math.Point
    
    static var cropBorderThickness = 2
    
    static let cropBorderColor = UIColor(red: 0.66, green: 0.66, blue: 0.66, alpha: 1.0)
    static let outsideAreaColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
    
    var isFinished = false
    
    var isRotatingOrResetting = false
    var isAnimatingScreenRotation = false
    
    private var timer: CADisplayLink?
    private var _isTimerRunning = false
    
    var snapToEdges: Bool = true
    var snapDistance: CGFloat = 12.0
    
    var snapToRotations: Bool = true
    
    var rotationLocked: Bool = true
    var rotationLockIndex: Int = 0
    var rotationLockDistance = (CGFloat.pi / 2.0) * 0.04
    
    var importZoomMin = CGFloat(0.5)
    var importZoomMax = CGFloat(2.5)
    
    var indexRotationN = -CGFloat.pi / 2.0
    var indexRotation0 = 0.0
    var indexRotation1 = CGFloat.pi / 2.0
    var indexRotation2 = CGFloat.pi
    var indexRotation3 = (CGFloat.pi + CGFloat.pi / 2.0)
    var indexRotation4 = (CGFloat.pi + CGFloat.pi)
    
    //When a GR fires, we save the image's current transform.
    var startImageTouchCenter = CGPoint.zero
    var startRotation = CGFloat(0.0)
    var startScale = CGFloat(1.0)
    
    //As the gestures move around the screen, this the center of the user's fingers/
    var touchCenter = CGPoint.zero
    
    //The affine transformation of the image view that we're importing.
    var translation = CGPoint.zero
    var rotation = CGFloat(0.0)
    var scale = CGFloat(1.0)
    
    private var _imageCenterForRotation = CGPoint.zero
    
    lazy var topBar: ImageImporterTopMenuView = {
        let result = ImageImporterTopMenuView(imageImportViewModel: imageImportViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var bottomBar: ImageImporterBottomMenuView = {
        let result = ImageImporterBottomMenuView(imageImportViewModel: imageImportViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var imageTiler: ImageTiler = {
        let image: UIImage
        if Device.isPad {
            
            let path = FileUtils.shared.getMainBundleFilePath(fileName: "scene_background_tile_256.png")
            image = FileUtils.shared.loadImage(path) ?? UIImage()
            
        } else {
            let path = FileUtils.shared.getMainBundleFilePath(fileName: "scene_background_tile_128.png")
            image = FileUtils.shared.loadImage(path) ?? UIImage()
        }
        
        let result = ImageTiler(image: image)
        result.scale = UIScreen.main.scale
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var cropViewConstraintLeft: NSLayoutConstraint = {
        NSLayoutConstraint(item: cropView, attribute: .left, relatedBy: .equal, toItem: self.view ?? UIView(),
                           attribute: .left, multiplier: 1.0, constant: 256.0)
    }()
    
    lazy var cropViewConstraintTop: NSLayoutConstraint = {
        NSLayoutConstraint(item: cropView, attribute: .top, relatedBy: .equal, toItem: self.view ?? UIView(),
                           attribute: .top, multiplier: 1.0, constant: 512.0)
    }()
    
    lazy var cropViewConstraintWidth: NSLayoutConstraint = {
        NSLayoutConstraint(item: cropView, attribute: .width, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: 256.0)
    }()
    
    lazy var cropViewConstraintHeight: NSLayoutConstraint = {
        NSLayoutConstraint(item: cropView, attribute: .height, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: 256.0)
    }()
    
    lazy var cropView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var cropViewOutsideL: UIView = {
        let result = GestureView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.cropBorderColor
        return result
    }()
    
    lazy var cropViewOutsideR: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.cropBorderColor
        return result
    }()
    
    lazy var cropViewOutsideU: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.cropBorderColor
        return result
    }()
    
    lazy var cropViewOutsideD: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.cropBorderColor
        return result
    }()
    
    lazy var blockerViewL: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.outsideAreaColor
        return result
    }()
    
    lazy var blockerViewR: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.outsideAreaColor
        return result
    }()
    
    lazy var blockerViewU: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.outsideAreaColor
        return result
    }()
    
    lazy var blockerViewD: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = Self.outsideAreaColor
        return result
    }()
    
    lazy var gestureView: GestureView = {
        let result = GestureView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var imageView: UIImageView = {
        let result = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.image = imageImportViewModel.originalImage
        result.layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        return result
    }()
    
    lazy var testImageView: UIImageView = {
        let result = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let imageImportViewModel: ImageImportViewModel
    required init(imageImportViewModel: ImageImportViewModel) {
        self.imageImportViewModel = imageImportViewModel
        super.init(nibName: nil, bundle: nil)
        ApplicationController.shared.imageImportViewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(imageTiler)
        view.addConstraints([
            imageTiler.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageTiler.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageTiler.topAnchor.constraint(equalTo: view.topAnchor),
            imageTiler.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.addSubview(imageView)
        
        view.addSubview(cropView)
        
        
        view.addSubview(testImageView)
        
        view.addSubview(blockerViewL)
        view.addSubview(blockerViewR)
        view.addSubview(blockerViewU)
        view.addSubview(blockerViewD)
        
        
        
        view.addSubview(cropViewOutsideL)
        view.addSubview(cropViewOutsideR)
        view.addSubview(cropViewOutsideU)
        view.addSubview(cropViewOutsideD)
        
        
        
        _addCropRectConstraints()
        
        
        view.addConstraints([
            testImageView.leftAnchor.constraint(equalTo: cropView.leftAnchor),
            testImageView.rightAnchor.constraint(equalTo: cropView.rightAnchor),
            testImageView.topAnchor.constraint(equalTo: cropView.topAnchor),
            testImageView.bottomAnchor.constraint(equalTo: cropView.bottomAnchor),
        ])
        
        
        
        imageView.addConstraints([
            NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: imageImportViewModel.originalImage.size.width),
            NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: imageImportViewModel.originalImage.size.height),
        ])
        
        view.addConstraints([
            NSLayoutConstraint(item: imageView, attribute: .left, relatedBy: .equal, toItem: view,
                               attribute: .left, multiplier: 1.0,
                               constant: -(imageImportViewModel.originalImage.size.width / 2.0)),
            NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: view,
                               attribute: .top, multiplier: 1.0,
                               constant: -(imageImportViewModel.originalImage.size.height / 2.0))
        ])
        
        
        view.addSubview(gestureView)
        gestureView.delegate = self
        view.addConstraints([
            gestureView.leftAnchor.constraint(equalTo: view.leftAnchor),
            gestureView.rightAnchor.constraint(equalTo: view.rightAnchor),
            gestureView.topAnchor.constraint(equalTo: view.topAnchor),
            gestureView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        
        view.addSubview(topBar)
        view.addConstraints([
            topBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            topBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            topBar.topAnchor.constraint(equalTo: view.topAnchor),
        ])
        
        view.addSubview(bottomBar)
        view.addConstraints([
            bottomBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        let appWidth: Int
        let appHeight: Int
        switch imageImportViewModel.originalOrientation {
        case .landscape:
            appWidth = Int(ApplicationController.widthLandscape + 0.5)
            appHeight = Int(ApplicationController.heightLandscape + 0.5)
        case .portrait:
            appWidth = Int(ApplicationController.widthPortrait + 0.5)
            appHeight = Int(ApplicationController.heightPortrait + 0.5)
        }
        
        imageImportViewModel.screenWidth = appWidth
        imageImportViewModel.screenHeight = appHeight
        
        let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
        let safeAreaRight = Int(ApplicationController.rootViewController.view.safeAreaInsets.right + 0.5)
        let safeAreaTop = Int(ApplicationController.rootViewController.view.safeAreaInsets.top + 0.5)
        let safeAreaBottom = Int(ApplicationController.rootViewController.view.safeAreaInsets.bottom + 0.5)
        
        
        
        imageImportViewModel.layoutRelay.safeAreaLeft = safeAreaLeft
        imageImportViewModel.layoutRelay.safeAreaRight = safeAreaRight
        imageImportViewModel.layoutRelay.safeAreaTop = safeAreaTop
        imageImportViewModel.layoutRelay.safeAreaBottom = safeAreaBottom
        
        imageImportViewModel.layoutRelay.menuWidthWithSafeArea = imageImportViewModel.screenWidth
        
        let toolbarHeightTop = MenuHeightCategoryGeneric.get(orientation: ImageImportViewModel.orientation, rowCount: 2, isTop: true)
        let toolbarHeightBottom = MenuHeightCategoryGeneric.get(orientation: ImageImportViewModel.orientation, rowCount: 1, isTop: false)
        
        imageImportViewModel.toolbarHeightTop = toolbarHeightTop
        imageImportViewModel.toolbarHeightBottom = toolbarHeightBottom
        
        let cropRect = getCropRect(screenWidth: appWidth,
                                   screenHeight: appHeight,
                                   safeAreaLeft: safeAreaLeft,
                                   safeAreaRight: safeAreaRight,
                                   safeAreaTop: safeAreaTop,
                                   safeAreaBottom: safeAreaBottom,
                                   toolbarHeightTop: toolbarHeightTop,
                                   toolbarHeightBottom: toolbarHeightBottom)
        
        cropViewConstraintLeft.constant = CGFloat(cropRect.x)
        cropViewConstraintTop.constant = CGFloat(cropRect.y)
        cropViewConstraintWidth.constant = CGFloat(cropRect.width)
        cropViewConstraintHeight.constant = CGFloat(cropRect.height)
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        
        
        calculateMinMaxScales()
        
        resetAspectFill(cropRect: cropRect)
        //resetAspectFit(cropRect: cropRect)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationWillResignActive(notification:)),
                                               name: UIApplication.willResignActiveNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(applicationDidBecomeActive(notification:)),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        
        startTimer()
        
        imageImportViewModel.calculateLayoutStackingCategories()
        
        topBar.handleSafeAreaChanged(safeAreaLeft: safeAreaLeft,
                                     safeAreaRight: safeAreaRight,
                                     safeAreaTop: safeAreaTop)
        
        bottomBar.handleSafeAreaChanged(safeAreaLeft: safeAreaLeft,
                                        safeAreaRight: safeAreaRight,
                                        safeAreaBottom: safeAreaBottom)
        
        topBar.topMenuContentView.setup(width: appWidth,
                                        safeAreaLeft: safeAreaLeft,
                                        safeAreaRight: safeAreaRight,
                                        safeAreaTop: safeAreaTop)
        bottomBar.bottomMenuContentView.setup(width: appWidth,
                                              safeAreaLeft: safeAreaLeft,
                                              safeAreaRight: safeAreaRight,
                                              safeAreaBottom: safeAreaBottom)
        imageImportViewModel.refreshAllRows()
        imageImportViewModel.layoutAllRows()
    }
    
    private func _addCropRectConstraints() {
        view.addConstraints([
            cropViewConstraintLeft,
            cropViewConstraintTop
        ])
        cropView.addConstraints([
            cropViewConstraintWidth,
            cropViewConstraintHeight
        ])
        
        cropViewOutsideL.addConstraint(
            NSLayoutConstraint(item: cropViewOutsideL, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(Self.cropBorderThickness))
        )
        view.addConstraints([
            NSLayoutConstraint(item: cropViewOutsideL, attribute: .right, relatedBy: .equal, toItem: cropView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropViewOutsideL, attribute: .top, relatedBy: .equal, toItem: cropView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropViewOutsideL, attribute: .bottom, relatedBy: .equal, toItem: cropView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        cropViewOutsideR.addConstraint(
            NSLayoutConstraint(item: cropViewOutsideR, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(Self.cropBorderThickness))
        )
        view.addConstraints([
            NSLayoutConstraint(item: cropViewOutsideR, attribute: .left, relatedBy: .equal, toItem: cropView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropViewOutsideR, attribute: .top, relatedBy: .equal, toItem: cropView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropViewOutsideR, attribute: .bottom, relatedBy: .equal, toItem: cropView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        cropViewOutsideU.addConstraint(
            NSLayoutConstraint(item: cropViewOutsideU, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(Self.cropBorderThickness))
        )
        view.addConstraints([
            NSLayoutConstraint(item: cropViewOutsideU, attribute: .left, relatedBy: .equal, toItem: cropView,
                               attribute: .left, multiplier: 1.0, constant: CGFloat(-Self.cropBorderThickness)),
            NSLayoutConstraint(item: cropViewOutsideU, attribute: .right, relatedBy: .equal, toItem: cropView,
                               attribute: .right, multiplier: 1.0, constant: CGFloat(Self.cropBorderThickness)),
            NSLayoutConstraint(item: cropViewOutsideU, attribute: .bottom, relatedBy: .equal, toItem: cropView,
                               attribute: .top, multiplier: 1.0, constant: 0.0)
        ])
        
        cropViewOutsideD.addConstraint(
            NSLayoutConstraint(item: cropViewOutsideD, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(Self.cropBorderThickness))
        )
        view.addConstraints([
            NSLayoutConstraint(item: cropViewOutsideD, attribute: .left, relatedBy: .equal, toItem: cropView,
                               attribute: .left, multiplier: 1.0, constant: CGFloat(-Self.cropBorderThickness)),
            NSLayoutConstraint(item: cropViewOutsideD, attribute: .right, relatedBy: .equal, toItem: cropView,
                               attribute: .right, multiplier: 1.0, constant: CGFloat(Self.cropBorderThickness)),
            NSLayoutConstraint(item: cropViewOutsideD, attribute: .top, relatedBy: .equal, toItem: cropView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        blockerViewL.addConstraint(NSLayoutConstraint(item: blockerViewL, attribute: .width, relatedBy: .equal,
                                                      toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                      constant: 2048.0))
        view.addConstraints([
            NSLayoutConstraint(item: blockerViewL, attribute: .right, relatedBy: .equal, toItem: cropView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewL, attribute: .top, relatedBy: .equal, toItem: view,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewL, attribute: .bottom, relatedBy: .equal, toItem: view,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        blockerViewR.addConstraint(NSLayoutConstraint(item: blockerViewR, attribute: .width, relatedBy: .equal,
                                                      toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                      constant: 2048.0))
        view.addConstraints([
            
            NSLayoutConstraint(item: blockerViewR, attribute: .left, relatedBy: .equal, toItem: cropView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewR, attribute: .top, relatedBy: .equal, toItem: view,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewR, attribute: .bottom, relatedBy: .equal, toItem: view,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        
        blockerViewU.addConstraint(NSLayoutConstraint(item: blockerViewU, attribute: .height, relatedBy: .equal,
                                                      toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                      constant: 2048.0))
        view.addConstraints([
            
            NSLayoutConstraint(item: blockerViewU, attribute: .left, relatedBy: .equal, toItem: cropView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewU, attribute: .right, relatedBy: .equal, toItem: cropView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewU, attribute: .bottom, relatedBy: .equal, toItem: cropView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
        ])
        
        blockerViewD.addConstraint(NSLayoutConstraint(item: blockerViewD, attribute: .height, relatedBy: .equal,
                                                      toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                      constant: 2048.0))
        view.addConstraints([
            
            NSLayoutConstraint(item: blockerViewD, attribute: .left, relatedBy: .equal, toItem: cropView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewD, attribute: .right, relatedBy: .equal, toItem: cropView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: blockerViewD, attribute: .top, relatedBy: .equal, toItem: cropView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        //view.addSubview()
        //view.addSubview()
        //view.addSubview()
        //view.addSubview()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown, .landscapeLeft, .landscapeRight]
    }
    
    /*
     override var shouldAutorotate: Bool {
     print("LocalFilesViewController = > shouldAutorotate???")
     return true
     }
     */
    
    override func viewSafeAreaInsetsDidChange() {
        
        if !isAnimatingScreenRotation {
            
            let safeAreaLeft = Int(self.view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(self.view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(self.view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(self.view.safeAreaInsets.bottom + 0.5)
            
            imageImportViewModel.layoutRelay.safeAreaLeft = safeAreaLeft
            imageImportViewModel.layoutRelay.safeAreaRight = safeAreaRight
            imageImportViewModel.layoutRelay.safeAreaTop = safeAreaTop
            imageImportViewModel.layoutRelay.safeAreaBottom = safeAreaBottom
            
            imageImportViewModel.layoutAllRows()
            
            topBar.handleSafeAreaChanged(safeAreaLeft: safeAreaLeft,
                                         safeAreaRight: safeAreaRight,
                                         safeAreaTop: safeAreaTop)
            
            bottomBar.handleSafeAreaChanged(safeAreaLeft: safeAreaLeft,
                                            safeAreaRight: safeAreaRight,
                                            safeAreaBottom: safeAreaBottom)
        }
    }
    
    
    @objc func applicationWillResignActive(notification: NSNotification) {
        stopTimer()
    }
    
    @objc func applicationDidBecomeActive(notification: NSNotification) {
        startTimer()
    }
    
    func startTimer() {
        if _isTimerRunning == false {
            _isTimerRunning = true
            timer?.invalidate()
            timer = nil
            previousTimeStamp = nil
            timer = CADisplayLink(target: self, selector: #selector(drawloop))
            if let timer = timer {
                timer.add(to: RunLoop.main, forMode: .default)
            }
        }
    }
    
    func stopTimer() {
        if _isTimerRunning == true {
            _isTimerRunning = false
            timer?.invalidate()
            timer = nil
            previousTimeStamp = nil
        }
    }
    
    private var previousTimeStamp: CFTimeInterval?
    @objc func drawloop() {
        if let timer = timer {
            var time = 0.0
            if let previousTimeStamp = previousTimeStamp {
                time = timer.timestamp - previousTimeStamp
            }
            update(deltaTime: Float(time))
            previousTimeStamp = timer.timestamp
        }
    }
    
    func update(deltaTime: Float) {
        gestureView.update(deltaTime: deltaTime)
    }
    
    func handleOrientationChange_A(orientation: Orientation,
                                   screenWidth: Int,
                                   screenHeight: Int) {
        print("ImageImportViewController.handleOrientationChange_A(\(orientation), sw: \(screenWidth), sh: \(screenHeight))")
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        print("cropRect = \(cropRect.midX), \(cropRect.midY)")
        
        _imageCenterForRotation = imageView.convert(CGPoint(x: cropRect.midX,
                                                            y: cropRect.midY), from: view)
        
        print("_imageCenterForRotation A = \(_imageCenterForRotation)")
        
        imageImportViewModel.screenWidth = screenWidth
        imageImportViewModel.screenHeight = screenHeight
        
    }
    
    func handleOrientationChange_B(safeAreaLeft: Int,
                                   safeAreaRight: Int,
                                   safeAreaTop: Int,
                                   safeAreaBottom: Int) {
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        imageImportViewModel.layoutRelay.safeAreaLeft = safeAreaLeft
        imageImportViewModel.layoutRelay.safeAreaRight = safeAreaRight
        imageImportViewModel.layoutRelay.safeAreaTop = safeAreaTop
        imageImportViewModel.layoutRelay.safeAreaBottom = safeAreaBottom
        
        imageImportViewModel.layoutRelay.menuWidthWithSafeArea = imageImportViewModel.screenWidth
        
        topBar.handleSafeAreaChanged(safeAreaLeft: safeAreaLeft,
                                     safeAreaRight: safeAreaRight,
                                     safeAreaTop: safeAreaTop)
        
        bottomBar.handleSafeAreaChanged(safeAreaLeft: safeAreaLeft,
                                        safeAreaRight: safeAreaRight,
                                        safeAreaBottom: safeAreaBottom)
        
        let toolbarHeightTop = MenuHeightCategoryGeneric.get(orientation: ImageImportViewModel.orientation, rowCount: 2, isTop: true)
        let toolbarHeightBottom = MenuHeightCategoryGeneric.get(orientation: ImageImportViewModel.orientation, rowCount: 1, isTop: false)
        
        imageImportViewModel.toolbarHeightTop = toolbarHeightTop
        imageImportViewModel.toolbarHeightBottom = toolbarHeightBottom
        
        imageImportViewModel.calculateLayoutStackingCategories()
        imageImportViewModel.layoutAllRows()
        
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: safeAreaLeft,
                                   safeAreaRight: safeAreaRight,
                                   safeAreaTop: safeAreaTop,
                                   safeAreaBottom: safeAreaBottom,
                                   toolbarHeightTop: toolbarHeightTop,
                                   toolbarHeightBottom: toolbarHeightBottom)
        
        let newImageCenter = imageView.convert(CGPoint(x: cropRect.midX,
                                                       y: cropRect.midY), from: view)
        
        
        cropViewConstraintLeft.constant = CGFloat(cropRect.x)
        cropViewConstraintTop.constant = CGFloat(cropRect.y)
        cropViewConstraintWidth.constant = CGFloat(cropRect.width)
        cropViewConstraintHeight.constant = CGFloat(cropRect.height)
        
        //Adjust the translation to correct the image's center.
        self.translation.x += (newImageCenter.x - _imageCenterForRotation.x)
        self.translation.y += (newImageCenter.y - _imageCenterForRotation.y)
        
        
        //Apply the transformation to the image view's layer.
        var t = CATransform3DIdentity
        t = CATransform3DScale(t, scale, scale, scale)
        t = CATransform3DRotate(t, rotation, 0.0, 0.0, 1.0)
        t = CATransform3DTranslate(t, translation.x, translation.y, 0.0)
        self.imageView.layer.transform = t
        
    }
    
    func handleOrientationChange_C() {
        print("ImageImportViewController.handleOrientationChange_C")
    }
    
    struct IRect {
        let x: Int
        let y: Int
        let width: Int
        let height: Int
        let midX: Int
        let midY: Int
        var center: CGPoint {
            CGPoint(x: CGFloat(midX),
                    y: CGFloat(midY))
        }
    }
    
    func getCropRect(screenWidth: Int,
                     screenHeight: Int,
                     safeAreaLeft: Int,
                     safeAreaRight: Int,
                     safeAreaTop: Int,
                     safeAreaBottom: Int,
                     toolbarHeightTop: Int,
                     toolbarHeightBottom: Int) -> IRect {
        
        let borderThickness = Device.isPad ? 24 : 6
        
        let screenRectX = (safeAreaLeft + borderThickness)
        let screenRectY = (safeAreaTop + borderThickness + toolbarHeightTop)
        let screenRectWidth = screenWidth - (safeAreaLeft + safeAreaRight + borderThickness + borderThickness)
        let screenRectHeight = screenHeight - (safeAreaTop + safeAreaBottom + borderThickness + borderThickness + toolbarHeightTop + toolbarHeightBottom)
        
        let aspectFit = CGSize(width: screenRectWidth, height: screenRectHeight).getAspectFit(CGSize(width: screenWidth, height: screenHeight))
        
        let centerX = screenRectX + (screenRectWidth >> 1)
        let centerY = screenRectY + (screenRectHeight >> 1)
        
        let aspectFitWidth2 = Int(aspectFit.size.width * 0.5 + 0.5)
        let aspectFitHeight2 = Int(aspectFit.size.height * 0.5 + 0.5)
        
        let result = IRect(x: centerX - aspectFitWidth2,
                           y: centerY - aspectFitHeight2,
                           width: Int(aspectFit.size.width + 0.5),
                           height: Int(aspectFit.size.height + 0.5),
                           midX: centerX,
                           midY: centerY)
        
        return result
    }
    
    func resetToScale(resetScale: CGFloat, cropRect: IRect) {
        scale = resetScale
        if rotationLocked == true {
            if rotationLockIndex == 0 || rotationLockIndex == 4 {
                rotation = indexRotation0
                translation = CGPoint(x: (CGFloat(cropRect.midX) / scale), y: (CGFloat(cropRect.midY) / scale))
            } else if rotationLockIndex == 1 || rotationLockIndex == 5 || rotationLockIndex == -3 {
                rotation = indexRotation1
                translation = CGPoint(x: (CGFloat(cropRect.midY) / scale), y: -(CGFloat(cropRect.midX) / scale))
            } else if rotationLockIndex == 2 || rotationLockIndex == 6 || rotationLockIndex == -2 {
                rotation = indexRotation2
                translation = CGPoint(x: -(CGFloat(cropRect.midX) / scale), y: -(CGFloat(cropRect.midY) / scale))
            } else {
                rotation = indexRotation3
                translation = CGPoint(x: -(CGFloat(cropRect.midY) / scale), y: (CGFloat(cropRect.midX) / scale))
            }
        } else {
            rotationLocked = true
            rotationLockIndex = 0
            rotation = 0.0
            translation = CGPoint(x: (CGFloat(cropRect.midX) / scale), y: (CGFloat(cropRect.midY) / scale))
        }
        
        var t = CATransform3DIdentity
        t = CATransform3DScale(t, scale, scale, scale)
        t = CATransform3DRotate(t, rotation, 0.0, 0.0, 1.0)
        t = CATransform3DTranslate(t, translation.x, translation.y, 0.0)
        imageView.layer.transform = t
    }
    
    func resetAspectFill(cropRect: IRect) {
        if cropRect.width > 16 && cropRect.height > 16 {
            
            let imageWidth = imageImportViewModel.originalImage.size.width
            let imageHeight = imageImportViewModel.originalImage.size.height
            
            
            if imageWidth > 8.0 && imageHeight > 8.0 {
                var widthRatio = CGFloat(1.0)
                var heightRatio = CGFloat(1.0)
                if rotationLocked {
                    if rotationLockIndex == 0 || rotationLockIndex == 4 || rotationLockIndex == 2 || rotationLockIndex == 6 || rotationLockIndex == -2 {
                        widthRatio = CGFloat(cropRect.width) / imageWidth
                        heightRatio = CGFloat(cropRect.height) / imageHeight
                    } else {
                        widthRatio = CGFloat(cropRect.width) / imageHeight
                        heightRatio = CGFloat(cropRect.height) / imageWidth
                    }
                } else {
                    widthRatio = CGFloat(cropRect.width) / imageWidth
                    heightRatio = CGFloat(cropRect.height) / imageHeight
                }
                if widthRatio < heightRatio {
                    resetToScale(resetScale: heightRatio, cropRect: cropRect)
                } else {
                    resetToScale(resetScale: widthRatio, cropRect: cropRect)
                }
            }
        }
    }
    
    func resetAspectFit(cropRect: IRect) {
        if cropRect.width > 16 && cropRect.height > 16 {
            let imageWidth = imageImportViewModel.originalImage.size.width
            let imageHeight = imageImportViewModel.originalImage.size.height
            
            if imageWidth > 8.0 && imageHeight > 8.0 {
                var widthRatio = CGFloat(1.0)
                var heightRatio = CGFloat(1.0)
                if rotationLocked {
                    if rotationLockIndex == 0 || rotationLockIndex == 4 || rotationLockIndex == 2 || rotationLockIndex == 6 || rotationLockIndex == -2 {
                        widthRatio = CGFloat(cropRect.width) / imageWidth
                        heightRatio = CGFloat(cropRect.height) / imageHeight
                    } else {
                        widthRatio = CGFloat(cropRect.width) / imageHeight
                        heightRatio = CGFloat(cropRect.height) / imageWidth
                    }
                } else {
                    widthRatio = CGFloat(cropRect.width) / imageWidth
                    heightRatio = CGFloat(cropRect.height) / imageHeight
                }
                if widthRatio < heightRatio {
                    resetToScale(resetScale: widthRatio, cropRect: cropRect)
                } else {
                    resetToScale(resetScale: heightRatio, cropRect: cropRect)
                }
            }
        }
    }
    
    func calculateMinMaxScales() -> Void {
        let image = imageImportViewModel.originalImage
        
        let imageWidth = image.size.width
        let imageHeight = image.size.height
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        var maxFrameDimension: CGFloat = CGFloat(cropRect.width)
        if CGFloat(cropRect.height) > maxFrameDimension {
            maxFrameDimension = CGFloat(cropRect.height)
        }
        var minFrameDimension: CGFloat = CGFloat(cropRect.width)
        if CGFloat(cropRect.height) < minFrameDimension {
            minFrameDimension = CGFloat(cropRect.height)
        }
        
        var maxImageDimension: CGFloat = imageWidth
        if imageHeight > maxImageDimension {
            maxImageDimension = imageHeight
        }
        var minImageDimension: CGFloat = CGFloat(cropRect.width)
        if imageHeight < minImageDimension {
            minImageDimension = imageHeight
        }
        
        if maxFrameDimension > 2.0 && minFrameDimension > 2.0 && maxImageDimension > 2.0 && minImageDimension > 2.0 {
            importZoomMin = (minFrameDimension / maxImageDimension) * 0.75
            importZoomMax = (maxFrameDimension / minImageDimension) * 3.0
            if scale < importZoomMin {
                importZoomMin = scale
            }
            if scale > importZoomMax {
                importZoomMax = scale
            }
        }
    }
    
    func gestureBegan(_ pos:CGPoint) {
        //Whenever any gesture recognizer starts, we reset all the recognizers and re-capture the initial state.
        startImageTouchCenter = imageView.convert(pos, from: view)
        
        gestureView.pinchGestureRecognizer.scale = 1.0
        gestureView.rotationGestureRecognizer.rotation = 0.0
        gestureView.panGestureRecognizer.setTranslation(CGPoint.zero, in: view)
        
        startScale = scale
        startRotation = rotation
    }
    
    func updateTransform() {
        if scale < importZoomMin {
            scale = importZoomMin
        } else if scale > importZoomMax {
            scale = importZoomMax
        }
        if snapToRotations == true && gestureView.isRotationGestureActive == true {
            rotationLocked = false
            for i in 0..<4 {
                var snapRotation: CGFloat = indexRotation0
                if i == 0 {
                    snapRotation = indexRotation0
                } else if i == 1 {
                    snapRotation = indexRotation1
                } else if i == 2 {
                    snapRotation = indexRotation2
                } else if i == 3 {
                    snapRotation = indexRotation3
                }
                
                var distanceBetweenAngles = CGFloat(Math.distanceBetweenAngles(Float(snapRotation), Float(rotation)))
                if distanceBetweenAngles < 0.0 {
                    distanceBetweenAngles = -distanceBetweenAngles
                }
                
                if distanceBetweenAngles < rotationLockDistance {
                    rotationLockIndex = i
                    rotationLocked = true
                    rotation = snapRotation
                    break
                }
            }
        }
        
        var t = CATransform3DIdentity
        t = CATransform3DScale(t, scale, scale, scale)
        t = CATransform3DRotate(t, rotation, 0.0, 0.0, 1.0)
        imageView.layer.transform = t
        
        //Re-center the image at the center of our touch
        //within the object, based on initial touch center.
        //(This makes the image pivot at the center of the user's fingers)
        let newImageTouchCenter = imageView.convert(touchCenter, from: view)
        translation = CGPoint(x: (newImageTouchCenter.x - startImageTouchCenter.x),
                              y: (newImageTouchCenter.y - startImageTouchCenter.y))
        
        if rotationLocked == true && snapToEdges == true {
            if gestureView.isPanGestureActive == true && gestureView.isRotationGestureActive == false && gestureView.isPinchGestureActive == false {
                let imageWidth: CGFloat = imageView.bounds.size.width * scale
                let imageHeight: CGFloat = imageView.bounds.size.height * scale
                let imageWidth2: CGFloat = imageWidth * 0.5
                let imageHeight2: CGFloat = imageHeight * 0.5
                
                let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                           screenHeight: imageImportViewModel.screenHeight,
                                           safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                           safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                           safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                           safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                           toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                           toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
                
                var tX: CGFloat = translation.x * scale
                var tY: CGFloat = translation.y * scale
                
                if rotation != 0.0 {
                    let rotatedPoint = Math.rotatePoint(point: Point(x: Float(tX), y: Float(tY)), radians: Float(rotation))
                    tX = CGFloat(rotatedPoint.x)
                    tY = CGFloat(rotatedPoint.y)
                }
                
                if rotationLockIndex == 0 || rotationLockIndex == 4 {
                    let leftX: CGFloat = tX - imageWidth2
                    let rightX: CGFloat = tX + imageWidth2
                    
                    let topY: CGFloat = tY - imageHeight2
                    let bottomY: CGFloat = tY + imageHeight2
                    
                    var leftSnapDistance: CGFloat = leftX - CGFloat(cropRect.x)
                    if leftSnapDistance < 0 {
                        leftSnapDistance = -leftSnapDistance
                    }
                    
                    var rightSnapDistance: CGFloat = rightX - (CGFloat(cropRect.x) + CGFloat(cropRect.width))
                    if rightSnapDistance < 0 {
                        rightSnapDistance = -rightSnapDistance
                    }
                    
                    if leftSnapDistance < rightSnapDistance {
                        if leftSnapDistance < snapDistance {
                            translation.x = CGFloat(cropRect.x) / scale + imageWidth2 / scale
                        }
                    } else {
                        if rightSnapDistance < snapDistance {
                            translation.x = (CGFloat(cropRect.x) + CGFloat(cropRect.width)) / scale - imageWidth2 / scale
                        }
                    }
                    
                    var topSnapDistance: CGFloat = topY - CGFloat(cropRect.y)
                    if topSnapDistance < 0 {
                        topSnapDistance = -topSnapDistance
                    }
                    
                    var bottomSnapDistance: CGFloat = bottomY - (CGFloat(cropRect.y) + CGFloat(cropRect.height))
                    if bottomSnapDistance < 0 {
                        bottomSnapDistance = -bottomSnapDistance
                    }
                    
                    if topSnapDistance < bottomSnapDistance {
                        if topSnapDistance < snapDistance {
                            translation.y = CGFloat(cropRect.y) / scale + imageHeight2 / scale
                        }
                    } else {
                        if bottomSnapDistance < snapDistance {
                            translation.y = (CGFloat(cropRect.y) + CGFloat(cropRect.height)) / scale - imageHeight2 / scale
                        }
                    }
                } else if rotationLockIndex == 1 {
                    let leftX: CGFloat = tX - imageHeight2
                    let rightX: CGFloat = tX + imageHeight2
                    
                    let topY: CGFloat = tY - imageWidth2
                    let bottomY: CGFloat = tY + imageWidth2
                    
                    var leftSnapDistance: CGFloat = leftX - CGFloat(cropRect.x)
                    if leftSnapDistance < 0 {
                        leftSnapDistance = -leftSnapDistance
                    }
                    
                    var rightSnapDistance: CGFloat = rightX - (CGFloat(cropRect.x) + CGFloat(cropRect.width))
                    if rightSnapDistance < 0 {
                        rightSnapDistance = -rightSnapDistance
                    }
                    
                    if leftSnapDistance < rightSnapDistance {
                        if leftSnapDistance < snapDistance {
                            translation.y = -(CGFloat(cropRect.x) / scale + imageHeight2 / scale)
                        }
                    } else {
                        if rightSnapDistance < snapDistance {
                            translation.y = -((CGFloat(cropRect.x) + CGFloat(cropRect.width)) / scale - imageHeight2 / scale)
                        }
                    }
                    
                    var topSnapDistance: CGFloat = topY - CGFloat(cropRect.y)
                    if topSnapDistance < 0 {
                        topSnapDistance = -topSnapDistance
                    }
                    
                    var bottomSnapDistance: CGFloat = bottomY - (CGFloat(cropRect.y) + CGFloat(cropRect.height))
                    if bottomSnapDistance < 0 {
                        bottomSnapDistance = -bottomSnapDistance
                    }
                    
                    if topSnapDistance < bottomSnapDistance {
                        if topSnapDistance < snapDistance {
                            translation.x = (CGFloat(cropRect.y) / scale + imageWidth2 / scale)
                        }
                    } else {
                        if bottomSnapDistance < snapDistance {
                            translation.x = ((CGFloat(cropRect.y) + CGFloat(cropRect.height)) / scale - imageWidth2 / scale)
                        }
                    }
                } else if rotationLockIndex == 2 {
                    let leftX: CGFloat = tX - imageWidth2
                    let rightX: CGFloat = tX + imageWidth2
                    
                    let topY: CGFloat = tY - imageHeight2
                    let bottomY: CGFloat = tY + imageHeight2
                    
                    var leftSnapDistance: CGFloat = leftX - CGFloat(cropRect.x)
                    if leftSnapDistance < 0 {
                        leftSnapDistance = -leftSnapDistance
                    }
                    
                    var rightSnapDistance: CGFloat = rightX - (CGFloat(cropRect.x) + CGFloat(cropRect.width))
                    if rightSnapDistance < 0 {
                        rightSnapDistance = -rightSnapDistance
                    }
                    
                    if leftSnapDistance < rightSnapDistance {
                        if leftSnapDistance < snapDistance {
                            translation.x = -(CGFloat(cropRect.x) / scale + imageWidth2 / scale)
                        }
                    } else {
                        if rightSnapDistance < snapDistance {
                            translation.x = -((CGFloat(cropRect.x) + CGFloat(cropRect.width)) / scale - imageWidth2 / scale)
                        }
                    }
                    
                    var topSnapDistance: CGFloat = topY - CGFloat(cropRect.y)
                    if topSnapDistance < 0 {
                        topSnapDistance = -topSnapDistance
                    }
                    
                    var bottomSnapDistance: CGFloat = bottomY - (CGFloat(cropRect.y) + CGFloat(cropRect.height))
                    if bottomSnapDistance < 0 {
                        bottomSnapDistance = -bottomSnapDistance
                    }
                    
                    if topSnapDistance < bottomSnapDistance {
                        if topSnapDistance < snapDistance {
                            translation.y = -(CGFloat(cropRect.y) / scale + imageHeight2 / scale)
                        }
                    } else {
                        if bottomSnapDistance < snapDistance {
                            translation.y = -((CGFloat(cropRect.y) + CGFloat(cropRect.height)) / scale - imageHeight2 / scale)
                        }
                    }
                } else if rotationLockIndex == 3 {
                    let leftX: CGFloat = tX - imageHeight2
                    let rightX: CGFloat = tX + imageHeight2
                    
                    let topY: CGFloat = tY - imageWidth2
                    let bottomY: CGFloat = tY + imageWidth2
                    
                    var leftSnapDistance: CGFloat = leftX - CGFloat(cropRect.x)
                    if leftSnapDistance < 0 {
                        leftSnapDistance = -leftSnapDistance
                    }
                    
                    var rightSnapDistance: CGFloat = rightX - (CGFloat(cropRect.x) + CGFloat(cropRect.width))
                    if rightSnapDistance < 0 {
                        rightSnapDistance = -rightSnapDistance
                    }
                    
                    if leftSnapDistance < rightSnapDistance {
                        if leftSnapDistance < snapDistance {
                            translation.y = (CGFloat(cropRect.x) / scale + imageHeight2 / scale)
                        }
                    } else {
                        if rightSnapDistance < snapDistance {
                            translation.y = ((CGFloat(cropRect.x) + CGFloat(cropRect.width)) / scale - imageHeight2 / scale)
                        }
                    }
                    
                    var topSnapDistance: CGFloat = topY - CGFloat(cropRect.y)
                    if topSnapDistance < 0 {
                        topSnapDistance = -topSnapDistance
                    }
                    
                    var bottomSnapDistance: CGFloat = bottomY - (CGFloat(cropRect.y) + CGFloat(cropRect.height))
                    if bottomSnapDistance < 0 {
                        bottomSnapDistance = -bottomSnapDistance
                    }
                    
                    if topSnapDistance < bottomSnapDistance {
                        if topSnapDistance < snapDistance {
                            translation.x = -(CGFloat(cropRect.y) / scale + imageWidth2 / scale)
                        }
                    } else {
                        if bottomSnapDistance < snapDistance {
                            translation.x = -((CGFloat(cropRect.y) + CGFloat(cropRect.height)) / scale - imageWidth2 / scale)
                        }
                    }
                }
            }
        }
        
        t = CATransform3DTranslate(t, translation.x, translation.y, 0.0)
        imageView.layer.transform = t
    }
    
    func cropImage() -> UIImage? {
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        if cropRect.width > 16 && cropRect.height > 16 {
            
            let image = imageImportViewModel.originalImage
            
            let imageWidth = imageImportViewModel.originalImage.size.width
            let imageHeight = imageImportViewModel.originalImage.size.height
            
            
            if imageWidth > 8.0 && imageHeight > 8.0 {
                
                let imageCenter = imageView.convert(CGPoint(x: imageWidth * 0.5, y: imageHeight * 0.5), to: view)
                let imageShift = CGPoint(x: imageCenter.x - CGFloat(cropRect.midX), y: imageCenter.y - CGFloat(cropRect.midY))
                
                let cropScale = Device.scale
                let s1 = ((view.bounds.size.width) / CGFloat(cropRect.width)) * CGFloat(cropScale)
                let s2 = ((view.bounds.size.height) / CGFloat(cropRect.height)) * CGFloat(cropScale)
                let adjustScale = max(s1, s2)
                
                let resultWidth = view.bounds.size.width * CGFloat(cropScale)
                let resultHeight = view.bounds.size.height * CGFloat(cropScale)
                
                UIGraphicsBeginImageContext(CGSize(width: resultWidth, height: resultHeight))
                
                if let context = UIGraphicsGetCurrentContext() {
                    context.setFillColor(UIColor(red: 0.09, green: 0.09, blue: 0.11, alpha: 1.0).cgColor)
                    context.fill(CGRect(x: 0.0, y: 0.0, width: resultWidth, height: resultHeight))
                    context.translateBy(x: (resultWidth / 2.0), y: (resultHeight / 2.0))
                    context.scaleBy(x: adjustScale, y: adjustScale)
                    context.translateBy(x: imageShift.x, y: imageShift.y)
                    context.scaleBy(x: scale, y: scale)
                    context.rotate(by: rotation)
                    context.translateBy(x: -(image.size.width / 2.0), y: -(image.size.height / 2.0))
                    
                    //CoreGraphics renders upside-down...
                    context.translateBy(x: 0.0, y: image.size.height)
                    context.scaleBy(x: 1.0, y: -1.0)
                    if let cgImage = image.cgImage {
                        context.draw(cgImage, in: CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height))
                    }
                    
                    let resultImage = UIGraphicsGetImageFromCurrentImageContext()
                    UIGraphicsEndImageContext()
                    return resultImage
                }
            }
        }
        return nil
    }
    
    func clickResetAspectFit() {
        if isRotatingOrResetting {
            return
        }
        if isFinished {
            return
        }
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        gestureView.cancelAllGestureRecognizers()
        isRotatingOrResetting = true
        UIView.animate(withDuration: 0.35, delay: 0.0, options: [], animations:
                        {
            self.resetAspectFit(cropRect: cropRect)
        }){ (complete) in
            self.isRotatingOrResetting = false
        }
    }
    
    func clickResetAspectFill() {
        if isRotatingOrResetting {
            return
        }
        if isFinished {
            return
        }
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        gestureView.cancelAllGestureRecognizers()
        isRotatingOrResetting = true
        UIView.animate(withDuration: 0.35, delay: 0.0, options: [], animations:
                        {
            self.resetAspectFill(cropRect: cropRect)
        }){ (complete) in
            self.isRotatingOrResetting = false
        }
    }
    
    func clickRotateRight() -> Void {
        if isRotatingOrResetting {
            return
        }
        if isFinished {
            return
        }
        
        gestureView.cancelAllGestureRecognizers()
        isRotatingOrResetting = true
        
        var animationRotation: CGFloat = rotation + CGFloat(Math.pi_2)
        var animationCompleteRotation: CGFloat = animationRotation
        
        if rotationLocked {
            if rotationLockIndex == 0 || rotationLockIndex == 4 {
                rotationLockIndex = 1
                animationRotation = indexRotation1
                animationCompleteRotation = indexRotation1
            } else if rotationLockIndex == 1 || rotationLockIndex == 5 || rotationLockIndex == -3 {
                rotationLockIndex = 2
                animationRotation = indexRotation2
                animationCompleteRotation = indexRotation2
            } else if rotationLockIndex == 2 || rotationLockIndex == 6 || rotationLockIndex == -2 {
                rotationLockIndex = 3
                animationRotation = indexRotation3
                animationCompleteRotation = indexRotation3
            } else {
                rotationLockIndex = 0
                animationRotation = indexRotation4
                animationCompleteRotation = indexRotation0
            }
        } else {
            while animationCompleteRotation > CGFloat(Math.pi2) {
                animationCompleteRotation -= CGFloat(Math.pi2)
            }
            while animationCompleteRotation < 0.0 {
                animationCompleteRotation += CGFloat(Math.pi2)
            }
        }
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        let originalCenter = imageView.convert(cropRect.center, from: view)
        
        var originalTransform = CATransform3DIdentity
        originalTransform = CATransform3DScale(originalTransform, scale, scale, scale)
        originalTransform = CATransform3DRotate(originalTransform, rotation, 0.0, 0.0, 1.0)
        originalTransform = CATransform3DTranslate(originalTransform, translation.x, translation.y, 0.0)
        
        var adjustedTransform = CATransform3DIdentity
        adjustedTransform = CATransform3DScale(adjustedTransform, scale, scale, scale)
        adjustedTransform = CATransform3DRotate(adjustedTransform, animationRotation, 0.0, 0.0, 1.0)
        
        imageView.layer.transform = adjustedTransform
        
        let newCenter = imageView.convert(cropRect.center, from: view)
        translation = CGPoint(x: (newCenter.x - originalCenter.x), y: (newCenter.y - originalCenter.y))
        adjustedTransform = CATransform3DTranslate(adjustedTransform, translation.x, translation.y, 0.0)
        
        imageView.layer.transform = originalTransform
        
        UIView.animate(withDuration: 0.30, delay: 0.0, options: [], animations:
                        {
            self.imageView.layer.transform = adjustedTransform
        }) { (didFinish: Bool) in
            self.isRotatingOrResetting = false
            self.rotation = animationCompleteRotation
        }
    }
    
    func clickRotateLeft() {
        if isRotatingOrResetting {
            return
        }
        if isFinished {
            return
        }
        
        gestureView.cancelAllGestureRecognizers()
        isRotatingOrResetting = true
        
        var animationRotation: CGFloat = rotation - CGFloat(Math.pi_2)
        var animationCompleteRotation: CGFloat = animationRotation
        
        if rotationLocked {
            if rotationLockIndex == 0 || rotationLockIndex == 4 {
                rotationLockIndex = 3
                animationRotation = indexRotationN
                animationCompleteRotation = indexRotation3
            } else if rotationLockIndex == 1 || rotationLockIndex == 5 || rotationLockIndex == -3 {
                rotationLockIndex = 0
                animationRotation = indexRotation0
                animationCompleteRotation = indexRotation0
            } else if rotationLockIndex == 2 || rotationLockIndex == 6 || rotationLockIndex == -2 {
                rotationLockIndex = 1
                animationRotation = indexRotation1
                animationCompleteRotation = indexRotation1
            } else {
                rotationLockIndex = 2
                animationRotation = indexRotation2
                animationCompleteRotation = indexRotation2
            }
        } else {
            while animationCompleteRotation > CGFloat(Math.pi2) {
                animationCompleteRotation -= CGFloat(Math.pi2)
            }
            while animationCompleteRotation < 0.0 {
                animationCompleteRotation += CGFloat(Math.pi2)
            }
        }
        
        let cropRect = getCropRect(screenWidth: imageImportViewModel.screenWidth,
                                   screenHeight: imageImportViewModel.screenHeight,
                                   safeAreaLeft: imageImportViewModel.layoutRelay.safeAreaLeft,
                                   safeAreaRight: imageImportViewModel.layoutRelay.safeAreaRight,
                                   safeAreaTop: imageImportViewModel.layoutRelay.safeAreaTop,
                                   safeAreaBottom: imageImportViewModel.layoutRelay.safeAreaBottom,
                                   toolbarHeightTop: imageImportViewModel.toolbarHeightTop,
                                   toolbarHeightBottom: imageImportViewModel.toolbarHeightBottom)
        
        let originalCenter = imageView.convert(cropRect.center, from: view)
        
        var originalTransform = CATransform3DIdentity
        originalTransform = CATransform3DScale(originalTransform, scale, scale, scale)
        originalTransform = CATransform3DRotate(originalTransform, rotation, 0.0, 0.0, 1.0)
        originalTransform = CATransform3DTranslate(originalTransform, translation.x, translation.y, 0.0)
        
        var adjustedTransform = CATransform3DIdentity
        adjustedTransform = CATransform3DScale(adjustedTransform, scale, scale, scale)
        adjustedTransform = CATransform3DRotate(adjustedTransform, animationRotation, 0.0, 0.0, 1.0)
        
        imageView.layer.transform = adjustedTransform
        
        let newCenter = imageView.convert(cropRect.center, from: view)
        translation = CGPoint(x: (newCenter.x - originalCenter.x), y: (newCenter.y - originalCenter.y))
        adjustedTransform = CATransform3DTranslate(adjustedTransform, translation.x, translation.y, 0.0)
        
        imageView.layer.transform = originalTransform
        
        UIView.animate(withDuration: 0.30, delay: 0.0, options: [], animations:
                        {
            self.imageView.layer.transform = adjustedTransform
        }) { (didFinish) in
            self.isRotatingOrResetting = false
            self.rotation = animationCompleteRotation
        }
    }
    
    func clickNext() {
        isFinished = true
        DispatchQueue.main.async {
            
            if let croppedImage = self.cropImage() {
                
                let orientation: Orientation
                if croppedImage.size.width > croppedImage.size.height {
                    orientation = .landscape
                } else {
                    orientation = .portrait
                }
         
                let documentWidth: Int
                let documentHeight: Int
                
                if orientation.isLandscape {
                    if Device.isPad {
                        documentWidth = Int(ApplicationController.widthLandscape)
                        documentHeight = Int(ApplicationController.heightLandscape)
                    } else {
                        documentWidth = Int(ApplicationController.widthLandscape * 2.0)
                        documentHeight = Int(ApplicationController.heightLandscape * 2.0)
                    }
                } else {
                    if Device.isPad {
                        documentWidth = Int(ApplicationController.widthPortrait)
                        documentHeight = Int(ApplicationController.heightPortrait)
                    } else {
                        documentWidth = Int(ApplicationController.widthPortrait * 2.0)
                        documentHeight = Int(ApplicationController.heightPortrait * 2.0)
                    }
                }
                
                let jiggleDocument = JiggleDocument(image: croppedImage,
                                                    orientation: orientation,
                                                    documentWidth: documentWidth,
                                                    documentHeight: documentHeight)
                ApplicationController.rootViewModel.pushToJiggle(jiggleDocument: jiggleDocument,
                                                                 animated: true,
                                                                 reversed: false)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ImageImportViewController")
        }
    }
}
