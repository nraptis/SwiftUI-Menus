//
//  DialogBoxRowModelTitleBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/20/24.
//

import Foundation

class DialogBoxRowModelTitleBar: DialogBoxRowModel {
    
    let title: String
    @MainActor init(title: String) {
        self.title = title
        super.init(rowModelType: .titleBar)
    }
    
    override func dispose() {
        super.dispose()
        print("DialogBoxRowModelTitleBar => Dispose")
    }
}
