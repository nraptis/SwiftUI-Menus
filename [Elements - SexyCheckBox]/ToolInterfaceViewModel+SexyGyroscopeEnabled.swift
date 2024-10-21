//
//  ToolInterfaceViewModel+SexyGyroscopeEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getGyroscopeEnabledCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGyroscopeEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGyroscopeEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelGyroscopeEnabled = MagicalCheckBoxViewModelGyroscopeEnabled(orientation: orientation,
                                                                                     checkBoxConfiguration: configuration)
        let gyroscopeEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                element: .checkBoxGyroscopeEnabled,
                                                flex: flex,
                                                magicalViewModel: viewModelGyroscopeEnabled,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelGyroscopeEnabled.refresh()
        return gyroscopeEnabledToolNode
    }
}
