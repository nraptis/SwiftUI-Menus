//
//  SavedFile.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/25/24.
//

import UIKit

class SavedFile {
    
    var isDemo = false
    var isWebScene = false
    
    var documentName = ""
    
    var relativeSceneFilePath = ""
    var relativeThumbImagePath = ""
    var relativeFullSizedImagePath = ""
    
    var thumbWidth = 0
    var thumbHeight = 0
    
    var imageWidth = 0
    var imageHeight = 0
    
    var fileIndex = 0
    var demoIndex = 0

    func save(fileBuffer: FileBuffer) {
        fileBuffer.writeBool(isDemo)
        fileBuffer.writeBool(isWebScene)
        
        fileBuffer.writeString(documentName)
        fileBuffer.writeString(relativeSceneFilePath)
        fileBuffer.writeString(relativeFullSizedImagePath)
        fileBuffer.writeString(relativeThumbImagePath)
        
        fileBuffer.writeInt32(Int32(thumbWidth))
        fileBuffer.writeInt32(Int32(thumbHeight))
        fileBuffer.writeInt32(Int32(imageWidth))
        fileBuffer.writeInt32(Int32(imageHeight))
        
        fileBuffer.writeInt32(Int32(fileIndex))
        
        fileBuffer.writeInt32(Int32(demoIndex))
    }
    
    func load(fileBuffer: FileBuffer) -> Bool {
        
        if let _isDemo = fileBuffer.readBool() {
            isDemo = _isDemo
        } else {
            return false
        }
        
        if let _isWebScene = fileBuffer.readBool() {
            isWebScene = _isWebScene
        } else {
            return false
        }
        
        if let _documentName = fileBuffer.readString() {
            documentName = _documentName
        } else {
            return false
        }
        
        if let _relativeSceneFilePath = fileBuffer.readString() {
            relativeSceneFilePath = _relativeSceneFilePath
        } else {
            return false
        }
        
        if let _relativeFullSizedImagePath = fileBuffer.readString() {
            relativeFullSizedImagePath = _relativeFullSizedImagePath
        } else {
            return false
        }
        
        if let _relativeThumbImagePath = fileBuffer.readString() {
            relativeThumbImagePath = _relativeThumbImagePath
        } else {
            return false
        }
        
        if let _thumbWidth = fileBuffer.readInt32() {
            thumbWidth = Int(_thumbWidth)
        } else {
            return false
        }
        
        if let _thumbHeight = fileBuffer.readInt32() {
            thumbHeight = Int(_thumbHeight)
        } else {
            return false
        }
        
        if let _imageWidth = fileBuffer.readInt32() {
            imageWidth = Int(_imageWidth)
        } else {
            return false
        }
        
        if let _imageHeight = fileBuffer.readInt32() {
            imageHeight = Int(_imageHeight)
        } else {
            return false
        }
        
        if let _fileIndex = fileBuffer.readInt32() {
            fileIndex = Int(_fileIndex)
        } else {
            return false
        }
        
        if let _demoIndex = fileBuffer.readInt32() {
            demoIndex = Int(_demoIndex)
        } else {
            return false
        }
        
        return true
    }
}
