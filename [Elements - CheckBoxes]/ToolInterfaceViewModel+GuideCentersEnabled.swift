//
//  ToolInterfaceViewModel+GuideCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/28/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getGuideCentersEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGuideCentersEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGuideCentersEnabledLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelGuideCentersEnabled = MagicalCheckBoxViewModelGuideCentersEnabled(orientation: jiggleViewModel.orientation,
                                                                                         checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxGuideCentersEnabled,
                              flex: flex,
                              magicalViewModel: viewModelGuideCentersEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelGuideCentersEnabled.refresh()
        
        return result
    }
}
