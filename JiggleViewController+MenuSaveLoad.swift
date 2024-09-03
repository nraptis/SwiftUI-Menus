//
//  JiggleViewController+MenuSaveLoad.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/27/24.
//

import Foundation

extension JiggleViewController {
    
    
    private var menuSaveFilePath: String {
        FileUtils.shared.getDocumentPath(fileName: "menu.cfg")
    }
    
    func menuLoad() {
        if true {
            let fileBuffer = FileBuffer()
            fileBuffer.load(filePath: menuSaveFilePath)
            menuLoad(fileBuffer: fileBuffer)
        }
    }
    
    func menuSave() {
        if true {
            let fileBuffer = FileBuffer()
            menuSave(fileBuffer: fileBuffer)
            fileBuffer.save(filePath: menuSaveFilePath)
        }
    }
    
    func menuSave(fileBuffer: FileBuffer) {
        fileBuffer.writeFloat32(Float(padDraggableMenuLeftConstraint.constant))
        fileBuffer.writeFloat32(Float(padDraggableMenuTopConstraint.constant))
        fileBuffer.writeFloat32(Float(padDraggableMenuWidthConstraint.constant))
        fileBuffer.writeFloat32(Float(padDraggableMenuHeightConstraint.constant))
    }
    
    func menuLoad(fileBuffer: FileBuffer) {
        var didLoad = false
        
        var left = Float(0.0)
        if let _left = fileBuffer.readFloat32() {
            left = _left
        }
        var top = Float(0.0)
        if let _top = fileBuffer.readFloat32() {
            top = _top
        }
        var width = Float(0.0)
        if let _width = fileBuffer.readFloat32() {
            width = _width
        }
        
        if fileBuffer.readFloat32() != nil {
            // We read the height, but don't use it.
            didLoad = true
        }
        
        if didLoad {
            
            padDraggableMenuLeftConstraint.constant = CGFloat(left)
            padDraggableMenuTopConstraint.constant = CGFloat(top)
            padDraggableMenuWidthConstraint.constant = CGFloat(width)
            //padDraggableMenuHeightConstraint.constant = CGFloat(height)
            
            let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: jiggleDocument.orientation)
            let newWidthI = Int(width + 0.5)
            
            jiggleViewModel.toolInterfaceViewModel.layoutAllRowsTablet(menuWidthWithSafeArea: newWidthI,
                                                                       rowHeight:  rowHeight,
                                                                       safeAreaLeft: 0,
                                                                       safeAreaRight: 0)
        }
    }
}
