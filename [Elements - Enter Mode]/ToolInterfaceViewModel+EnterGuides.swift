//
//  ToolInterfaceViewModel+EnterGuides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getEnterGuidesEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGuidesEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGuidesEnterLine2()
        let iconPack = MainTabIconLibrary.guideRings
        let accentPack = MainTabIconLibrary.arrowTinyFcaRight
        
        
        let configuration = ToolInterfaceElementEnterModeConfiguration(iconPack: iconPack,
                                                                       accentPack: accentPack,
                                                                       orientation: orientation,
                                                                       nameLabelLine1: textLine1,
                                                                       nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelGuidesEnter = MagicalEnterModeViewModelGuidesEnter(orientation: jiggleViewModel.orientation,
                                                                    enterModeConfiguration: configuration)
        let enterGuidesToolNode = ToolNode(id: getToolNodeID(),
                                            element: .enterModeGuidesEnter,
                                            flex: flex,
                                            magicalViewModel: viewModelGuidesEnter,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelGuidesEnter.refresh()
        return enterGuidesToolNode
    }
}
