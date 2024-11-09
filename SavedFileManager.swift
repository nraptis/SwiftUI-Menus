//
//  SavedFileManager.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/25/24.
//

import Foundation

final class SavedFileManager {
    
    //private(set)
    static let recentDocumentFullSizedImageFileName = "_recent_document_image_full.png"
    //private(set)
    static let recentDocumentSceneFileName = "_recent_document_scene.jscn"
    
    lazy var recentDocumentFullSizedImageFilePath: String = {
        FileUtils.shared.getDocumentPath(fileName: Self.recentDocumentFullSizedImageFileName)
    }()
    
    lazy var recentDocumentSceneFilePath: String = {
        FileUtils.shared.getDocumentPath(fileName: Self.recentDocumentSceneFileName)
    }()
    
    let placeholderSavedFile = SavedFile()
    
    private init() {
        placeholderSavedFile.documentName = "Place Holder"
    }
    
    nonisolated(unsafe) static let shared = SavedFileManager()
    
    private(set) var savedFiles = [SavedFile]()
    
    func injectDemoIfNotExist(name: String, index: Int) {
        
        for savedFile in savedFiles {
            if savedFile.demoIndex == index {
                print("demo @ \(index) already exists!")
                return
            }
        }
        
        //demoIndex
        //SavedFile()
        
        let fileNameThumb = name + "_thumb.png"
        let fileNameFull = name + "_full.jpg"
        let fileNameScene = name + "_scene.jscn"
        
        let filePathThumb = FileUtils.shared.getMainBundleFilePath(fileName: fileNameThumb)
        let filePathFull = FileUtils.shared.getMainBundleFilePath(fileName: fileNameFull)
        let filePathScene = FileUtils.shared.getMainBundleFilePath(fileName: fileNameScene)

        let fileBuffer = FileBuffer()
        fileBuffer.load(filePath: filePathScene)
        
        _ = fileBuffer.readInt16()
        _ = fileBuffer.readInt16()
        
        guard let documentName = fileBuffer.readString() else {
            print("No document name found!")
            return
        }
        
        guard let imageFull = FileUtils.shared.loadImage(filePathFull) else {
            print("couldnt find image: \(fileNameFull)")
            return
        }
        
        guard let imageThumb = FileUtils.shared.loadImage(filePathThumb) else {
            print("couldnt find image: \(fileNameThumb)")
            return
        }
        
        guard imageFull.size.width > 8.0 && imageFull.size.height > 8.0 else {
            return
        }
        
        guard imageThumb.size.width > 8.0 && imageThumb.size.height > 8.0 else {
            return
        }
        
        
        
        let savedFile = SavedFile()
        savedFile.isDemo = true
        savedFile.documentName = documentName
        savedFile.relativeThumbImagePath = fileNameThumb
        savedFile.relativeFullSizedImagePath = fileNameFull
        savedFile.relativeSceneFilePath = fileNameScene
        savedFile.imageWidth = Int(imageFull.size.width + 0.5)
        savedFile.imageHeight = Int(imageFull.size.height + 0.5)
        savedFile.thumbWidth = Int(imageThumb.size.width + 0.5)
        savedFile.thumbHeight = Int(imageThumb.size.height + 0.5)
        savedFile.demoIndex = index
        savedFiles.append(savedFile)
        
        /*
        print("Added Demo: savedFile.documentName = \(savedFile.documentName)")
        print("Added Demo: savedFile.relativeThumbImagePath = \(savedFile.relativeThumbImagePath)")
        print("Added Demo: savedFile.relativeFullSizedImagePath = \(savedFile.relativeFullSizedImagePath)")
        print("Added Demo: savedFile.relativeSceneFilePath = \(savedFile.relativeSceneFilePath)")
        print("Added Demo: savedFile.imageWidth = \(savedFile.imageWidth)")
        print("Added Demo: savedFile.imageHeight = \(savedFile.imageHeight)")
        print("Added Demo: savedFile.thumbWidth = \(savedFile.thumbWidth)")
        print("Added Demo: savedFile.thumbHeight = \(savedFile.thumbHeight)")
        */
    }
    
