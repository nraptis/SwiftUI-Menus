//
//  ToolInterfaceViewModel+EnterLoopsPage3.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage3Line2()
        let iconPack = MainTabIconLibrary.zoom
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
        
        let viewModelLoopsPage3Enter = MagicalEnterModeViewModelLoopsPage3Enter(orientation: jiggleViewModel.orientation,
                                                                                enterModeConfiguration: configuration)
        let enterLoopsPage3ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeLoopsPage3,
                                               flex: flex,
                                               magicalViewModel: viewModelLoopsPage3Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage3Enter.refresh()
        return enterLoopsPage3ToolNode
    }
}
