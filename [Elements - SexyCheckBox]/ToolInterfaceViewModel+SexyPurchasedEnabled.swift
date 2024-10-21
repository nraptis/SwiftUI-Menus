//
//  ToolInterfaceViewModel+SexyPurchasedEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/8/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getPurchasedEnabledCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = "IZ"
        let textLine2 = "BUY"
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelPurchasedEnabled = MagicalCheckBoxViewModelPurchasedEnabled(orientation: orientation,
                                                                                     checkBoxConfiguration: configuration)
        let stereoscopicEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .checkBoxPurchasedEnabled,
                                                   flex: flex,
                                                   magicalViewModel: viewModelPurchasedEnabled,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelPurchasedEnabled.refresh()
        return stereoscopicEnabledToolNode
    }
}
