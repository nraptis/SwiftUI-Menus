//
//  ToolInterfaceViewModel+EnterVideoRecord.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        
        
        
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordEnterLine2()
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
        
        let viewModelVideoRecordEnter = MagicalEnterModeViewModelVideoRecordEnter(orientation: jiggleViewModel.orientation,
                                                                    enterModeConfiguration: configuration)
        let enterVideoRecordToolNode = ToolNode(id: getToolNodeID(),
                                            element: .enterModeVideoRecordEnter,
                                            flex: flex,
                                            magicalViewModel: viewModelVideoRecordEnter,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelVideoRecordEnter.refresh()
        return enterVideoRecordToolNode
    }
}
