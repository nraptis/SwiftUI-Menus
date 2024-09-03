//
//  ToolInterfaceViewModel+RowsPhoneVideoExport.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRowBluePrint_VideoExport1_Pad() -> RowBluePrint {
        let nodes = [
            getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getTwistEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_1)
    }
    
    func getRowBluePrint_VideoExport2_Pad() -> RowBluePrint {
        let nodes = [
            getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_2)
    }
    
    func getRowBluePrint_VideoExport3_Pad() -> RowBluePrint {
        let nodes = [
            getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getExitZoomModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_3)
    }
    
    
}
