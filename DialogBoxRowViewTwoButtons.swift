//
//  DialogBoxRowViewTwoButtons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class DialogBoxRowViewTwoButtons: UIView {
    
    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    var viewControllers = [UIViewController]()
    let model: DialogBoxRowModelTwoButtons
    init(model: DialogBoxRowModelTwoButtons) {
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
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        let buttonLeftViewController = model.buttonLeft.manufactureButton()
        viewControllers.append(buttonLeftViewController)
        let buttonRightViewController = model.buttonRight.manufactureButton()
        viewControllers.append(buttonRightViewController)
        
        if let buttonLeftView = buttonLeftViewController.view, let buttonRightView = buttonRightViewController.view {
            buttonLeftView.translatesAutoresizingMaskIntoConstraints = false
            buttonRightView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(buttonLeftView)
            containerView.addSubview(buttonRightView)
            
            let separatorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
            separatorView.backgroundColor = DialogTheme.dialogSeparator
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(separatorView)
            
            separatorView.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .width, relatedBy: .equal, toItem: nil,
                                                           attribute: .notAnAttribute, multiplier: 1.0,
                                                           constant: CGFloat(DialogTheme.separatorHeight)))
            
            containerView.addConstraints([
                NSLayoutConstraint(item: separatorView, attribute: .centerX, relatedBy: .equal,
                                   toItem: containerView, attribute: .centerX, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal,
                                   toItem: containerView, attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: separatorView, attribute: .bottom, relatedBy: .equal,
                                   toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: 0.0)
            ])
            
            containerView.addConstraints([
                NSLayoutConstraint(item: buttonLeftView, attribute: .right, relatedBy: .equal, toItem: separatorView,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonLeftView, attribute: .left, relatedBy: .equal, toItem: containerView,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonLeftView, attribute: .top, relatedBy: .equal, toItem: containerView,
                                   attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonLeftView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                                   attribute: .bottom, multiplier: 1.0, constant: 0.0)
            ])
            
            containerView.addConstraints([
                NSLayoutConstraint(item: buttonRightView, attribute: .left, relatedBy: .equal, toItem: separatorView,
                                   attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonRightView, attribute: .right, relatedBy: .equal, toItem: containerView,
                                   attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonRightView, attribute: .top, relatedBy: .equal, toItem: containerView,
                                   attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonRightView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                                   attribute: .bottom, multiplier: 1.0, constant: 0.0)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dispose() {
        model.dispose()
        viewControllers.removeAll(keepingCapacity: true)
        print("DialogBoxRowViewTwoButtons.dispose()")
    }
    
    deinit {
        print("~DialogBoxRowViewTwoButtons")
    }
}
