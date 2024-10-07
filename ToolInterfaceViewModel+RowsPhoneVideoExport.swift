//
//  ToolInterfaceViewModel+RowsPhoneVideoExport.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRowBluePrint_VideoExport1_Pad() -> RowBluePrint {
        let nodes = [
            getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),

        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_1)
    }
    
    @MainActor func getRowBluePrint_VideoExport2_Pad() -> RowBluePrint {
        let nodes = [
            getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_2)
    }
    
    @MainActor func getRowBluePrint_VideoExport3_Pad() -> RowBluePrint {
        let nodes = [
            getExitVideoExportExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getExitVideoRecordExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_3)
    }
    
    
}
