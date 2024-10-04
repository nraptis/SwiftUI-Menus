//
//  ToolInterfaceViewModel+EnterTimeLine.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getEnterTimeLineEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineEnterLine2()
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
        
        let viewModelTimeLineEnter = MagicalEnterModeViewModelTimeLineEnter(orientation: jiggleViewModel.orientation,
                                                                    enterModeConfiguration: configuration)
        let enterTimeLineToolNode = ToolNode(id: getToolNodeID(),
                                            element: .enterModeTimeLineEnter,
                                            flex: flex,
                                            magicalViewModel: viewModelTimeLineEnter,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelTimeLineEnter.refresh()
        return enterTimeLineToolNode
    }
}
