//
//  DialogBoxRowModelEditThumb.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/26/24.
//

import UIKit

class DialogBoxRowModelEditThumb: DialogBoxRowModel {
    
    let fullSizedImage: UIImage?
    let originalThumbCropFrame: ThumbCropFrame
    var action: ((ThumbCropFrame) -> Void)?
    @MainActor init(fullSizedImage: UIImage?,
         originalThumbCropFrame: ThumbCropFrame,
         action: @escaping ((ThumbCropFrame) -> Void)) {
        self.fullSizedImage = fullSizedImage
        self.originalThumbCropFrame = originalThumbCropFrame
        self.action = action
        super.init(rowModelType: .editThumb)
    }
    
    override func dispose() {
        self.action = nil
        super.dispose()
        print("DialogBoxRowModelEditThumb => Dispose")
    }
}
