//
//  ToolInterfaceViewModel+RowsPadZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    

    func getRowBluePrint_Zoom1_Pad() -> RowBluePrint {
        let nodes = [
            getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getDarkModeEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_1)
    }
    
    func getRowBluePrint_Zoom2_Pad() -> RowBluePrint {
        let nodes = [
            getZoomAmountSliderToolNode(widthCategory: .fullWidth,
                                        neighborTypeLeft: nil,
                                        neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_2)
    }
    
    func getRowBluePrint_Zoom3_Pad() -> RowBluePrint {
        let nodes = [
            getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getExitZoomModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
            getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_3)
    }
    
    
    
}
