//
//  ToolInterfaceViewModel+ExitGuides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getExitGuidesExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGuidesExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGuidesExitLine2()
        let iconPack = MainTabIconLibrary.jelly
        let accentPack = MainTabIconLibrary.arrowSmallLeft
        
        let configuration = ToolInterfaceElementExitModeConfiguration(iconPack: iconPack,
                                                                      accentPack: accentPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelGuidesExit = MagicalExitModeViewModelGuidesExit(orientation: jiggleViewModel.orientation,
                                                                 exitModeConfiguration: configuration)
        let exitGuidesToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeGuidesExit,
                                        flex: flex,
                                        magicalViewModel: viewModelGuidesExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelGuidesExit.refresh()
        return exitGuidesToolNode
    }
}
