//
//  DialogBoxButtonModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation
import UIKit

enum DialogBoxButtonType: UInt8 {
    case navArrowGreenCentered
    case generic
    case editThumb
    case confirm
    case cancel
}

enum DialogBoxButtonDepressedBehavior: UInt8 {
    case blurReveal
    case darkenText
}

class DialogBoxButtonModel {
    
    var title: String
    var type: DialogBoxButtonType
    var action: (() -> Void)?
    var font: UIFont = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    var depressedBehavior: DialogBoxButtonDepressedBehavior = .blurReveal
    weak var dialogBoxModel: DialogBoxModel?
    
    init(title: String, type: DialogBoxButtonType, action: @escaping (() -> Void)) {
        self.title = title
        self.type = type
        self.action = action
    }
    
    @MainActor func manufactureButton() -> DialogBoxButtonViewController {
        switch type {
        case .navArrowGreenCentered:
            return DialogBoxButtonViewController(model: self,
                                                 nibName: "DialogBoxButtonViewController_ArrowRightCentered_Green")
        case .generic:
            return DialogBoxButtonViewController(model: self,
                                                 nibName: "DialogBoxButtonViewController_Generic")
        case .editThumb:
            return DialogBoxButtonViewController(model: self,
                                                 nibName: "DialogBoxButtonViewController_EditThumb")
        case .confirm:
            return DialogBoxButtonViewController(model: self,
                                                 nibName: "DialogBoxButtonViewController_Confirm")
        case .cancel:
            return DialogBoxButtonViewController(model: self,
                                                 nibName: "DialogBoxButtonViewController_Cancel")
        }
    }
    
    func dispose() {
        action = nil
    }
}
