//
//  ToolInterfaceViewModel+RowsPadVideoRecord.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRowBluePrint_VideoRecord1_Pad() -> RowBluePrint {
        let nodes = [
            getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_record_1)
    }
    
    @MainActor func getRowBluePrint_VideoRecord2_Pad() -> RowBluePrint {
        let nodes = [
            getExitVideoRecordExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterVideoExportEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_record_2)
    }
    
    
    
}
