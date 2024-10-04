//
//  ToolInterfaceViewModel+EnterLoopsPage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage2Line2()
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
        
        let viewModelLoopsPage2Enter = MagicalEnterModeViewModelLoopsPage2Enter(orientation: jiggleViewModel.orientation,
                                                                                enterModeConfiguration: configuration)
        let enterLoopsPage2ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeLoopsPage2,
                                               flex: flex,
                                               magicalViewModel: viewModelLoopsPage2Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage2Enter.refresh()
        return enterLoopsPage2ToolNode
    }
}
