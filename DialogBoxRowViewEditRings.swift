//
//  DialogBoxRowViewEditRings.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/5/24.
//

import UIKit

class DialogBoxRowViewEditRings: UIView {
    
    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    static var font: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var ringBuilderViewController: RingBuilderViewController = {
        let result = RingBuilderViewController(nibName: nil, bundle: nil)
        result.view.translatesAutoresizingMaskIntoConstraints = false
        if let resultView = result.view {
            resultView.addConstraint(
                NSLayoutConstraint(item: resultView, attribute: .height, relatedBy: .equal,
                                   toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                   constant: RingBuilderViewController.height))
        }
        return result
    }()
    
    let model: DialogBoxRowModelEditRings
    init(model: DialogBoxRowModelEditRings) {
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
        
        if let ringBuilderView = ringBuilderViewController.view {
            containerView.addSubview(ringBuilderView)
            containerView.addConstraints([
                NSLayoutConstraint(item: ringBuilderView, attribute: .left, relatedBy: .equal, toItem: containerView,
                                   attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: ringBuilderView, attribute: .right, relatedBy: .equal, toItem: containerView,
                                   attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: ringBuilderView, attribute: .top, relatedBy: .equal, toItem: containerView,
                                   attribute: .top, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: ringBuilderView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                                   attribute: .bottom, multiplier: 1.0, constant: 0.0)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dispose() {
        model.dispose()
        print("DialogBoxRowViewMessageBody.dispose()")
    }
}
