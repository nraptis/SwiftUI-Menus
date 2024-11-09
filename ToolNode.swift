//
//  ToolNode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/13/24.
//

import Foundation

class ToolNode {
    let id: UInt16
    let element: ToolInterfaceElement
    let type: ToolInterfaceElementType
    let flex: ToolInterfaceElementFlex
    
    //unowned var toolInterfaceViewModel: ToolInterfaceViewModel!
    
    let magicalViewModel: MagicalViewModel
    var isCenterPinned = false
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("ToolNode - Dealloc \(element)")
        }
    }
    
    @MainActor init(id: UInt16,
         element: ToolInterfaceElement,
         flex: ToolInterfaceElementFlex,
         //toolInterfaceViewModel: ToolInterfaceViewModel,
         magicalViewModel: MagicalViewModel,
         neighborTypeLeft: ToolInterfaceElementType?,
         neighborTypeRight: ToolInterfaceElementType?) {
        self.id = id
        self.element = element
        self.type = element.type
        self.flex = flex
        //self.toolInterfaceViewModel = toolInterfaceViewModel
        self.magicalViewModel = magicalViewModel
        magicalViewModel.toolNode = self
        magicalViewModel.neighborTypeLeft = neighborTypeLeft
        magicalViewModel.neighborTypeRight = neighborTypeRight
    }
    
    @MainActor var layoutX: Int {
        get {
            magicalViewModel.layoutX
        }
        set {
            if magicalViewModel.layoutX != newValue {
                magicalViewModel.layoutX = newValue
            }
        }
    }
    
    @MainActor var layoutY: Int {
        get {
            magicalViewModel.layoutY
        }
        set {
            if magicalViewModel.layoutY != newValue {
                magicalViewModel.layoutY = newValue
            }
        }
    }
    
    @MainActor var layoutWidth: Int {
        get {
            magicalViewModel.layoutWidth
        }
        set {
            if magicalViewModel.layoutWidth != newValue {
                magicalViewModel.layoutWidth = newValue
            }
        }
    }
    
    @MainActor var layoutHeight: Int {
        get {
            magicalViewModel.layoutHeight
        }
        set {
            if magicalViewModel.layoutHeight != newValue {
                magicalViewModel.layoutHeight = newValue
            }
        }
    }
    
    var neighborTypeLeft: ToolInterfaceElementType? {
        get {
            magicalViewModel.neighborTypeLeft
        }
        set {
            magicalViewModel.neighborTypeLeft = newValue
        }
    }
    
    var neighborTypeRight: ToolInterfaceElementType? {
        get {
            magicalViewModel.neighborTypeRight
        }
        set {
            magicalViewModel.neighborTypeRight = newValue
        }
    }
}

extension ToolNode: Identifiable {
    
}
