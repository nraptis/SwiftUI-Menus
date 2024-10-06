//
//  DialogBoxModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/19/24.
//

import Foundation

class DialogBoxModel {
    
    let bodyRowModels: [DialogBoxRowModel]
    let buttonRowModels: [DialogBoxRowModel]
    
    init(bodyRowModels: [DialogBoxRowModel], buttonRowModels: [DialogBoxRowModel]) {
        self.bodyRowModels = bodyRowModels
        self.buttonRowModels = buttonRowModels
    }
    
    static func getDialogOkay(title: String, message: String) -> DialogBoxModel {
        let topSpace = DialogBoxRowModelEmptySpace(height: 12)
        let titleBar = DialogBoxRowModelTitleBar(title: title)
        let middleSpace = DialogBoxRowModelEmptySpace(height: 4)
        let messageBody = DialogBoxRowModelMessageBody(title: message)
        let bottomSpace = DialogBoxRowModelEmptySpace(height: 18)
        
        let textOkay = GeneralStringLibrary.generalTextOkay()
        let buttonOkay = DialogBoxButtonModel(title: textOkay, type: .generic) {
            ApplicationController.rootViewController.popDialogBox()
        }
        let buttonModelOkay = DialogBoxRowModelOneButton(button: buttonOkay)
        
        let bodyRowModels: [DialogBoxRowModel] = [topSpace, titleBar, middleSpace, messageBody, bottomSpace]
        let buttonRowModels: [DialogBoxRowModel] = [buttonModelOkay]
        return DialogBoxModel(bodyRowModels: bodyRowModels, buttonRowModels: buttonRowModels)
    }
    
    static func generatedLessGuides(numberOfRingsGenerated: Int,
                                         numberOfRingsRequested: Int) -> DialogBoxModel {
        let message = GeneralStringLibrary.generalTextCouldOnlyGenerateMessage(numberOfRingsGenerated: numberOfRingsGenerated, 
                                                                               numberOfRingsRequested: numberOfRingsRequested)
        return getDialogOkay(title: GeneralStringLibrary.generalTextPartialSuccess(),
                      message: message)
    }
    
    static var generatedNoGuides: DialogBoxModel {
        getDialogOkay(title: GeneralStringLibrary.generalTextError(),
                      message: GeneralStringLibrary.generalTextCouldNotGenerate())
    }
    
    static var unknownError: DialogBoxModel {
        getDialogOkay(title: GeneralStringLibrary.generalTextError(),
                      message: GeneralStringLibrary.generalTextAnUnknownErrorHasOccurred())
    }
    
    static var couldNotLoadImage: DialogBoxModel {
        getDialogOkay(title: GeneralStringLibrary.generalTextError(),
                      message: GeneralStringLibrary.generalTextCouldNotLoadImage())
    }
    
    static var couldNotLoadDocument: DialogBoxModel {
        getDialogOkay(title: GeneralStringLibrary.generalTextError(),
                      message: GeneralStringLibrary.generalTextCouldNotLoadDocument())
    }
    
    static var couldNotCopyFileLowMemory: DialogBoxModel {
        getDialogOkay(title: GeneralStringLibrary.generalTextWarning(),
                      message: GeneralStringLibrary.generalCouldNotCopyFileLowMemory())
    }
    
    static var noJiggleSelected: DialogBoxModel {
        getDialogOkay(title: GeneralStringLibrary.generalTextNoJiggleSelected(),
                      message: GeneralStringLibrary.generalTextYouMustSelectAJiggleToPerformThisAction())
    }
    
