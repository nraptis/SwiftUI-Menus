//
//  ToolInterfaceViewModel+RowsPadZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowBluePrint_Zoom1_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .spacer,
            .checkBox(.darkMode)
        ])
        return RowBluePrint(nodes: nodes, configuration: .zoom_1)
    }
    
    @MainActor func getRowBluePrint_Zoom2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .slider(.init(widthCategory: .fullWidth, slider: .zoomAmount))
        ])
        return RowBluePrint(nodes: nodes, configuration: .zoom_2)
    }
    
    @MainActor func getRowBluePrint_Zoom3_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.zoom),
            .spacer,
            .button_pair(.zoomIn, .zoomOut),
            .dividerSpacerDivider,
            .button_pair(.zoomJiggle, .zoomReset)
        ])
        return RowBluePrint(nodes: nodes, configuration: .zoom_3)
    }
    
}
