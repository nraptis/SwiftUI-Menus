//
//  DialogBoxRowModelOneButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/21/24.
//

import Foundation

class DialogBoxRowModelOneButton: DialogBoxRowModel {
    
    let button: DialogBoxButtonModel
    
    init(button: DialogBoxButtonModel) {
        self.button = button
        super.init(rowModelType: .oneButton)
    }
    
    override func dispose() {
        button.dispose()
        super.dispose()
        print("DialogBoxRowModelOneButton => Dispose")
    }
}
