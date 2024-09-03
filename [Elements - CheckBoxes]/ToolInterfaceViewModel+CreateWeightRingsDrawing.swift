//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getCreateWeightRingsDrawingCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextCreateWeightRingsDrawingLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextCreateWeightRingsDrawingLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelCreateWeightRingsDrawing = MagicalCheckBoxViewModelCreateWeightRingsDrawing(orientation: jiggleViewModel.orientation,
                                                                                                 checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxCreateWeightRingsDrawing,
                              flex: flex,
                              magicalViewModel: viewModelCreateWeightRingsDrawing,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelCreateWeightRingsDrawing.refresh()
        
        return result
    }
}
