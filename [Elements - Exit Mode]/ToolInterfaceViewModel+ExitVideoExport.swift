//
//  ToolInterfaceViewModel+ExitVideoExport.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getExitVideoExportExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportExitLine2()
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
        
        let viewModelVideoExportExit = MagicalExitModeViewModelVideoExportExit(orientation: jiggleViewModel.orientation,
                                                                 exitModeConfiguration: configuration)
        let exitVideoExportToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeVideoExportExit,
                                        flex: flex,
                                        magicalViewModel: viewModelVideoExportExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelVideoExportExit.refresh()
        return exitVideoExportToolNode
    }
}
