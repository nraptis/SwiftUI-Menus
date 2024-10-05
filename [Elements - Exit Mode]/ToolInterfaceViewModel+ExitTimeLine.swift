//
//  ToolInterfaceViewModel+ExitTimeLine.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getExitTimeLineExitModeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineExitLine2()
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
        
        let viewModelTimeLineExit = MagicalExitModeViewModelTimeLineExit(orientation: jiggleViewModel.orientation,
                                                                         modeChangeConfiguration: configuration)
        let exitTimeLineToolNode = ToolNode(id: getToolNodeID(),
                                            element: .exitModeTimeLineExit,
                                            flex: flex,
                                            magicalViewModel: viewModelTimeLineExit,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelTimeLineExit.refresh()
        return exitTimeLineToolNode
    }
}
