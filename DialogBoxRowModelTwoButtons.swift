//
//  DialogBoxRowModelTwoButtons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/20/24.
//

import Foundation

class DialogBoxRowModelTwoButtons: DialogBoxRowModel {
    
    let buttonLeft: DialogBoxButtonModel
    let buttonRight: DialogBoxButtonModel
    
    init(buttonLeft: DialogBoxButtonModel, buttonRight: DialogBoxButtonModel) {
        self.buttonLeft = buttonLeft
        self.buttonRight = buttonRight
        super.init(rowModelType: .twoButtons)
    }
    
    override func dispose() {
        buttonLeft.dispose()
        buttonRight.dispose()
        super.dispose()
        print("DialogBoxRowModelTwoButtons => Dispose")
    }
    
    deinit {
        print("~DialogBoxRowModelTwoButtons")
    }
    
}
