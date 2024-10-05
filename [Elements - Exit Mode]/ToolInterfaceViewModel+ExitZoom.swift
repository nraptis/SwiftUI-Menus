//
//  ToolInterfaceViewModel+ExitZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getExitZoomExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextZoomExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextZoomExitLine2()
       let iconPack = FramedConvertibleIconLibrary.menuC
       let accentPack = FramedLongIconLibrary.menuA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                      accentPack: accentPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomExit = MagicalExitModeViewModelZoomExit(orientation: jiggleViewModel.orientation,
                                                                 modeChangeConfiguration: configuration)
        let exitZoomToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeZoomExit,
                                        flex: flex,
                                        magicalViewModel: viewModelZoomExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelZoomExit.refresh()
        return exitZoomToolNode
    }
}
