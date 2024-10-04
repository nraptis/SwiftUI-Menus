//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getWeightCurveGraphEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextWeightCurveGraphEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextWeightCurveGraphEnabledLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelWeightCurveGraphEnabled = MagicalCheckBoxViewModelWeightCurveGraphEnabled(orientation: jiggleViewModel.orientation,
                                                                                               checkBoxConfiguration: configuration)
          
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxWeightCurveGraphEnabled,
                              flex: flex,
                              magicalViewModel: viewModelWeightCurveGraphEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelWeightCurveGraphEnabled.refresh()
        
        return result
    }
}
