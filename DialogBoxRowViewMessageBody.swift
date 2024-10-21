//
//  DialogBoxRowViewMessageBody.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class DialogBoxRowViewMessageBody: UIView {
    
    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    static var paddingLeft: CGFloat {
        return 6.0
    }
    
    static var paddingRight: CGFloat {
        return 6.0
    }
    
    static var paddingTop: CGFloat {
        6.0
    }
    
    static var paddingBottom: CGFloat {
        return 2.0
    }
    
    static var font: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var label: UILabel = {
        let result = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.text = model.title
        result.font = Self.font
        result.numberOfLines = 0
        result.textAlignment = .center
        result.textColor = DialogTheme.dialogTextMessage
        return result
    }()
    
    let model: DialogBoxRowModelMessageBody
    init(model: DialogBoxRowModelMessageBody) {
        self.model = model
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        addSubview(containerView)
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: Self.paddingLeft),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: -Self.paddingRight),
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: Self.paddingTop),
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: -Self.paddingBottom)
        ])
        
        containerView.addSubview(label)
        containerView.addConstraints([
            NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: Self.paddingLeft),
            NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: -Self.paddingRight),
            NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: Self.paddingTop),
            NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: -Self.paddingBottom)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dispose() {
        model.dispose()
        print("DialogBoxRowViewMessageBody.dispose()")
    }
}
