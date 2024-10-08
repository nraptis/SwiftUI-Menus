//
//  ToolInterfaceViewModel+EnterGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getEnterGraphEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphEnterLine2()
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
        
        let viewModelGraphEnter = MagicalModeChangeViewModelGraphEnter(orientation: jiggleViewModel.orientation,
                                                                       modeChangeConfiguration: configuration)
        let enterGraphToolNode = ToolNode(id: getToolNodeID(),
                                          element: .enterModeGraphEnter,
                                          flex: flex,
                                          magicalViewModel: viewModelGraphEnter,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelGraphEnter.refresh()
        return enterGraphToolNode
    }
}
