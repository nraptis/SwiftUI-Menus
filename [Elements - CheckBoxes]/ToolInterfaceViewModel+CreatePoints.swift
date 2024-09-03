//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getCreatePointsCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextCreatePointsLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextCreatePointsLine2()
        let iconPack = CheckBoxIconLibrary.addPoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelCreatePoints = MagicalCheckBoxViewModelCreatePoints(orientation: jiggleViewModel.orientation,
                                                                         checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxCreatePoints,
                              flex: flex,
                              magicalViewModel: viewModelCreatePoints,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelCreatePoints.refresh()
        
        return result
    }
}

