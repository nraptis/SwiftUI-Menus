//
//  ToolInterfaceViewModel+EnterVideoExport.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getEnterVideoExportEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportEnterLine2()
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
        
        let viewModelVideoExportEnter = MagicalModeChangeViewModelVideoExportEnter(orientation: jiggleViewModel.orientation,
                                                                                   modeChangeConfiguration: configuration)
        let enterVideoExportToolNode = ToolNode(id: getToolNodeID(),
                                                element: .enterModeVideoExportEnter,
                                                flex: flex,
                                                magicalViewModel: viewModelVideoExportEnter,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelVideoExportEnter.refresh()
        return enterVideoExportToolNode
    }
}
