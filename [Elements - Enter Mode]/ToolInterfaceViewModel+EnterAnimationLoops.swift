//
//  ToolInterfaceViewModel+EnterAnimationLoops.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getEnterAnimationLoopsEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsEnterLine2()
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
        
        let viewModelAnimationLoopsEnter = MagicalEnterModeViewModelAnimationLoopsEnter(orientation: jiggleViewModel.orientation,
                                                                    enterModeConfiguration: configuration)
        let enterAnimationLoopsToolNode = ToolNode(id: getToolNodeID(),
                                            element: .enterModeAnimationLoopsEnter,
                                            flex: flex,
                                            magicalViewModel: viewModelAnimationLoopsEnter,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelAnimationLoopsEnter.refresh()
        return enterAnimationLoopsToolNode
    }
}
