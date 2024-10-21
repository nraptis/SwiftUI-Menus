//
//  ToolInterfaceViewModel+SexyStereoscopicEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getStereoscopicEnabledCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStereoscopicEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStereoscopicEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelStereoscopicEnabled = MagicalCheckBoxViewModelStereoscopicEnabled(orientation: orientation,
                                                                                           checkBoxConfiguration: configuration)
        let stereoscopicEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .checkBoxStereoscopicEnabled,
                                                   flex: flex,
                                                   magicalViewModel: viewModelStereoscopicEnabled,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelStereoscopicEnabled.refresh()
        return stereoscopicEnabledToolNode
    }
}
