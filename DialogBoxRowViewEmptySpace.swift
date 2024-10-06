//
//  DialogBoxRowViewEmptySpace.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class DialogBoxRowViewEmptySpace: UIView {

    weak var dialogBoxStackContainerView: DialogBoxStackContainerView?
    
    let model: DialogBoxRowModelEmptySpace
    init(model: DialogBoxRowModelEmptySpace) {
        self.model = model
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        addConstraint(
            NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(model.height))
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dispose() {
        model.dispose()
        print("DialogBoxRowViewEmptySpace.dispose()")
    }
}
