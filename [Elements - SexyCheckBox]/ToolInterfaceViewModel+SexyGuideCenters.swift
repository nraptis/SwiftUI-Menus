//
//  ToolInterfaceViewModel+SexyGuideCenters.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getGuideCentersSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGuideCentersEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGuideCentersEnabledLine2()
        let iconPack = MainTabIconLibrary.drawGuide
        
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelGuideCenters = MagicalSexyCheckBoxViewModelGuideCenters(orientation: orientation,
                                                                     sexyCheckBoxConfiguration: configuration)
        let guideCentersToolNode = ToolNode(id: getToolNodeID(),
                                        element: .sexyCheckBoxGuideCenters,
                                        flex: flex,
                                        magicalViewModel: viewModelGuideCenters,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelGuideCenters.refresh()
        return guideCentersToolNode
    }
}
