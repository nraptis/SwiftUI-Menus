//
//  DialogBoxRowModelEmptySpace.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/20/24.
//

import Foundation

class DialogBoxRowModelEmptySpace: DialogBoxRowModel {
    
    let height: Int
    init(height: Int) {
        self.height = height
        super.init(rowModelType: .emptySpace)
    }
    
    override func dispose() {
        super.dispose()
        print("DialogBoxRowModelEmptySpace => Dispose")
    }
}
