//
//  RootViewModel.swift
//  Jiggle III
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit
import PhotosUI

final class RootViewModel {
    
    var orientation: Orientation
    let window: UIWindow!
    let windowScene: UIWindowScene!
    @MainActor init(orientation: Orientation,
                    window: UIWindow!,
                    windowScene: UIWindowScene!) {
        self.orientation = orientation
        self.window = window
        self.windowScene = windowScene
        ApplicationController.shared.wake()
    }
    
    @MainActor func pushToImageImport(image: UIImage,
                                      animated: Bool,
                                      reversed: Bool) {
        
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        
        let imageImportViewModel = ImageImportViewModel(originalImage: image, originalOrientation: toOrientation)
        let imageImportViewController = ImageImportViewController(imageImportViewModel: imageImportViewModel)
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.push(viewController: imageImportViewController,
                                                           fromOrientation: fromOrientation,
                                                           toOrientation: toOrientation,
                                                           fixedOrientation: false,
                                                           animated: animated,
                                                           reversed: reversed) {
                
            }
        }
    }
    
    @MainActor func pushToLoadScene(animated: Bool, reversed: Bool) {
        
        let fromOrientation = self.orientation
        let toOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        
        let loadSceneViewModel = LoadSceneViewModel(originalOrientation: toOrientation)
        let loadSceneViewController = LoadSceneViewController(loadSceneViewModel: loadSceneViewModel)
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.push(viewController: loadSceneViewController,
                                                           fromOrientation: fromOrientation,
                                                           toOrientation: toOrientation,
                                                           fixedOrientation: false,
                                                           animated: animated,
                                                           reversed: reversed) {
                
            }
        }
    }
    
    @MainActor func pushToMainMenu(animated: Bool, reversed: Bool) {
        
        let mainMenuViewModel = MainMenuViewModel(rootViewModel: self)
        
        let mainMenuViewController = MainMenuViewController(mainMenuViewModel: mainMenuViewModel)
        
        //mainMenuViewController.load()
        //mainMenuViewController.loadComplete()
        
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = Orientation.portrait
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.push(viewController: mainMenuViewController,
                                                           fromOrientation: fromOrientation,
                                                           toOrientation: toOrientation,
                                                           fixedOrientation: true,
                                                           animated: animated,
                                                           reversed: reversed) {
            }
        }
    }
    
    @MainActor func pushToJiggle(jiggleDocument: JiggleDocument,
                                 animated: Bool,
                                 reversed: Bool) {
        
        /*
        guard let image = UIImage(named: ApplicationController.testTextureName) else {
            print("Unable to load \(ApplicationController.testTextureName)")
            return
        }
        guard image.size.width > 32.0 && image.size.height > 32.0 else {
            print("Invalid dimension \(ApplicationController.testTextureName)")
            return
        }
        */
        
        let jiggleScene = JiggleScene(rootViewModel: self,
                                      jiggleDocument: jiggleDocument)
        let jiggleViewModel = JiggleViewModel(jiggleScene: jiggleScene,
                                              jiggleDocument: jiggleDocument,
                                              rootViewModel: self)
        
        let jiggleContainerViewController = JiggleContainerViewController(jiggleViewModel: jiggleViewModel,
                                                                          jiggleScene: jiggleScene,
                                                                          jiggleDocument: jiggleDocument)
        
        let appWidth: Float
        let appHeight: Float
        switch jiggleDocument.orientation {
        case .landscape:
            appWidth = ApplicationController.widthLandscape
            appHeight = ApplicationController.heightLandscape
        case .portrait:
            appWidth = ApplicationController.widthPortrait
            appHeight = ApplicationController.heightPortrait
        }
        let graphics = jiggleContainerViewController.jiggleViewController.graphics
        jiggleScene.awake(appWidth: appWidth,
                          appHeight: appHeight,
                          graphicsWidth: graphics.width,
                          graphicsHeight: graphics.height)
        jiggleContainerViewController.awake(jiggleViewModel: jiggleViewModel,
                                            jiggleScene: jiggleScene)
        
        let fromOrientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        let toOrientation = jiggleDocument.orientation
        
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.push(viewController: jiggleContainerViewController,
                                                           fromOrientation: fromOrientation,
                                                           toOrientation: toOrientation,
                                                           fixedOrientation: true,
                                                           animated: animated,
                                                           reversed: reversed) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    jiggleViewModel.handleWakeUpComplete_PartA()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        jiggleViewModel.handleWakeUpComplete_PartB()
                    }
                }
            }
        }
    }
    
    
    @MainActor func showImagePicker() {
        var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
        phPickerConfig.preferredAssetRepresentationMode = .current
        phPickerConfig.selectionLimit = 1
        phPickerConfig.filter = PHPickerFilter.any(of: [.images, .screenshots])
        let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
        phPickerVC.delegate = self
        if let rootViewController = ApplicationController.rootViewController {
            rootViewController.present(phPickerVC, animated: true)
        }
    }
    
    @MainActor func clickedSavedFile(_ savedFile: SavedFile?) {
        
        if let rootViewController = ApplicationController.rootViewController {
            guard rootViewController.isPushing == false else {
                return
            }
        } else {
            return
        }
        
        guard let savedFile = savedFile else {
            return
        }
        
        let fullSizedImagePath: String
        if savedFile.isDemo {
            fullSizedImagePath = FileUtils.shared.getMainBundleFilePath(fileName: savedFile.relativeFullSizedImagePath)
        } else {
            fullSizedImagePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeFullSizedImagePath)
        }
        
        let sceneFilePath: String
        if savedFile.isDemo {
            sceneFilePath = FileUtils.shared.getMainBundleFilePath(fileName: savedFile.relativeSceneFilePath)
        } else {
            sceneFilePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeSceneFilePath)
        }
        
        _proceedWithFile(fullSizedImagePath: fullSizedImagePath,
                               sceneFilePath: sceneFilePath)
    }
    
    @MainActor func clickedSavedFile(at index: Int) async {
        
        if let rootViewController = ApplicationController.rootViewController {
            guard rootViewController.isPushing == false else {
                return
            }
        } else {
            return
        }
        
        guard let savedFile = SavedFileManager.shared.getSavedFile(at: index) else {
            if let rootViewController = ApplicationController.rootViewController {
                rootViewController.pushDialogBox(.unknownError)
            }
            return
        }
        
        let fullSizedImagePath: String
        if savedFile.isDemo {
            fullSizedImagePath = FileUtils.shared.getMainBundleFilePath(fileName: savedFile.relativeFullSizedImagePath)
        } else {
            fullSizedImagePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeFullSizedImagePath)
        }
        
        let sceneFilePath: String
        if savedFile.isDemo {
            sceneFilePath = FileUtils.shared.getMainBundleFilePath(fileName: savedFile.relativeSceneFilePath)
        } else {
            sceneFilePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeSceneFilePath)
        }
        
        _proceedWithFile(fullSizedImagePath: fullSizedImagePath,
                               sceneFilePath: sceneFilePath)
    }
    
    @MainActor func clickedRecentFile() {
        if let rootViewController = ApplicationController.rootViewController {
            if rootViewController.isPushing == false {
                let fullSizedImagePath = SavedFileManager.shared.recentDocumentFullSizedImageFilePath
                let sceneFilePath = SavedFileManager.shared.recentDocumentSceneFilePath
                _proceedWithFile(fullSizedImagePath: fullSizedImagePath,
                                 sceneFilePath: sceneFilePath)
            }
        }
    }
    
    @MainActor private func _proceedWithFile(fullSizedImagePath: String, sceneFilePath: String) {
        
        guard let rootViewController = ApplicationController.rootViewController else {
            return
        }
        
        guard let rootViewModel = ApplicationController.rootViewModel else {
            return
        }
        
        guard let fullSizedImage = FileUtils.shared.loadImage(fullSizedImagePath) else {
            rootViewController.pushDialogBox(.couldNotLoadDocument)
            return
        }
        
        guard fullSizedImage.size.width > 8.0 && fullSizedImage.size.height > 8.0 else {
            rootViewController.pushDialogBox(.couldNotLoadImage)
            return
        }
        
        let fileBuffer = FileBuffer()
        fileBuffer.load(filePath: sceneFilePath)
        
        guard let _documentWidth = fileBuffer.readInt16() else {
            rootViewController.pushDialogBox(.couldNotLoadDocument)
            return
        }
        
        guard let _documentHeight = fileBuffer.readInt16() else {
            rootViewController.pushDialogBox(.couldNotLoadDocument)
            return
        }
        
        guard _documentWidth >= 32 && _documentWidth < 10_000 && _documentHeight >= 32 && _documentHeight < 10_000 else {
            rootViewController.pushDialogBox(.couldNotLoadDocument)
            return
        }
        
        print("documentSize: \(_documentWidth)  \(_documentHeight)")
        
        fileBuffer.readReset()
        
        let orientation: Orientation
        if _documentWidth > _documentHeight {
            orientation = .landscape
        } else {
            orientation = .portrait
        }
        
        let jiggleDocument = JiggleDocument(image: fullSizedImage,
                                            orientation: orientation,
                                            documentWidth: Int(_documentWidth),
                                            documentHeight: Int(_documentHeight))
        
        _ = jiggleDocument.load(fileBuffer: fileBuffer)
        
        //await MainActor.run {
        
        rootViewModel.pushToJiggle(jiggleDocument: jiggleDocument,
                                   animated: true,
                                   reversed: false)
        
        //}
    }
    
}

