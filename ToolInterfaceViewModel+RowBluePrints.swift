//
//  ToolInterfaceViewModel+RowBluePrints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/18/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRowBluePrint(slot: ToolRowSlot,
                         configuration: any InterfaceConfigurationConforming,
                         orientation: Orientation) -> RowBluePrint? {
        switch slot {
        case .unknown:
            break
        case .top_Primary:
            return getRowBluePrint_Top_Primary(configuration: configuration, orientation: orientation)
        case .top_Secondary1:
            return getRowBluePrint_Top_Secondary1(configuration: configuration, orientation: orientation)
        case .top_Secondary2:
            return getRowBluePrint_Top_Secondary2(configuration: configuration, orientation: orientation)
        case .top_Test:
            return getRowBluePrint_Top_Test()
        case .bottom_Test:
            return getRowBluePrint_Bottom_Test()
        case .bottom_Secondary2:
            return getRowBluePrint_Bottom_Secondary2(configuration: configuration, orientation: orientation)
        case .bottom_Secondary1:
            return getRowBluePrint_Bottom_Secondary1(configuration: configuration, orientation: orientation)
        case .bottom_Primary:
            return getRowBluePrint_Bottom_Primary(configuration: configuration, orientation: orientation)
        case .graph_side_menu_1:
            return getRowBluePrint_GraphSideMenu1(configuration: configuration, orientation: orientation)
        case .graph_side_menu_2:
            return getRowBluePrint_GraphSideMenu2(configuration: configuration, orientation: orientation)
        case .graph_side_menu_3:
            return getRowBluePrint_GraphSideMenu3(configuration: configuration, orientation: orientation)
        case .video_record_1:
            return getRowBluePrint_VideoRecord1(configuration: configuration, orientation: orientation)
        case .video_record_2:
            return getRowBluePrint_VideoRecord2(configuration: configuration, orientation: orientation)
        case .video_export_1:
            return getRowBluePrint_VideoExport1(configuration: configuration, orientation: orientation)
        case .video_export_2:
            return getRowBluePrint_VideoExport2(configuration: configuration, orientation: orientation)
        case .video_export_3:
            return getRowBluePrint_VideoExport3(configuration: configuration, orientation: orientation)
        case .video_export_4:
            return getRowBluePrint_VideoExport4(configuration: configuration, orientation: orientation)
        case .zoom_1:
            return getRowBluePrint_Zoom1(configuration: configuration, orientation: orientation)
        case .zoom_2:
            return getRowBluePrint_Zoom2(configuration: configuration, orientation: orientation)
        case .zoom_3:
            return getRowBluePrint_Zoom3(configuration: configuration, orientation: orientation)
        case .zoom_4:
            return getRowBluePrint_Zoom4(configuration: configuration, orientation: orientation)
        }
        return nil
    }
    
    func getRowBluePrint_Top_Test() -> RowBluePrint? {
        let nodes = [
            getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            //getDocumentModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getPhoneCollapseTopToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Test)
    }
    
    func getRowBluePrint_Bottom_Test() -> RowBluePrint? {
        let nodes = [
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getWeightCurveGraphEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: .checkBox),
            getZoomEnabledCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Test)
    }
    
    func getRowBluePrint_Top_Primary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Top_Primary_Pad(configuration)
        } else {
            return getRowBluePrint_Top_Primary_Pad(configuration)
        }
    }
    
    func getRowBluePrint_Top_Secondary1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Top_Secondary1_Pad(configuration)
        } else {
            return getRowBluePrint_Top_Secondary1_Pad(configuration)
        }
    }
    
    func getRowBluePrint_Top_Secondary2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Top_Secondary2_Pad(configuration)
        } else {
            return getRowBluePrint_Top_Secondary2_Pad(configuration)
        }
    }
    
    func getRowBluePrint_Bottom_Primary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Primary_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Primary_Pad(configuration)
        }
    }
    
    func getRowBluePrint_Bottom_Secondary1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Secondary1_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Secondary1_Pad(configuration)
        }
    }
    
    func getRowBluePrint_Bottom_Secondary2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Secondary2_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Secondary2_Pad(configuration)
        }
    }
    
    func getRowBluePrint_GraphSideMenu1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        let nodes = [
            getResetWeightGraphTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
        ]
        return RowBluePrint(nodes: nodes, configuration: .graph_side_menu_1)
    }
    
    func getRowBluePrint_GraphSideMenu2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        let nodes = [
            getBreakManualWeightGraphTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
        ]
        return RowBluePrint(nodes: nodes, configuration: .graph_side_menu_2)
    }
    
    func getRowBluePrint_GraphSideMenu3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        let nodes = [
            getExitWeightModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
        ]
        return RowBluePrint(nodes: nodes, configuration: .graph_side_menu_3)
    }

    func getRowBluePrint_VideoRecord1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoRecord1_Pad()
        } else {
            return getRowBluePrint_VideoRecord1_Pad()
        }
    }
    
    func getRowBluePrint_VideoRecord2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoRecord2_Pad()
        } else {
            return getRowBluePrint_VideoRecord2_Pad()
        }
    }

    func getRowBluePrint_VideoExport1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport1_Pad()
        } else {
            return getRowBluePrint_VideoExport1_Pad()
        }
    }
    
    func getRowBluePrint_VideoExport2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport2_Pad()
        } else {
            return getRowBluePrint_VideoExport2_Pad()
        }
    }
    
    func getRowBluePrint_VideoExport3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport3_Pad()
        } else {
            return getRowBluePrint_VideoExport3_Pad()
        }
    }
    
    func getRowBluePrint_VideoExport4(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        return nil
    }

    func getRowBluePrint_Zoom1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom1_Pad()
        } else {
            return getRowBluePrint_Zoom1_Pad()
        }
    }
    
    func getRowBluePrint_Zoom2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom2_Pad()
        } else {
            return getRowBluePrint_Zoom2_Pad()
        }
    }
    
    func getRowBluePrint_Zoom3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom3_Pad()
        } else {
            return getRowBluePrint_Zoom3_Pad()
        }
    }
    
    func getRowBluePrint_Zoom4(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        return nil
    }
    
    
    /*
    func adaptAllRows() {
        
        toolConfigurationIdiomPrevious = toolConfigurationIdiomCurrent
        toolConfigurationIdiomCurrent = calculateToolConfigurationIdiom()
        
        let isReversed = getIsReversed(fromIdiom: toolConfigurationIdiomPrevious,
                                       toIdiom: toolConfigurationIdiomCurrent)
        
        if Device.isPad {
            adaptAllRowsPad(isReversed: isReversed)
        } else {
            adaptAllRowsPhone(isReversed: isReversed)
        }
    }
    
    func getIsReversed(fromIdiom: ToolConfigurationIdiom, toIdiom: ToolConfigurationIdiom) -> Bool {
        return Bool.random()
    }
    
    func adaptAllRowsPad(isReversed: Bool) {
        
        
        //isGraphSupported
        

        updateRow(slot: .top_Primary,
                  rowBluePrint: getRowBluePrint_Top_Primary_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: false,
                  reversed: isReversed)
        updateRow(slot: .top_Secondary1,
                  rowBluePrint: getRowBluePrint_Top_Secondary1_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
                  reversed: isReversed)
        updateRow(slot: .top_Secondary2,
                  rowBluePrint: getRowBluePrint_Top_Secondary2_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
                  reversed: isReversed)
        
        updateRow(slot: .bottom_Secondary2,
                  rowBluePrint: getRowBluePrint_Bottom_Secondary2_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
                  reversed: isReversed)
        updateRow(slot: .bottom_Secondary1,
                  rowBluePrint: getRowBluePrint_Bottom_Secondary1_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
                  reversed: isReversed)
        updateRow(slot: .bottom_Primary,
                  rowBluePrint: getRowBluePrint_Bottom_Primary_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
                  reversed: isReversed)
        
    }
    
    func adaptAllRowsPhone(isReversed: Bool) {
        
    }
    */
    
}
