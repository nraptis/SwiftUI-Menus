//
//  ToolInterfaceViewModel+EnterLoopsPage1.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage1Line2()
        let iconPack = FramedConvertibleIconLibrary.menuA
        let accentPack = FramedLongIconLibrary.menuB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage1Enter = MagicalModeChangeViewModelLoopsPage1Enter(orientation: jiggleViewModel.orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterLoopsPage1ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeLoopsPage1,
                                               flex: flex,
                                               magicalViewModel: viewModelLoopsPage1Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage1Enter.refresh()
        return enterLoopsPage1ToolNode
    }
}
