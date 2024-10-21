//
//  DialogBoxRowViewEditThumb.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/26/24.
//

import UIKit
import SwiftUI

class DialogBoxRowViewEditThumb: UIView {
    
    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    static var cropBoxSize: CGFloat {
        return 130.0
    }
    
    static var cropBoxBorderThickness: CGFloat {
        return 2.0
    }
    
    static var cropBoxCornerRadius: CGFloat {
        return 8.0
    }
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var cropBoxContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var cropBoxClipView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.layer.cornerRadius = CGFloat(Self.cropBoxCornerRadius)
        result.layer.borderColor = UIColor.systemCyan.cgColor
        result.layer.borderWidth = 1.0
        result.isUserInteractionEnabled = false
        return result
    }()
    
    lazy var cropBoxScrollView: UIScrollView = {
        let result = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        result.backgroundColor = DialogTheme.dialogTextField
        result.layer.cornerRadius = CGFloat(Self.cropBoxCornerRadius - Self.cropBoxBorderThickness)
        result.contentInsetAdjustmentBehavior = .never
        return result
    }()
    
    lazy var cropBoxScrollContentView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var imageView: UIImageView = {
        let result = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.image = model.fullSizedImage
        return result
    }()
    
    func getHostingViewController<ViewType: View>(view: ViewType) -> UIHostingController<ViewType> {
        let result = UIHostingController(rootView: view)
        result.view.translatesAutoresizingMaskIntoConstraints = false
        result.view.backgroundColor = UIColor.clear
        return result
    }
    
    var viewControllers = [UIViewController]()
    let model: DialogBoxRowModelEditThumb
    init(model: DialogBoxRowModelEditThumb) {
        self.model = model
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        addSubview(containerView)
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        let cropBoxSize = Self.cropBoxSize
        let cropBoxBorderThickness = Self.cropBoxBorderThickness
        let cropBoxBorderThickness2 = (cropBoxBorderThickness + 1)
        
        let height = cropBoxSize + cropBoxBorderThickness2
        
        addConstraint(
            NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(height))
        )
        
        
        containerView.addSubview(cropBoxContainerView)
        cropBoxContainerView.addConstraints([
            NSLayoutConstraint(item: cropBoxContainerView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: CGFloat(cropBoxSize + cropBoxBorderThickness2)),
            NSLayoutConstraint(item: cropBoxContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: CGFloat(cropBoxSize + cropBoxBorderThickness2))
        ])
        containerView.addConstraints([
            NSLayoutConstraint(item: cropBoxContainerView, attribute: .centerX, relatedBy: .equal,
                               toItem: containerView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropBoxContainerView, attribute: .centerY, relatedBy: .equal,
                               toItem: containerView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
        ])
        
        cropBoxContainerView.addSubview(cropBoxScrollView)
        cropBoxScrollView.addConstraints([
            NSLayoutConstraint(item: cropBoxScrollView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: CGFloat(cropBoxSize)),
            NSLayoutConstraint(item: cropBoxScrollView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: CGFloat(cropBoxSize))
        ])
        cropBoxContainerView.addConstraints([
            NSLayoutConstraint(item: cropBoxScrollView, attribute: .centerX, relatedBy: .equal,
                               toItem: cropBoxContainerView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropBoxScrollView, attribute: .centerY, relatedBy: .equal,
                               toItem: cropBoxContainerView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
        ])
        
        cropBoxContainerView.addSubview(cropBoxClipView)
        cropBoxClipView.addConstraints([
            NSLayoutConstraint(item: cropBoxClipView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: CGFloat(cropBoxSize + cropBoxBorderThickness2)),
            NSLayoutConstraint(item: cropBoxClipView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0,
                               constant: CGFloat(cropBoxSize + cropBoxBorderThickness2))
        ])
        cropBoxContainerView.addConstraints([
            NSLayoutConstraint(item: cropBoxClipView, attribute: .centerX, relatedBy: .equal,
                               toItem: cropBoxContainerView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: cropBoxClipView, attribute: .centerY, relatedBy: .equal,
                               toItem: cropBoxContainerView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
        ])
        
        let hostingViewControllerLeft: UIViewController
        let hostingViewControllerRight: UIViewController
        if let fullSizedImage = model.fullSizedImage {
            
            if fullSizedImage.size.width > 12.0 && fullSizedImage.size.height > 12.0 {
                
                cropBoxScrollView.delegate = self
                cropBoxScrollView.addSubview(cropBoxScrollContentView)
                
                cropBoxScrollContentView.addSubview(imageView)
                cropBoxScrollContentView.addConstraints([
                    imageView.leftAnchor.constraint(equalTo: cropBoxScrollContentView.leftAnchor),
                    imageView.rightAnchor.constraint(equalTo: cropBoxScrollContentView.rightAnchor),
                    imageView.topAnchor.constraint(equalTo: cropBoxScrollContentView.topAnchor),
                    imageView.bottomAnchor.constraint(equalTo: cropBoxScrollContentView.bottomAnchor)
                ])
                
                //imageView
                
                let imageWidth = fullSizedImage.size.width
                let imageHeight = fullSizedImage.size.height
                
                if imageHeight == imageWidth {
                    
                    hostingViewControllerLeft = getHostingViewController(view: ArrowViewSquare())
                    hostingViewControllerRight = getHostingViewController(view: ArrowViewSquare())
                    
                    
                    cropBoxScrollContentView.addConstraints([
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .width, relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: CGFloat(cropBoxSize)),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .height, relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: CGFloat(cropBoxSize))
                    ])
                    
                    cropBoxScrollView.addConstraints([
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .centerX, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .centerY, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    ])
                    
                } else if imageHeight > imageWidth {
                    
                    hostingViewControllerLeft = getHostingViewController(view: ArrowViewUpDown())
                    hostingViewControllerRight = getHostingViewController(view: ArrowViewUpDown())
                    
                    let scale = imageWidth / CGFloat(cropBoxSize)
                    let height = imageHeight / scale
                    
                    print("imageWidth = \(imageWidth)")
                    print("imageHeight = \(imageHeight)")
                    
                    print("boxWidth = \(cropBoxSize)")
                    print("boxHeight = \(height)")
                    
                    cropBoxScrollContentView.addConstraints([
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .width, relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: CGFloat(cropBoxSize)),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .height, relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: height)
                    ])
                    
                    cropBoxScrollView.addConstraints([
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .top, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .top, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .bottom, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .centerX, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                    ])
                    
                    
                } else {
                    
                    hostingViewControllerLeft = getHostingViewController(view: ArrowViewRightLeft())
                    hostingViewControllerRight = getHostingViewController(view: ArrowViewRightLeft())
                    
                    let scale = imageHeight / CGFloat(cropBoxSize)
                    let width = imageWidth / scale
                    
                    cropBoxScrollContentView.addConstraints([
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .width, relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: width),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .height, relatedBy: .equal, toItem: nil,
                                           attribute: .notAnAttribute, multiplier: 1.0,
                                           constant: CGFloat(cropBoxSize))
                    ])
                    
                    cropBoxScrollView.addConstraints([
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .left, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .right, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: cropBoxScrollContentView, attribute: .centerY, relatedBy: .equal,
                                           toItem: cropBoxScrollView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    ])
                    
                }
            } else {
                hostingViewControllerLeft = getHostingViewController(view: ArrowViewSquare())
                hostingViewControllerRight = getHostingViewController(view: ArrowViewSquare())
            }
        } else {
            hostingViewControllerLeft = getHostingViewController(view: ArrowViewSquare())
            hostingViewControllerRight = getHostingViewController(view: ArrowViewSquare())
        }
        
        viewControllers.append(hostingViewControllerLeft)
        viewControllers.append(hostingViewControllerRight)
        
        if let hostingViewLeft = hostingViewControllerLeft.view {
            containerView.addSubview(hostingViewLeft)
            containerView.addConstraints([
                NSLayoutConstraint(item: hostingViewLeft, attribute: .left, relatedBy: .equal,
                                   toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: hostingViewLeft, attribute: .top, relatedBy: .equal,
                                   toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: hostingViewLeft, attribute: .bottom, relatedBy: .equal,
                                   toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: hostingViewLeft, attribute: .right, relatedBy: .equal,
                                   toItem: cropBoxContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            ])
        }
        
        if let hostingViewRight = hostingViewControllerRight.view {
            containerView.addSubview(hostingViewRight)
            containerView.addConstraints([
                NSLayoutConstraint(item: hostingViewRight, attribute: .right, relatedBy: .equal,
                                   toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: hostingViewRight, attribute: .top, relatedBy: .equal,
                                   toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: hostingViewRight, attribute: .bottom, relatedBy: .equal,
                                   toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: hostingViewRight, attribute: .left, relatedBy: .equal,
                                   toItem: cropBoxContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            ])
        }
        
        
        print("originalThumbCropFrame => x\(model.originalThumbCropFrame.x)")
        print("originalThumbCropFrame => y\(model.originalThumbCropFrame.y)")
        print("originalThumbCropFrame => w\(model.originalThumbCropFrame.width)")
        print("originalThumbCropFrame => h\(model.originalThumbCropFrame.height)")
        
        let fX = model.originalThumbCropFrame.x
        let fY = model.originalThumbCropFrame.y
        let fWidth = model.originalThumbCropFrame.width
        let fHeight = model.originalThumbCropFrame.height
        
        if let fullSizedImage = model.fullSizedImage {
            let imageWidth = Int(fullSizedImage.size.width + 0.5)
            let imageHeight = Int(fullSizedImage.size.height + 0.5)
            if imageWidth > 8 && imageHeight > 8 {
                if fWidth > 0 && fHeight > 0 {
                    if (fX + fWidth <= imageWidth) && (fY + fHeight <= imageHeight) {
                        if imageHeight == imageWidth {
                            cropBoxScrollView.contentSize = CGSize(width: CGFloat(cropBoxSize),
                                                                   height: CGFloat(cropBoxSize))
                        } else if imageHeight > imageWidth {
                            let percentY = CGFloat(fY) / (CGFloat(imageHeight) - CGFloat(imageWidth))
                            let scale = CGFloat(imageWidth) / CGFloat(cropBoxSize)
                            let width = CGFloat(cropBoxSize)
                            let height = CGFloat(imageHeight) / scale
                            let scrollableSize = CGFloat(height) - CGFloat(cropBoxSize)
                            let contentOffset = CGPoint(x: 0.0,
                                                        y: scrollableSize * percentY)
                            cropBoxScrollView.contentSize = CGSize(width: width,
                                                                   height: height)
                            cropBoxScrollView.contentOffset = contentOffset
                        } else {
                            let percentX = CGFloat(fX) / (CGFloat(imageWidth) - CGFloat(imageHeight))
                            let scale = CGFloat(imageHeight) / CGFloat(cropBoxSize)
                            let width = CGFloat(imageWidth) / scale
                            let height = CGFloat(cropBoxSize)
                            let scrollableSize = CGFloat(width) - CGFloat(cropBoxSize)
                            let contentOffset = CGPoint(x: scrollableSize * percentX,
                                                        y: 0.0)
                            cropBoxScrollView.contentSize = CGSize(width: width,
                                                                   height: height)
                            cropBoxScrollView.setContentOffset(contentOffset, animated: false)
                        }
                    }
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dispose() {
        model.dispose()
        viewControllers.removeAll()
        cropBoxScrollView.delegate = nil
        print("DialogBoxRowViewEditThumb.dispose()")
    }
    
    
}

extension DialogBoxRowViewEditThumb: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffset = scrollView.contentOffset
        
        print("contentOffset = \(contentOffset)")
        
        var x = 0
        var y = 0
        var width = 0
        var height = 0
        
        if let fullSizedImage = model.fullSizedImage {
            if fullSizedImage.size.width > 12.0 && fullSizedImage.size.height > 12.0 {
                
                
                let imageWidth = fullSizedImage.size.width
                let imageHeight = fullSizedImage.size.height
                
                let imageWidthI = Int(imageWidth + 0.5)
                let imageHeightI = Int(imageHeight + 0.5)
                
                if imageHeight == imageWidth {
                    width = imageWidthI
                    height = imageHeightI
                } else if imageHeight > imageWidth {
                    let widthFactor = CGFloat(Self.cropBoxSize) / CGFloat(imageWidthI)
                    let factoredHeight = widthFactor * imageHeight
                    let maxScrollY = factoredHeight - CGFloat(Self.cropBoxSize)
                    let percentY = contentOffset.y / maxScrollY
                    y = Int(percentY * (imageHeight - imageWidth) + 0.5)
                    width = imageWidthI
                    height = imageWidthI
                    let maxY = imageHeightI - imageWidthI
                    if y > maxY { y = maxY }
                    if y < 0 { y = 0 }
                } else {
                    let heightFactor = CGFloat(Self.cropBoxSize) / CGFloat(imageHeightI)
                    let factoredWidth = heightFactor * imageWidth
                    let maxScrollX = factoredWidth - CGFloat(Self.cropBoxSize)
                    let percentX = contentOffset.x / maxScrollX
                    x = Int(percentX * (imageWidth - imageHeight) + 0.5)
                    width = imageHeightI
                    height = imageHeightI
                    let maxX = imageWidthI - imageHeightI
                    if x > maxX { x = maxX }
                    if x < 0 { x = 0 }
                }
            }
        }
        
        var thumbCropFrame = ThumbCropFrame()
        thumbCropFrame.x = x
        thumbCropFrame.y = y
        thumbCropFrame.width = width
        thumbCropFrame.height = height
        model.action?(thumbCropFrame)
        
    }
}
