//
//  SceneDelegate.swift
//  Jiggle III
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        let orientation = Orientation(interfaceOrientation: windowScene.interfaceOrientation)
        
        let _rootViewModel = RootViewModel(orientation: orientation,
                                           window: window,
                                           windowScene: windowScene)
        ApplicationController.rootViewModel = _rootViewModel
        ApplicationController.rootViewController = RootViewController(rootViewModel: _rootViewModel)
        
        window.rootViewController = ApplicationController.rootViewController
        window.makeKeyAndVisible()
        
        _ = SavedFileManager.shared.load()
        
        DispatchQueue.main.async {
            
            //ApplicationController.rootViewModel.pushToMainMenu(animated: false, reversed: false)
            
            
            if self.attemptPushRecent() == false {
                if let rootViewModel = ApplicationController.rootViewModel {
                    rootViewModel.pushToLoadScene(animated: false, reversed: false)
                }
            }
            
        }
    }
    
    func attemptPushRecent() -> Bool {
        let fullSizedImagePath = SavedFileManager.shared.recentDocumentFullSizedImageFilePath
        let sceneFilePath = SavedFileManager.shared.recentDocumentSceneFilePath
        
        guard let fullSizedImage = FileUtils.shared.loadImage(fullSizedImagePath) else {
            return false
        }
        
        guard fullSizedImage.size.width > 8.0 && fullSizedImage.size.height > 8.0 else {
            return false
        }
        
        let fileBuffer = FileBuffer()
        fileBuffer.load(filePath: sceneFilePath)
        
        guard let _documentWidth = fileBuffer.readInt16() else {
            return false
        }
        
        guard let _documentHeight = fileBuffer.readInt16() else {
            return false
        }
        
        guard _documentWidth >= 32 && _documentWidth < 10_000 && _documentHeight >= 32 && _documentHeight < 10_000 else {
            return false
        }
        
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
        
        if let rootViewModel = ApplicationController.rootViewModel {
            rootViewModel.pushToJiggle(jiggleDocument: jiggleDocument,
                                                              animated: false,
                                                              reversed: false)
        }
        
        return true
    }
    
}

