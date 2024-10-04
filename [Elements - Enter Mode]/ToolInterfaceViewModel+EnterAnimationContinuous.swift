//
//  ToolInterfaceViewModel+EnterAnimationContinuous.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousEnterLine2()
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
        
        let viewModelAnimationContinuousEnter = MagicalEnterModeViewModelAnimationContinuousEnter(orientation: jiggleViewModel.orientation,
                                                                                                  enterModeConfiguration: configuration)
        let enterAnimationContinuousToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .enterModeAnimationContinuous,
                                                        flex: flex,
                                                        magicalViewModel: viewModelAnimationContinuousEnter,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelAnimationContinuousEnter.refresh()
        return enterAnimationContinuousToolNode
    }
}
