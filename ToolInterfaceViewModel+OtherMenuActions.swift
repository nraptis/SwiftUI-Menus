//
//  ToolInterfaceViewModel+OtherMenuActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/26/24.
//

import Foundation
import Foundation
import UIKit

extension ToolInterfaceViewModel {
    
    @MainActor func dialogActionSaveJiggle() {
        
        let titleBar = DialogBoxRowModelTitleBar(title: "Save AI Model")
        let messageTitle = DialogBoxRowModelMessageBody(title: "What would you like to name your ai model?")
        
        var documentName: String?
        let buttonLeft = DialogBoxButtonModel(title: "Cancel", type: .generic) { [weak self] in
            self?.dialogActionSaveJiggleCancel()
        }
        
        let buttonRight = DialogBoxButtonModel(title: "Save", type: .navArrowGreenCentered) { [weak self] in
            if SavedFileManager.shared.exists(documentName: documentName) {
                self?.dialogActionSaveReplacePrompt(documentName: documentName)
            } else {
                self?.dialogActionSaveJiggleOkay(documentName: documentName, 
                                                 isOverwriting: false)
            }
        }
        
        let buttonEditThumb = DialogBoxButtonModel(title: "Edit Thumbnail...", type: .editThumb) { [weak self] in
            self?.dialogActionEditThumb()
        }
        
        if let jiggleViewModel = jiggleViewModel {
            if jiggleViewModel.jiggleDocument.isDocumentNameUserDirected {
                documentName = jiggleViewModel.jiggleDocument.documentName
            }
        }
        
        let inputBox = DialogBoxRowModelInputBox(text: documentName, placeholder: "Enter Title...") { text in
            documentName = text
        }
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar, messageTitle, inputBox]
        let buttonRowModels: [DialogBoxRowModel] = [
            DialogBoxRowModelOneButton(button: buttonEditThumb),
            DialogBoxRowModelTwoButtons(buttonLeft: buttonLeft, buttonRight: buttonRight)
        ]
        
