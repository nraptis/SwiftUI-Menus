//
//  ToolInterfaceViewModel+ExitZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getExitZoomExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextZoomExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextZoomExitLine2()
        let iconPack = MainTabIconLibrary.polygon
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
        
        let viewModelZoomExit = MagicalExitModeViewModelZoomExit(orientation: jiggleViewModel.orientation,
                                                                 exitModeConfiguration: configuration)
        let exitZoonToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeZoomExit,
                                        flex: flex,
                                        magicalViewModel: viewModelZoomExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelZoomExit.refresh()
        return exitZoonToolNode
    }
}
