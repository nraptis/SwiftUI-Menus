//
//  ToolInterfaceViewModel+EnterZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getEnterZoomEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextZoomEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextZoomEnterLine2()
        let iconPack = MainTabIconLibrary.pinch
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
        
        let viewModelZoomEnter = MagicalEnterModeViewModelZoomEnter(orientation: jiggleViewModel.orientation,
                                                                    enterModeConfiguration: configuration)
        let enterZoomToolNode = ToolNode(id: getToolNodeID(),
                                            element: .enterModeZoomEnter,
                                            flex: flex,
                                            magicalViewModel: viewModelZoomEnter,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelZoomEnter.refresh()
        return enterZoomToolNode
    }
}