        let dialogBox = DialogBoxModel(bodyRowModels: bodyRowModels,
                                       buttonRowModels: buttonRowModels)
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(dialogBox)
        }
        
    }
    
    @MainActor func dialogActionEditThumb() {
        
        let titleBar = DialogBoxRowModelTitleBar(title: "Edit Thumbnail")
        
        var fullSizedImage: UIImage?
        var originalThumbCropFrame = ThumbCropFrame()
        
        if let jiggleViewModel = jiggleViewModel {
            fullSizedImage = jiggleViewModel.jiggleDocument.image
            originalThumbCropFrame = jiggleViewModel.jiggleDocument.thumbCropFrame
        }
        
        var thumbCropFrame = originalThumbCropFrame
        
        let editThumb = DialogBoxRowModelEditThumb(fullSizedImage: fullSizedImage,
                                                   originalThumbCropFrame: originalThumbCropFrame) { newThumbCropFrame in
            thumbCropFrame = newThumbCropFrame
            print("crop frame: \(thumbCropFrame.x) \(thumbCropFrame.y) \(thumbCropFrame.width) \(thumbCropFrame.height)")
        }
        
        let buttonLeft = DialogBoxButtonModel(title: "Cancel", type: .generic) { [weak self] in
            self?.dialogActionCropThumbCancel()
        }
        
        let buttonRight = DialogBoxButtonModel(title: "Crop Like This Right Here, As Seen Above", type: .navArrowGreenCentered) { [weak self] in
            self?.dialogActionCropThumb(image: fullSizedImage,
                                        thumbCropFrame: thumbCropFrame)
        }
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar, 
                                                  DialogBoxRowModelEmptySpace(height: 8),
                                                  editThumb,
                                                  DialogBoxRowModelEmptySpace(height: 14)]
        let buttonRowModels: [DialogBoxRowModel] = [DialogBoxRowModelTwoButtons(buttonLeft: buttonLeft, buttonRight: buttonRight)]
        
        let dialogBox = DialogBoxModel(bodyRowModels: bodyRowModels,
                                       buttonRowModels: buttonRowModels)
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(dialogBox)
        }
    }
    
    @MainActor func dialogActionSaveReplacePrompt(documentName: String?) {
        let titleBar = DialogBoxRowModelTitleBar(title: "Replace AI Model")
        
        let messageTitle = DialogBoxRowModelMessageBody(title: "Are tou air you wann osve write this?")
        
        let buttonLeft = DialogBoxButtonModel(title: "Cancel", type: .generic) {
            if let rootViewController = ApplicationController.rootViewController {
                rootViewController.popDialogBox()
            }
        }
        
        let buttonRight = DialogBoxButtonModel(title: "Repla", type: .navArrowGreenCentered) { [weak self] in
            self?.dialogActionSaveJiggleOkay(documentName: documentName,
                                             isOverwriting: true)
        }
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar, messageTitle]
        let buttonRowModels: [DialogBoxRowModel] = [DialogBoxRowModelTwoButtons(buttonLeft: buttonLeft, buttonRight: buttonRight)]
        
        let dialogBox = DialogBoxModel(bodyRowModels: bodyRowModels,
                                       buttonRowModels: buttonRowModels)
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(dialogBox)
        }
    }
    
    @MainActor func dialogActionSaveJiggleOkay(documentName: String?,
                                    isOverwriting: Bool) {
        print("[IMB] Action - toolActionSaveJiggleOkay")
        if let jiggleViewModel = jiggleViewModel {
            if !SavedFileManager.shared.save(jiggleDocument: jiggleViewModel.jiggleDocument,
                                             documentName: documentName,
                                             isOverwriting: isOverwriting) {
                if let rootViewController = ApplicationController.rootViewController {
                    rootViewController.popDialogBox { _ in
                        
                        self.dialogActionSimpleMessageBox(title: "Couldn't Save",
                                                          message: "There was an error saving that...")
                    }
                }
            } else {
                if let rootViewController = ApplicationController.rootViewController {
                    rootViewController.popDialogBox { _ in
                        self.dialogActionSimpleMessageBox(title: "You Did Saved",
                                                          message: "This was a screamin sduccess...")
                    }
                }
            }
        }
    }
    
    @MainActor func dialogActionSaveJiggleCancel() {
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.popDialogBox()
        }
    }
    
    @MainActor func dialogActionCropThumb(image: UIImage?, thumbCropFrame: ThumbCropFrame) {
        
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.jiggleDocument.thumbCropFrame = thumbCropFrame
            print("SetThumbCropFrame => x: \(thumbCropFrame.x)")
            print("SetThumbCropFrame => y: \(thumbCropFrame.y)")
            print("SetThumbCropFrame => width: \(thumbCropFrame.width)")
            print("SetThumbCropFrame => height: \(thumbCropFrame.height)")
        }
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.popDialogBox()
        }
    }
    
    @MainActor func dialogActionCropThumbCancel() {
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.popDialogBox()
        }
    }
    
    @MainActor func dialogActionSimpleMessageBox(title: String, message: String) {
        
        let titleBar = DialogBoxRowModelTitleBar(title: "Replace AI Model")
        
        let messageTitle = DialogBoxRowModelMessageBody(title: "Are tou air you wann osve write this?")
        
        let button = DialogBoxButtonModel(title: "Okay", type: .generic) {
            if let rootViewController = ApplicationController.rootViewController {
                rootViewController.popDialogBox()
            }
        }
        
        let bodyRowModels: [DialogBoxRowModel] = [DialogBoxRowModelEmptySpace(height: 8),
                                                  titleBar,
                                                  DialogBoxRowModelEmptySpace(height: 8),
                                                  messageTitle,
                                                  DialogBoxRowModelEmptySpace(height: 8)]
        let buttonRowModels: [DialogBoxRowModel] = [DialogBoxRowModelOneButton(button: button)]
        
        let dialogBox = DialogBoxModel(bodyRowModels: bodyRowModels,
                                       buttonRowModels: buttonRowModels)
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.pushDialogBox(dialogBox)
        }
    }
    
}
