//
//  ToolInterfaceViewModel+RowsPadVideoRecord.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRowBluePrint_VideoRecord1_Pad() -> RowBluePrint {
        let nodes = [
            getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getDarkModeEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_record_1)
    }
    
    func getRowBluePrint_VideoRecord2_Pad() -> RowBluePrint {
        let nodes = [
            getExitRecordModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getRemoveJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .iconButton),
            getPhoneCollapseTopToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_record_2)
    }
    
    
    
}
