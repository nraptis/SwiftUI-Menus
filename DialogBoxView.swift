//
//  DialogBoxView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/22/24.
//

import UIKit
import SwiftUI

class DialogBoxView: UIView {
    
    lazy var widthConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: nil,
                           attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0)
    }()
    
    lazy var backgroundViewController: UIHostingController<DialogBoxBackgroundView> = {
        var result = UIHostingController(rootView: DialogBoxBackgroundView())
        result.view.backgroundColor = .clear
        result.view.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var scrollViewTopHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: scrollViewTop, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0)
    }()
    
    lazy var scrollViewTop: UIScrollView = {
        let result = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var scrollContentTop: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var scrollViewBottomHeightConstraint: NSLayoutConstraint = {
        NSLayoutConstraint(item: scrollViewBottom, attribute: .height, relatedBy: .equal,
                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 64.0)
    }()
    
    lazy var scrollViewBottom: UIScrollView = {
        let result = UIScrollView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var scrollContentBottom: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var topAndBottomSeparatorView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = DialogTheme.dialogSeparator
        return result
    }()
    
    lazy var loadingView: DialogBoxLoadingView = {
        let result = DialogBoxLoadingView(isShowing: false)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    let bodyRowViews: [UIView]
    let buttonRowViews: [UIView]
    let separatorViews: [UIView]
    
    let dialogBox: DialogBoxModel
    var orientation: Orientation
    var screenWidth: Int
    var screenHeight: Int
    var safeAreaLeft: Int
    var safeAreaRight: Int
    var safeAreaTop: Int
    var safeAreaBottom: Int
    init(dialogBox: DialogBoxModel,
         orientation: Orientation,
         screenWidth: Int,
         screenHeight: Int,
         safeAreaLeft: Int,
         safeAreaRight: Int,
         safeAreaTop: Int,
         safeAreaBottom: Int) {
        
        self.dialogBox = dialogBox
        self.orientation = orientation
        self.screenWidth = screenWidth
        self.screenHeight = screenHeight
        self.safeAreaLeft = safeAreaLeft
        self.safeAreaRight = safeAreaRight
        self.safeAreaTop = safeAreaTop
        self.safeAreaBottom = safeAreaBottom
        
        var _bodyRowViews = [UIView]()
        for bodyRowModel in dialogBox.bodyRowModels {
            if let view = bodyRowModel.manufactureView() {
                _bodyRowViews.append(view)
            }
        }
        if _bodyRowViews.count <= 0 {
            _bodyRowViews.append(DialogBoxRowViewTitleBar(model: DialogBoxRowModelTitleBar(title: "No Body Rows")))
        }
        self.bodyRowViews = _bodyRowViews
        
        var _buttonRowViews = [UIView]()
        for buttonRowModel in dialogBox.buttonRowModels {
            if let view = buttonRowModel.manufactureView() {
                _buttonRowViews.append(view)
            }
        }
        if _buttonRowViews.count <= 0 {
            _buttonRowViews.append(DialogBoxRowViewTitleBar(model: DialogBoxRowModelTitleBar(title: "No Body Rows")))
        }
        self.buttonRowViews = _buttonRowViews
        
        var _separatorViews = [UIView]()
        if _buttonRowViews.count > 1 {
            for _ in 1..<_buttonRowViews.count {
                let separatorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
                separatorView.translatesAutoresizingMaskIntoConstraints = false
                separatorView.backgroundColor = DialogTheme.dialogSeparator
                _separatorViews.append(separatorView)
            }
        }
        
        self.separatorViews = _separatorViews
        
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        addConstraint(widthConstraint)
        
        addSubview(containerView)
        addConstraints([
            containerView.leftAnchor.constraint(equalTo: self.leftAnchor),
            containerView.rightAnchor.constraint(equalTo: self.rightAnchor),
            containerView.topAnchor.constraint(equalTo: self.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        if let backgroundViewControllerView = backgroundViewController.view {
            containerView.addSubview(backgroundViewControllerView)
            containerView.addConstraints([backgroundViewControllerView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                                          backgroundViewControllerView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                                          backgroundViewControllerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                                          backgroundViewControllerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)])
        }
        
        containerView.addSubview(scrollViewTop)
        scrollViewTop.addConstraint(scrollViewTopHeightConstraint)
        addConstraints([
            NSLayoutConstraint(item: scrollViewTop, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollViewTop, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollViewTop, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
        ])
        
        scrollViewTop.addSubview(scrollContentTop)
        scrollViewTop.addConstraints([
            NSLayoutConstraint(item: scrollContentTop, attribute: .width, relatedBy: .equal,
                               toItem: scrollViewTop, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollContentTop, attribute: .centerX, relatedBy: .equal,
                               toItem: scrollViewTop, attribute: .centerX, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollContentTop, attribute: .top, relatedBy: .equal,
                               toItem: scrollViewTop, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollContentTop, attribute: .bottom, relatedBy: .equal,
                               toItem: scrollViewTop, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0),
        ])
        
        containerView.addSubview(topAndBottomSeparatorView)
        topAndBottomSeparatorView.addConstraint(
            NSLayoutConstraint(item: topAndBottomSeparatorView, attribute: .height, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, 
                               constant: CGFloat(DialogTheme.separatorHeight))
        )
        
        containerView.addConstraints([
            NSLayoutConstraint(item: topAndBottomSeparatorView, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: topAndBottomSeparatorView, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: topAndBottomSeparatorView, attribute: .top, relatedBy: .equal,
                               toItem: scrollViewTop, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0),
        ])
        
        containerView.addSubview(scrollViewBottom)
        scrollViewBottom.addConstraint(scrollViewBottomHeightConstraint)
        addConstraints([
            NSLayoutConstraint(item: scrollViewBottom, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollViewBottom, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollViewBottom, attribute: .top, relatedBy: .equal,
                               toItem: topAndBottomSeparatorView, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollViewBottom, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0),
        ])
        
        scrollViewBottom.addSubview(scrollContentBottom)
        scrollViewBottom.addConstraints([
            NSLayoutConstraint(item: scrollContentBottom, attribute: .width, relatedBy: .equal,
                               toItem: scrollViewBottom, attribute: .width, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollContentBottom, attribute: .centerX, relatedBy: .equal,
                               toItem: scrollViewBottom, attribute: .centerX, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollContentBottom, attribute: .top, relatedBy: .equal,
                               toItem: scrollViewBottom, attribute: .top, multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: scrollContentBottom, attribute: .bottom, relatedBy: .equal,
                               toItem: scrollViewBottom, attribute: .bottom, multiplier: 1.0,
                               constant: 0.0),
        ])
        
        for index in 0..<bodyRowViews.count {
            let rowView = bodyRowViews[index]
            rowView.translatesAutoresizingMaskIntoConstraints = false
            scrollContentTop.addSubview(rowView)
            scrollContentTop.addConstraints([
                NSLayoutConstraint(item: rowView, attribute: .left, relatedBy: .equal, toItem: scrollContentTop,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: rowView, attribute: .right, relatedBy: .equal, toItem: scrollContentTop,
                                   attribute: .right, multiplier: 1.0, constant: 0.0)
            ])
        }
        
        for index in 0..<buttonRowViews.count {
            let rowView = buttonRowViews[index]
            rowView.translatesAutoresizingMaskIntoConstraints = false
            scrollContentBottom.addSubview(rowView)
            scrollContentBottom.addConstraints([
                NSLayoutConstraint(item: rowView, attribute: .left, relatedBy: .equal, toItem: scrollContentBottom,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: rowView, attribute: .right, relatedBy: .equal, toItem: scrollContentBottom,
                                   attribute: .right, multiplier: 1.0, constant: 0.0)
            ])
        }
        
        for index in 0..<separatorViews.count {
            let separatorView = separatorViews[index]
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            scrollContentBottom.addSubview(separatorView)
            scrollContentBottom.addConstraints([
                NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal, toItem: scrollContentBottom,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal, toItem: scrollContentBottom,
                                   attribute: .right, multiplier: 1.0, constant: 0.0)
            ])
            separatorView.addConstraint(
                NSLayoutConstraint(item: separatorView, attribute: .height, relatedBy: .equal,
                                   toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                   constant: CGFloat(DialogTheme.separatorHeight))
            )
        }
        
        
        
        for index in 0..<bodyRowViews.count {
            
            let rowView = bodyRowViews[index]
            
            if index == 0 {
                scrollContentTop.addConstraint(NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: scrollContentTop,
                                                                  attribute: .top, multiplier: 1.0, constant: 0.0))
            }
            
            if index < (bodyRowViews.count - 1) {
                let viewBelow = bodyRowViews[index + 1]
                scrollContentTop.addConstraint(NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: viewBelow,
                                                                  attribute: .top, multiplier: 1.0, constant: 0.0))
            } else {
                scrollContentTop.addConstraint(NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: scrollContentTop,
                                                                  attribute: .bottom, multiplier: 1.0, constant: 0.0))
            }
        }
        
        for index in 0..<buttonRowViews.count {
            let rowView = buttonRowViews[index]
            
            if index == 0 {
                scrollContentBottom.addConstraint(NSLayoutConstraint(item: rowView, attribute: .top, relatedBy: .equal, toItem: scrollContentBottom,
                                                                     attribute: .top, multiplier: 1.0, constant: 0.0))
            }
            
            if index < (buttonRowViews.count - 1) {
                let separatorView = separatorViews[index]
                scrollContentBottom.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal, toItem: rowView,
                                                                     attribute: .bottom, multiplier: 1.0, constant: 0.0))
                
                let viewBelow = buttonRowViews[index + 1]
                scrollContentBottom.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .bottom, relatedBy: .equal, toItem: viewBelow,
                                                                     attribute: .top, multiplier: 1.0, constant: 0.0))
                
            } else {
                scrollContentBottom.addConstraint(NSLayoutConstraint(item: rowView, attribute: .bottom, relatedBy: .equal, toItem: scrollContentBottom,
                                                                     attribute: .bottom, multiplier: 1.0, constant: 0.0))
            }
        }
        
        containerView.addSubview(loadingView)
        containerView.addConstraints([loadingView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
                                      loadingView.rightAnchor.constraint(equalTo: containerView.rightAnchor),
                                      loadingView.topAnchor.constraint(equalTo: containerView.topAnchor),
                                      loadingView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)])
        
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 12.0
        containerView.layer.borderColor = DialogTheme.dialogSeparator.cgColor
        containerView.layer.borderWidth = 1.0
        
        
        
        
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct SetupResult {
        let totalHeight: CGFloat
        let topHeight: CGFloat
        let bottomHeight: CGFloat
    }
    
    func handleSafeArea(safeAreaLeft: Int,
                        safeAreaRight: Int,
                        safeAreaTop: Int,
                        safeAreaBottom: Int) {
        
    }
    
    func loadingViewShow(text: String) {
        
        scrollViewTop.deactivate()
        topAndBottomSeparatorView.deactivate()
        scrollViewBottom.deactivate()
        
        loadingView.show()
        loadingView.label.text = text
    }
    
    func loadingViewHide() {
        
        scrollViewTop.activate()
        topAndBottomSeparatorView.activate()
        scrollViewBottom.activate()
        
        loadingView.hide()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
