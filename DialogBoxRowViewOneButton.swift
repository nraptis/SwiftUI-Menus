//
//  DialogBoxRowViewOneButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class DialogBoxRowViewOneButton: UIView {
    
    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    var viewControllers = [UIViewController]()
    let model: DialogBoxRowModelOneButton
    init(model: DialogBoxRowModelOneButton) {
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
        
        let buttonViewController = model.button.manufactureButton()
        viewControllers.append(buttonViewController)
        if let buttonView = buttonViewController.view {
            buttonView.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(buttonView)
            containerView.addConstraints([
                NSLayoutConstraint(item: buttonView, attribute: .left, relatedBy: .equal, toItem: containerView,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonView, attribute: .right, relatedBy: .equal, toItem: containerView,
                                   attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonView, attribute: .top, relatedBy: .equal, toItem: containerView,
                                   attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: buttonView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
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
        print("DialogBoxRowViewOneButton.dispose()")
    }
    
}
