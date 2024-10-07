//
//  ToolInterfaceViewModel+SexyAutoLoopEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//


import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAutoLoopEnabledSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAutoLoopEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAutoLoopEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAutoLoopEnabled = MagicalSexyCheckBoxViewModelAutoLoopEnabled(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let autoLoopEnabledToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBoxAutoLoopEnabled,
                                             flex: flex,
                                             magicalViewModel: viewModelAutoLoopEnabled,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelAutoLoopEnabled.refresh()
        return autoLoopEnabledToolNode
    }
}
