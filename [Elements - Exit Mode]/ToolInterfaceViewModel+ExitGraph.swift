//
//  ToolInterfaceViewModel+ExitGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getExitGraphExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphExitLine2()
        let iconPack = MainTabIconLibrary.jelly
        let accentPack = MainTabIconLibrary.arrowTinyBwLeft
        
        
        let configuration = ToolInterfaceElementExitModeConfiguration(iconPack: iconPack,
                                                                      accentPack: accentPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelGraphExit = MagicalExitModeViewModelGraphExit(orientation: jiggleViewModel.orientation,
                                                                 exitModeConfiguration: configuration)
        let exitGraphToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeGraphExit,
                                        flex: flex,
                                        magicalViewModel: viewModelGraphExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelGraphExit.refresh()
        return exitGraphToolNode
    }
}
