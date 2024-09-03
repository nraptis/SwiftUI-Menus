//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getCreateJigglesDrawingCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextCreateJigglesDrawingLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextCreateJigglesDrawingLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelCreateJigglesDrawing = MagicalCheckBoxViewModelCreateJigglesDrawing(orientation: jiggleViewModel.orientation,
                                                                                         checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxCreateJigglesDrawing,
                              flex: flex,
                              magicalViewModel: viewModelCreateJigglesDrawing,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelCreateJigglesDrawing.refresh()
        
        return result
    }
}

