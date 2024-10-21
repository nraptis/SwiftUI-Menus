//
//  DialogBoxRowModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation
import UIKit

enum DialogBoxRowModelHeightType {
    case flexible
    case fixed(CGFloat)
}

enum DialogBoxRowModelType {
    
    case emptySpace
    
    case oneButton
    case twoButtons
    
    case messageTitle
    
    case titleBar
    
    case inputBox
    
    case editThumb
    
    case editRings
    
}

class DialogBoxRowModel {
    
    let rowModelType: DialogBoxRowModelType
    init(rowModelType: DialogBoxRowModelType) {
        self.rowModelType = rowModelType
    }
    
    func manufactureView() -> UIView? {
        switch rowModelType {
        case .emptySpace:
            if let model = self as? DialogBoxRowModelEmptySpace {
                return DialogBoxRowViewEmptySpace(model: model)
            }
        case .oneButton:
            if let model = self as? DialogBoxRowModelOneButton {
                return DialogBoxRowViewOneButton(model: model)
            }
        case .twoButtons:
            if let model = self as? DialogBoxRowModelTwoButtons {
                return DialogBoxRowViewTwoButtons(model: model)
            }
        case .messageTitle:
            if let model = self as? DialogBoxRowModelMessageBody {
                return DialogBoxRowViewMessageBody(model: model)
            }
        case .titleBar:
            if let model = self as? DialogBoxRowModelTitleBar {
                return DialogBoxRowViewTitleBar(model: model)
            }
            return nil
        case .inputBox:
            if let model = self as? DialogBoxRowModelInputBox {
                return DialogBoxRowViewInputBox(model: model)
            }
        case .editThumb:
            if let model = self as? DialogBoxRowModelEditThumb {
                return DialogBoxRowViewEditThumb(model: model)
            }
        case .editRings:
            if let model = self as? DialogBoxRowModelEditRings {
                return DialogBoxRowViewEditRings(model: model)
            }
        }
        return nil
    }
    
    func dispose() {
        
    }
    
}