    func exists(documentName: String?) -> Bool {
        if let documentName = documentName {
            if documentName.count > 0 {
                for savedFile in savedFiles {
                    if savedFile.documentName.lowercased() == documentName.lowercased() {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    @MainActor func save(jiggleDocument: JiggleDocument,
              documentName: String?,
              isOverwriting: Bool) -> Bool {
        
        guard let fullSizedImage = jiggleDocument.getFullSizedImage() else {
            print("Save Jiggle - No Full Sized Image...")
            return false
        }
        
        guard let thumbImage = jiggleDocument.getThumb() else {
            print("Save Jiggle - No Thumb Image...")
            return false
        }
        
        guard let fullSizedImageData = fullSizedImage.pngData() else {
            print("Save Jiggle - No Full Sized Image PNG Data...")
            return false
        }
        
        guard let thumbImageData = thumbImage.pngData() else {
            print("Save Jiggle - No Thumb Image PNG Data...")
            return false
        }
        
        let documentName = generateDocumentName(documentName: documentName)
        
        let savedFile: SavedFile
        if let existingSavedFile = getSavedFile(documentName: documentName) {
            savedFile = existingSavedFile
        } else {
            savedFile = SavedFile()
            savedFile.isDemo = false
            savedFile.isWebScene = jiggleDocument.isWebScene
            savedFile.fileIndex = generateFileIndex()
        }
        
        jiggleDocument.documentName = documentName
        
        savedFile.documentName = documentName
        savedFile.relativeSceneFilePath = generateSceneFileName(fileIndex: savedFile.fileIndex)
        savedFile.relativeFullSizedImagePath = generateFullSizedImageFileName(fileIndex: savedFile.fileIndex)
        savedFile.relativeThumbImagePath = generateThumbImageFileName(fileIndex: savedFile.fileIndex)
        
        savedFile.thumbWidth = Int(thumbImage.size.width + 0.5)
        savedFile.thumbHeight = Int(thumbImage.size.height + 0.5)
        
        savedFile.imageWidth = Int(fullSizedImage.size.width + 0.5)
        savedFile.imageHeight = Int(fullSizedImage.size.height + 0.5)
        
        print("SAVED FILE: title: \(savedFile.documentName)")
        print("SAVED FILE: relativeSceneFilePath: \(savedFile.relativeSceneFilePath)")
        print("SAVED FILE: relativeFullSizedImagePath: \(savedFile.relativeFullSizedImagePath)")
        print("SAVED FILE: relativeThumbImagePath: \(savedFile.relativeThumbImagePath)")
        print("SAVED FILE: thumbWidth: \(savedFile.thumbWidth)")
        print("SAVED FILE: thumbHeight: \(savedFile.thumbHeight)")
        print("SAVED FILE: imageWidth: \(savedFile.imageWidth)")
        print("SAVED FILE: imageHeight: \(savedFile.imageHeight)")
        
        let sceneFilePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeSceneFilePath)
        let fullSizedImagePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeFullSizedImagePath)
        let thumbImagePath = FileUtils.shared.getSavedJigglesFilePath(fileName: savedFile.relativeThumbImagePath)
        
        remove(savedFile: savedFile)
        
        let fileBuffer = FileBuffer()
        jiggleDocument.save(fileBuffer: fileBuffer)
        if !fileBuffer.save(filePath: sceneFilePath) {
            print("SAVE FILE, FAILED! Saving scene file to \(sceneFilePath)")
            return false
        }
        
        if !FileUtils.shared.save(data: fullSizedImageData, filePath: fullSizedImagePath) {
            print("SAVE FILE, FAILED! Saving full sized image file to \(fullSizedImagePath)")
            return false
        }
        
        if !FileUtils.shared.save(data: thumbImageData, filePath: thumbImagePath) {
            print("SAVE FILE, FAILED! Saving thumb image file to \(thumbImagePath)")
            return false
        }
        
        savedFiles.insert(savedFile, at: 0)
        
        save()
        saveBackup()
        
        return true
    }
    
    private func remove(savedFile: SavedFile) {
        var reloop = true
        while reloop {
            reloop = false
            var removeIndex = -1
            for index in 0..<savedFiles.count {
                if savedFiles[index] === savedFile {
                    removeIndex = index
                    break
                }
            }
            if removeIndex != -1 {
                savedFiles.remove(at: removeIndex)
                reloop = true
            }
        }
    }
    
    private func getSavedFile(documentName: String) -> SavedFile? {
        let documentName = documentName.lowercased()
        for savedFile in savedFiles {
            if savedFile.documentName.lowercased() == documentName {
                return savedFile
            }
        }
        return nil
    }
    
    private func getSavedFile(fileIndex: Int) -> SavedFile? {
        for savedFile in savedFiles {
            if savedFile.fileIndex == fileIndex {
                return savedFile
            }
        }
        return nil
    }
    
    private func getFileIndex(title: String) -> Int? {
        let title = title.lowercased()
        for savedFile in savedFiles {
            if savedFile.documentName.lowercased() == title {
                return savedFile.fileIndex
            }
        }
        return nil
    }
    
    private func generateFileIndex() -> Int {
        
        var maxIndex = 0
        for savedFile in savedFiles {
            if savedFile.fileIndex > maxIndex {
                maxIndex = savedFile.fileIndex
            }
        }
        return maxIndex + 1
    }
    
    private func generateDocumentName(documentName: String?) -> String {
        
        if let documentName = documentName, documentName.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 {
            return documentName
        } else {
            var existingTitles = Set<String>()
            for savedFile in savedFiles {
                existingTitles.insert(savedFile.documentName)
            }
            
            var tryIndex = 1
            while true {
                var tryTitle = "Saved Jiggle "
                tryTitle += String.fileNumberString(number: tryIndex, leadingZeroes: 3)
                if existingTitles.contains(tryTitle) == false {
                    return tryTitle
                }
                tryIndex += 1
            }
        }
    }
    
    private func generateFullSizedImageFileName(fileIndex: Int) -> String {
        var result = "saved_image_"
        result += String.fileNumberString(number: fileIndex, leadingZeroes: 6)
        result += "_full.png"
        return result
    }
    
    private func generateThumbImageFileName(fileIndex: Int) -> String {
        var result = "saved_image_"
        result += String.fileNumberString(number: fileIndex, leadingZeroes: 6)
        result += "_thumb.png"
        return result
    }
    
    private func generateSceneFileName(fileIndex: Int) -> String {
        var result = "saved_scene_"
        result += String.fileNumberString(number: fileIndex, leadingZeroes: 6)
        result += "_scene"
        result += ".jscn"
        return result
    }
    
    private var filePath: String {
        FileUtils.shared.getDocumentPath(fileName: "saved.dat")
    }
    
    private var filePathBackup: String {
        FileUtils.shared.getDocumentPath(fileName: "saved_backup.dat")
    }
    
    func save() {
        let fileBuffer = FileBuffer()
        save(fileBuffer: fileBuffer)
        _ = fileBuffer.save(filePath: filePath)
    }
    
    func saveBackup() {
        let fileBuffer = FileBuffer()
        save(fileBuffer: fileBuffer)
        _ = fileBuffer.save(filePath: filePathBackup)
    }
    
    func load() -> Bool {
        let fileBuffer = FileBuffer()
        fileBuffer.load(filePath: filePath)
        if load(fileBuffer: fileBuffer) {
            saveBackup()
            return true
        }
        fileBuffer.load(filePath: filePathBackup)
        if load(fileBuffer: fileBuffer) {
            saveBackup()
            return true
        }
        return false
    }
    
    func load(fileBuffer: FileBuffer) -> Bool {
        savedFiles.removeAll(keepingCapacity: true)
        
        guard let savedFilesCount = fileBuffer.readInt32() else {
            injectDemos()
            return false
        }
        guard savedFilesCount >= 0 && savedFilesCount < 8192 else {
            injectDemos()
            return false
        }
        var loadIndex = 0
        while loadIndex < savedFilesCount {
            let savedFile = SavedFile()
            guard savedFile.load(fileBuffer: fileBuffer) else {
                injectDemos()
                return false
            }
            savedFiles.append(savedFile)
            loadIndex += 1
        }
        
        injectDemos()
        
        return true
    }
    
    func injectDemos() {
        
        injectDemoIfNotExist(name: "ipad_landscape_yellow_shirt_blondie", index: 9882)
        
        injectDemoIfNotExist(name: "ipad_portrait_yellow_ripped_shirt_side_hussa", index: 9881)
        injectDemoIfNotExist(name: "ipad_portrait_orange_spill_nippage", index: 9001)
        
        
        injectDemoIfNotExist(name: "ipad_mini_por_super_duper_dupe_jiggle", index: 9000)
        
        
        injectDemoIfNotExist(name: "ipad_portrait_prison_boobs_blue_taps", index: 667)
        injectDemoIfNotExist(name: "ipad_portrait_prison_chests_squeeza_pleaza", index: 887)
        
        injectDemoIfNotExist(name: "ipad_portrait_pink_boobs_pasties_floor", index: 488)
        
        injectDemoIfNotExist(name: "ipad_landscape_orange_boobs_white_stripes", index: 688)
        
        
        injectDemoIfNotExist(name: "ipad_landscape_pink_milk_boobs", index: 469)
        injectDemoIfNotExist(name: "ipad_portrait_gray_ripped_shirt_boobs", index: 468)
        
        injectDemoIfNotExist(name: "red_shirt_red_alarm_fast_boobs", index: 467)
        
        injectDemoIfNotExist(name: "ipad_portrait_chest_white_buttons_shirt", index: 452)
        
        injectDemoIfNotExist(name: "ipad_portrait_green_white_boobs_closerz", index: 448)
        
        injectDemoIfNotExist(name: "ipad_portrait_pasties_first_one_too_plain", index: 445)
        injectDemoIfNotExist(name: "ipad_portrait_bed_blue_hair_devoss_jiggle", index: 444)
        
        injectDemoIfNotExist(name: "ipad_jelly_beans_portrait", index: 4)
        injectDemoIfNotExist(name: "ipad_landscape_green_gonzo_boobs", index: 105)
        
        injectDemoIfNotExist(name: "ipad_landscape_purple_boobs_forward_nice_five_ring", index: 121)
        injectDemoIfNotExist(name: "ipad_portrait_white_girl_blue_white_shirt_small_boobs", index: 120)
        
        injectDemoIfNotExist(name: "iphone_landscape_3d_white_boobs", index: 109)
        injectDemoIfNotExist(name: "ipad_poratait_pink_shirt", index: 103)
        injectDemoIfNotExist(name: "ipad_portrait_white_shirt_jugz", index: 104)
        injectDemoIfNotExist(name: "ipad_landscape_blue_boobs_burst", index: 102)
        
        injectDemoIfNotExist(name: "ipad_landscape_purple_tiddies_boomin", index: 106)
        
        injectDemoIfNotExist(name: "ipad_large_landscape_water_melon_off_center", index: 0)
        injectDemoIfNotExist(name: "no_rings_2_jiggles_2_sizes", index: 200)
        injectDemoIfNotExist(name: "ipad_medium_landscape_bears_pink_blue", index: 1)
        injectDemoIfNotExist(name: "ipad_mini_landscape_2_melons", index: 2)
        injectDemoIfNotExist(name: "ipad_blue_berries_portrait", index: 3)
        injectDemoIfNotExist(name: "ipad_gummy_bears_portrait", index: 3)
        
        injectDemoIfNotExist(name: "ipad_red_jello_landscape", index: 6)
        
    }
    
    func save(fileBuffer: FileBuffer) {
        fileBuffer.writeUInt32(UInt32(savedFiles.count))
        var saveIndex = 0
        while saveIndex < savedFiles.count {
            let savedFile = savedFiles[saveIndex]
            savedFile.save(fileBuffer: fileBuffer)
            saveIndex += 1
        }
    }
    
    func getSavedFile(at index: Int) -> SavedFile? {
        if index >= 0 && index < savedFiles.count {
            return savedFiles[index]
        }
        return nil
    }
    
    func move(from: Int, to: Int) {
        if (from >= 0 && from < savedFiles.count && to >= 0 && to < savedFiles.count && (from != to)) {
            let savedFile = savedFiles.remove(at: from)
            savedFiles.insert(savedFile, at: to)
            save()
        }
    }
}