    static var editRings: DialogBoxModel {
        let titleBar = DialogBoxRowModelTitleBar(title: GeneralStringLibrary.generalTextEditGuides())
        let editRings = DialogBoxRowModelEditRings()
        
        let textGenerate = GeneralStringLibrary.generalTextGenerate()
        let buttonGenerate = DialogBoxButtonModel(title: textGenerate, type: .confirm) {
            editRings.generate()
        }
        
        let textCancel = GeneralStringLibrary.generalTextCancel()
        let buttonCancel = DialogBoxButtonModel(title: textCancel, type: .cancel) {
            ApplicationController.rootViewController.popDialogBox()
        }
        let buttonModelTwoButtons = DialogBoxRowModelTwoButtons(buttonLeft: buttonCancel,
                                                                buttonRight: buttonGenerate)
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar, editRings]
        let buttonRowModels: [DialogBoxRowModel] = [buttonModelTwoButtons]
        return DialogBoxModel(bodyRowModels: bodyRowModels, buttonRowModels: buttonRowModels)
    }
    
    static var saveJiggle: DialogBoxModel {
        
        let titleBar = DialogBoxRowModelTitleBar(title: "Save AI Model")
        let topSpace = DialogBoxRowModelEmptySpace(height: 24)
        let messageTitle = DialogBoxRowModelMessageBody(title: "What would you like to name your AI Model?")
        
        let inputBox = DialogBoxRowModelInputBox(text: nil, placeholder: "Enter Name...") { text in
            if let text = text, text.count > 0 {
                
            } else {
                
            }
        }
        
        let buttonLeft = DialogBoxButtonModel(title: "Cancel", type: .generic) {
            
        }
        
        let buttonRight = DialogBoxButtonModel(title: "Save", type: .navArrowGreenCentered) {
            
        }
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar, topSpace, messageTitle, inputBox]
        let buttonRowModels: [DialogBoxRowModel] = [DialogBoxRowModelTwoButtons(buttonLeft: buttonLeft, buttonRight: buttonRight)]
        
        return DialogBoxModel(bodyRowModels: bodyRowModels,
                              buttonRowModels: buttonRowModels)
        
    }
    
    static var junkTest: DialogBoxModel {
        
        let titleBar1 = DialogBoxRowModelTitleBar(title: "This One Has Longer Title, Which Is Longer Title, Which is Longer")
        let titleBar2 = DialogBoxRowModelTitleBar(title: "This one a little title")
        
        let topSpace = DialogBoxRowModelEmptySpace(height: 24)
        let messageTitle = DialogBoxRowModelMessageBody(title: "What would you like to name your jiggle?")
        
        
        let button1 = DialogBoxButtonModel(title: "Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1 Anything 1", type: .generic) {
            
        }
        
        let button2 = DialogBoxButtonModel(title: "Anything 2 Anything 2 Anything 2", type: .editThumb) {
            
        }
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar1, topSpace, messageTitle]
        let buttonRowModels: [DialogBoxRowModel] = [DialogBoxRowModelOneButton(button: button1),
                                                    DialogBoxRowModelOneButton(button: button2)]
        
        return DialogBoxModel(bodyRowModels: bodyRowModels,
                              buttonRowModels: buttonRowModels)
        
    }
    
    static var junkTestAllTitles: DialogBoxModel {
        
        let titleBar1 = DialogBoxRowModelTitleBar(title: "Title Bar One")
        let titleBar2 = DialogBoxRowModelTitleBar(title: "Title Two")
        let titleBar3 = DialogBoxRowModelTitleBar(title: "Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three")
        
        let titleBar4 = DialogBoxRowModelTitleBar(title: "Fake Button One")
        let titleBar5 = DialogBoxRowModelTitleBar(title: "Fake Button Two")

        let bodyRowModels: [DialogBoxRowModel] = [titleBar1, titleBar2, titleBar3]
        let buttonRowModels: [DialogBoxRowModel] = [titleBar4, titleBar5]
        
        return DialogBoxModel(bodyRowModels: bodyRowModels,
                              buttonRowModels: buttonRowModels)
        
    }
    
    static var junkTestTiddoes: DialogBoxModel {
        
        let titleBar1 = DialogBoxRowModelTitleBar(title: "Title Bar One")
        let titleBar2 = DialogBoxRowModelTitleBar(title: "Title Two")
        let titleBar3 = DialogBoxRowModelTitleBar(title: "Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three Title Three")
        
        let titleBar4 = DialogBoxRowModelTitleBar(title: "Fake Button One")
        let titleBar5 = DialogBoxRowModelTitleBar(title: "Fake Button Two")
        let titleBar6 = DialogBoxRowModelTitleBar(title: "let titleBar5 = DialogBoxRowModelTitleBar(title: \"Fake Button Two\") ")
        let titleBar7 = DialogBoxRowModelTitleBar(title: "let titleBar234235235 = DialogBoxRowModelTitleBar(title: \"Fake Button Two\") ")
        
        
        let bodyRowModels: [DialogBoxRowModel] = [titleBar1, titleBar2, titleBar3]
        let buttonRowModels: [DialogBoxRowModel] = [titleBar4, titleBar5, titleBar6, titleBar7]
        
        return DialogBoxModel(bodyRowModels: bodyRowModels,
                              buttonRowModels: buttonRowModels)
        
    }
    
}
