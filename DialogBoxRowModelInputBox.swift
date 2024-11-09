//
//  DialogBoxRowInputBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/20/24.
//

import Foundation

class DialogBoxRowModelInputBox: DialogBoxRowModel {
    
    let text: String?
    let placeholder: String
    var action: ((String?) -> Void)?
    @MainActor init(text: String?, placeholder: String, action: @escaping ((String?) -> Void)) {
        self.text = text
        self.placeholder = placeholder
        self.action = action
        super.init(rowModelType: .inputBox)
    }
    
    override func dispose() {
        self.action = nil
        super.dispose()
        print("DialogBoxRowModelTitleBar => Dispose")
    }
}
