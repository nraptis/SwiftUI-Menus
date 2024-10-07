//
//  ToolInterfaceViewModel+SexyStereoscopicEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getStereoscopicEnabledSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStereoscopicEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStereoscopicEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelStereoscopicEnabled = MagicalSexyCheckBoxViewModelStereoscopicEnabled(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let stereoscopicEnabledToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBoxStereoscopicEnabled,
                                             flex: flex,
                                             magicalViewModel: viewModelStereoscopicEnabled,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelStereoscopicEnabled.refresh()
        return stereoscopicEnabledToolNode
    }
}
