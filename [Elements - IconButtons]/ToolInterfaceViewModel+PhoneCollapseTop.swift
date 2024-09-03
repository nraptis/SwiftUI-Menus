//
//  ToolInterfaceViewModel+PhoneCollapseTop.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPhoneCollapseTopToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getPhoneCollapseTopButtonConfiguration()
        let flex = Self.getIconButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        let viewModelPhoneCollapseTop = MagicalIconButtonViewModelPhoneCollapseTop(orientation: jiggleViewModel.orientation,
                                                                                   iconButtonConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .buttonPhoneCollapseTop,
                              flex: flex,
                              magicalViewModel: viewModelPhoneCollapseTop,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelPhoneCollapseTop.refresh()
        return result
    }
    
    func getPhoneCollapseTopButtonConfiguration() -> ToolInterfaceElementIconButtonConfiguration {
        let orientation = jiggleViewModel.orientation
        let iconPack = TextIconButtonIconLibrary.box
        return ToolInterfaceElementIconButtonConfiguration(iconPack: iconPack,
                                                           orientation: orientation)
    }
}
