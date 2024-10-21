//
//  ToolInterfaceViewModel+RowsPadVideoExport.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowBluePrint_VideoExport1_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .spacer,
            .checkBox(.darkMode)
        ])
        return RowBluePrint(nodes: nodes, configuration: .video_export_1, centerPinnedElement: .mainTabDocumentMode)
    }
    
    @MainActor func getRowBluePrint_VideoExport2_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .greenButton(.createScene),
            .segment(.animationMode),
            .spacer,
            .mainTab(.jainTabTest)
        ])
        return RowBluePrint(nodes: nodes, configuration: .video_export_2, centerPinnedElement: .mainTabDocumentMode)
    }
    
    @MainActor func getRowBluePrint_VideoExport3_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.videoExport),
            .exitMode(.videoRecord),
            .spacer,
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .video_export_3, centerPinnedElement: .mainTabDocumentMode)
    }
    
}
