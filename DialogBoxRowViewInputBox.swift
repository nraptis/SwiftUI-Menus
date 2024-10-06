//
//  DialogBoxRowViewInputBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class DialogBoxRowViewInputBox: UIView {
    
    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    static var paddingLeft: CGFloat {
        return 12.0
    }
    
    static var paddingRight: CGFloat {
        return 12.0
    }
    
    static var paddingTop: CGFloat {
        return 6.0
    }
    
    static var paddingBottom: CGFloat {
        return 12.0
    }
    
    static var font: UIFont {
        if Device.isPad {
            return UIFont.systemFont(ofSize: 20.0, weight: .semibold)
        } else {
            return UIFont.systemFont(ofSize: 16.0, weight: .semibold)
        }
    }
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var textFieldContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.layer.cornerRadius = 8.0
        result.clipsToBounds = true
        result.backgroundColor = DialogTheme.dialogTextField
        result.layer.borderColor = DialogTheme.dialogSeparator.cgColor
        result.layer.borderWidth = 1.0
        return result
    }()
    
    lazy var textField: UITextField = {
        let result = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        let attributedString = NSAttributedString(
            string: model.placeholder,
            attributes:[
                .foregroundColor: DialogTheme.dialogTextPlaceholder,
                .font: Self.font
            ]
        )
        result.attributedPlaceholder = attributedString
        result.font = Self.font
        result.text = model.text
        result.textAlignment = .left
        result.smartDashesType = .no
        result.smartInsertDeleteType = .no
        result.smartQuotesType = .no
        result.spellCheckingType = .no
        result.autocorrectionType = .no
        result.textContentType = UITextContentType(rawValue: "")
        result.inputAccessoryView = nil
        result.tintColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        result.textColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        return result
    }()
    
    let model: DialogBoxRowModelInputBox
    init(model: DialogBoxRowModelInputBox) {
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
        
        containerView.addSubview(textFieldContainerView)
        containerView.addConstraints([
            NSLayoutConstraint(item: textFieldContainerView, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: textFieldContainerView, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: textFieldContainerView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: textFieldContainerView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0)
        ])
        
        
        textFieldContainerView.addSubview(textField)
        textFieldContainerView.addConstraints([
            NSLayoutConstraint(item: textField, attribute: .left, relatedBy: .equal, toItem: textFieldContainerView,
                               attribute: .left, multiplier: 1.0, constant: 8.0),
            NSLayoutConstraint(item: textField, attribute: .right, relatedBy: .equal, toItem: textFieldContainerView,
                               attribute: .right, multiplier: 1.0, constant: -8.0),
            NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: textFieldContainerView,
                               attribute: .top, multiplier: 1.0, constant: 8.0),
            NSLayoutConstraint(item: textField, attribute: .bottom, relatedBy: .equal, toItem: textFieldContainerView,
                               attribute: .bottom, multiplier: 1.0, constant: -8.0)
        ])
        
        textField.addTarget(self, action: #selector(textFieldValueChanged(_:)), for: .editingChanged)
        
        textField.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dispose() {
        model.dispose()
        textField.delegate = nil
        print("DialogBoxRowViewInputBox.dispose()")
    }
    
    @objc func textFieldValueChanged(_ sender: UITextField) {
        let searchText = sender.text ?? ""
        print("Text is: \(searchText)")
        
        model.action?(sender.text)
        
    }
}

extension DialogBoxRowViewInputBox: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        dialogBoxStackContainerView?.setTargetedView(uiView: textFieldContainerView)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        dialogBoxStackContainerView?.setTargetedView(uiView: nil)
    }
    
}
