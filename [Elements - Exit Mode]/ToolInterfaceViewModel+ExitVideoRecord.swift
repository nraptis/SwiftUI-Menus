//
//  ToolInterfaceViewModel+ExitVideoRecord.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getExitVideoRecordExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordExitLine2()
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
        
        let viewModelVideoRecordExit = MagicalExitModeViewModelVideoRecordExit(orientation: jiggleViewModel.orientation,
                                                                 modeChangeConfiguration: configuration)
        let exitVideoRecordToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeVideoRecordExit,
                                        flex: flex,
                                        magicalViewModel: viewModelVideoRecordExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelVideoRecordExit.refresh()
        return exitVideoRecordToolNode
    }
}