extension RootViewModel: PHPickerViewControllerDelegate {
    
    @MainActor func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        if results.count > 0 {
            let firstResult = results[0]
            let itemProvider = firstResult.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    //DispatchQueue.main.async {
                    
                    if image === nil && error != nil {
                        print("Error: Iamge Imprt")
                        Task { @MainActor in
                            
                            guard let rootViewController = ApplicationController.rootViewController else {
                                return
                            }
                            
                            rootViewController.dismiss(animated: true) {
                                rootViewController.showAlertMessage(title: "error loading",
                                                                    message: "there was an error with the image")
                            }
                        }
                        return
                    } else {
                        
                        if let image = image as? UIImage {
                            Task { @MainActor in
                                
                                guard let rootViewController = ApplicationController.rootViewController else {
                                    return
                                }
                                
                                guard let rootViewModel = ApplicationController.rootViewModel else {
                                    return
                                }
                                
                                
                                if let fixedImage = UIImage.fixedOrientation(for: image) {
                                    print("old image size: \(image.size.width) x \(image.size.height)")
                                    print("new image size: \(fixedImage.size.width) x \(fixedImage.size.height)")
                                    
                                    rootViewController.dismiss(animated: true) {
                                        rootViewModel.pushToImageImport(image: fixedImage,
                                                                        animated: true,
                                                                        reversed: false)
                                        
                                    }
                                } else {
                                    rootViewController.dismiss(animated: true) {
                                        rootViewModel.pushToImageImport(image: image,
                                                                        animated: true,
                                                                        reversed: false)
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if let rootViewController = ApplicationController.rootViewController {
                    rootViewController.dismiss(animated: true) {
                        rootViewController.showAlertMessage(title: "error loading",
                                                            message: "there was an error with the image")
                    }
                }
            }
        } else {
            if let rootViewController = ApplicationController.rootViewController {
                rootViewController.dismiss(animated: true)
            }
        }
    }
}
