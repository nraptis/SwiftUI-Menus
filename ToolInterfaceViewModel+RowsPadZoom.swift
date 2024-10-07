//
//  ToolInterfaceViewModel+RowsPadZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRowBluePrint_Zoom1_Pad() -> RowBluePrint {
        let nodes = [
            getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_1)
    }
    
    @MainActor func getRowBluePrint_Zoom2_Pad() -> RowBluePrint {
        let nodes = [
            getZoomAmountSliderToolNode(widthCategory: .fullWidth,
                                        neighborTypeLeft: nil,
                                        neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_2)
    }
    
    @MainActor func getRowBluePrint_Zoom3_Pad() -> RowBluePrint {
        let nodes = [
            getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_3)
    }
    
}
