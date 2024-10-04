//
//  ToolInterfaceViewModel+ExitAnimationLoops.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsExitLine2()
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
        
        let viewModelAnimationLoopsExit = MagicalExitModeViewModelAnimationLoopsExit(orientation: jiggleViewModel.orientation,
                                                                 exitModeConfiguration: configuration)
        let exitAnimationLoopsToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeAnimationLoopsExit,
                                        flex: flex,
                                        magicalViewModel: viewModelAnimationLoopsExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelAnimationLoopsExit.refresh()
        return exitAnimationLoopsToolNode
    }
}
