//
//  ToolInterfaceViewModel+RowsPadVideoRecord.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowBluePrint_VideoRecord1_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .spacer,
            .checkBox(.darkMode)
        ])
        return RowBluePrint(nodes: nodes, configuration: .video_record_1)
    }
    
    @MainActor func getRowBluePrint_VideoRecord2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.videoRecord),
            .spacer,
            .enterMode(.videoExport)
        ])
        return RowBluePrint(nodes: nodes, configuration: .video_record_2)
    }
    
}
