//
//  ToolInterfaceViewModel+SexyJiggleCenters.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getJiggleCentersSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextJiggleCentersEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextJiggleCentersEnabledLine2()
        let iconPack = MainTabIconLibrary.drawGuide
        
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelJiggleCenters = MagicalSexyCheckBoxViewModelJiggleCenters(orientation: orientation,
                                                                     sexyCheckBoxConfiguration: configuration)
        let jiggleCentersToolNode = ToolNode(id: getToolNodeID(),
                                        element: .sexyCheckBoxJiggleCenters,
                                        flex: flex,
                                        magicalViewModel: viewModelJiggleCenters,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelJiggleCenters.refresh()
        return jiggleCentersToolNode
    }
}
