//
//  ToolInterfaceViewModel+JiggleCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/22/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getJiggleCentersEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextJiggleCentersEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextJiggleCentersEnabledLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelJiggleCentersEnabled = MagicalCheckBoxViewModelJiggleCentersEnabled(orientation: jiggleViewModel.orientation,
                                                                                         checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxJiggleCentersEnabled,
                              flex: flex,
                              magicalViewModel: viewModelJiggleCentersEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelJiggleCentersEnabled.refresh()
        
        return result
    }
}
