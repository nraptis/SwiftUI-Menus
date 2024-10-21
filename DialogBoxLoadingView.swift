//
//  DialogBoxLoadingView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/5/24.
//

import UIKit

class DialogBoxLoadingView: UIView {
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let result = UIActivityIndicatorView(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.style = .medium
        result.color = DialogTheme.dialogTextMessage
        return result
    }()
    
    static var font: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
    
    lazy var labelContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var label: UILabel = {
        let result = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.font = Self.font
        result.numberOfLines = 0
        result.textAlignment = .center
        result.textColor = DialogTheme.dialogTextMessage
        return result
    }()
    
    init(isShowing: Bool) {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        addSubview(activityIndicatorView)
        addConstraints([
            NSLayoutConstraint(item: activityIndicatorView, attribute: .centerX, relatedBy: .equal,
                               toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: activityIndicatorView, attribute: .centerY, relatedBy: .equal,
                               toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
        
        ])
        
        addSubview(labelContainerView)
        addConstraints([
            NSLayoutConstraint(item: labelContainerView, attribute: .left, relatedBy: .equal,
                               toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: labelContainerView, attribute: .right, relatedBy: .equal,
                               toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: labelContainerView, attribute: .bottom, relatedBy: .equal,
                               toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: labelContainerView, attribute: .top, relatedBy: .equal,
                               toItem: activityIndicatorView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            
        ])
        
        labelContainerView.addSubview(label)
        
        addConstraints([
            NSLayoutConstraint(item: label, attribute: .left, relatedBy: .equal,
                               toItem: labelContainerView, attribute: .left, multiplier: 1.0, constant: 12.0),
            NSLayoutConstraint(item: label, attribute: .right, relatedBy: .equal,
                               toItem: labelContainerView, attribute: .right, multiplier: 1.0, constant: -12.0),
            NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal,
                               toItem: labelContainerView, attribute: .centerY, multiplier: 1.0, constant: 0.0),
        ])
        
        
        if isShowing {
            show()
        } else {
            hide()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        activityIndicatorView.startAnimating()
        activate()
    }
    
    func hide() {
        activityIndicatorView.stopAnimating()
        deactivate()
    }
}
