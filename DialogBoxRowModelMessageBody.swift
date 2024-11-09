//
//  DialogBoxRowModelMessageBody.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/20/24.
//

import Foundation

class DialogBoxRowModelMessageBody: DialogBoxRowModel {
    
    let title: String
    @MainActor init(title: String) {
        self.title = title
        super.init(rowModelType: .messageTitle)
    }
    
    override func dispose() {
        super.dispose()
        print("DialogBoxRowModelMessageBody => Dispose")
    }
}
