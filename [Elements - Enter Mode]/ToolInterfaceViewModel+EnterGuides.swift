//
//  ToolInterfaceViewModel+EnterGuides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getEnterGuidesEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGuidesEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGuidesEnterLine2()
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
        
        let viewModelGuidesEnter = MagicalModeChangeViewModelGuidesEnter(orientation: jiggleViewModel.orientation,
                                                                         modeChangeConfiguration: configuration)
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
