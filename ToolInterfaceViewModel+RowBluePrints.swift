//
//  ToolInterfaceViewModel+RowBluePrints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/18/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRowBluePrint(slot: ToolRowSlot,
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
        case .top_Test_1:
            return getRowBluePrint_Top_Test_1()
        case .top_Test_2:
            return getRowBluePrint_Top_Test_2()
        case .top_Test_3:
            return getRowBluePrint_Top_Test_3()
            
        case .bottom_Test_1:
            return getRowBluePrint_Bottom_Test_1()
        case .bottom_Test_2:
            return getRowBluePrint_Bottom_Test_2()
        case .bottom_Test_3:
            return getRowBluePrint_Bottom_Test_3()
        case .bottom_Test_4:
            return getRowBluePrint_Bottom_Test_4()
            
        case .bottom_Secondary2:
            return getRowBluePrint_Bottom_Secondary2(configuration: configuration, orientation: orientation)
        case .bottom_Secondary1:
            return getRowBluePrint_Bottom_Secondary1(configuration: configuration, orientation: orientation)
        case .bottom_Primary:
            return getRowBluePrint_Bottom_Primary(configuration: configuration, orientation: orientation)
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
    
    @MainActor func getRowBluePrint_Top_Test_1() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .segment(.editMode),
            .spacer,
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Hello")),
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Hello World World Hello World")),
            .favoringOneLineLabel(.init(minimumWidth: 0, text:  "Hello World World")),
            .spacer,
            .segment(.weightMode)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Test_1)
    }
    
    @MainActor func getRowBluePrint_Top_Test_2() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .mainTab(.jainTabTest),
            .spacer,
            .mainTab(.documentMode),
            .greenButton(.done),
            .greenButton(.createScene)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Test_2)
    }
    
    @MainActor func getRowBluePrint_Top_Test_3() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .enterMode(.guides),
            .enterMode(.graph),
            .spacer,
            .stepper(.coinCount),
            .stepper(.timeLinePointCount)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Test_3)
    }
    
    @MainActor func getRowBluePrint_Bottom_Test_1() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .greenButton(.done),
            .spacer,
            .stepper(.coinCount),
            .spacer,
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Please Purchase, Please Merge")),
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Please Purchase")),
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Test_1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Test_2() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .segment(.animationMode),
            .segment(.editMode),
            .spacer,
            .exitMode(.animationLoops),
            .exitMode(.zoom)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Test_2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Test_3() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .slider(.init(widthCategory: .halfWidthLeft, slider: .jigglePower)),
            .spacer,
            .mainTab(.skainTabTest)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Test_3)
    }
    
    @MainActor func getRowBluePrint_Bottom_Test_4() -> RowBluePrint? {
        // Verified Oct 20, 2024
        let nodes = generateNodes([
            .slider(.init(widthCategory: .halfWidthLeft, slider: .jiggleSpeed)),
            .spacer,
            .stepper(.gemCount),
            .stepper(.coinCount)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Test_4)
    }
    
    @MainActor func getRowBluePrint_Top_Primary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Top_Primary_Pad(configuration)
        } else {
            return getRowBluePrint_Top_Primary_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Top_Secondary1_Pad(configuration)
        } else {
            return getRowBluePrint_Top_Secondary1_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Top_Secondary2_Pad(configuration)
        } else {
            return getRowBluePrint_Top_Secondary2_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Primary_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Primary_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Secondary1_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Secondary1_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Secondary2_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Secondary2_Pad(configuration)
        }
    }

    @MainActor func getRowBluePrint_VideoRecord1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoRecord1_Pad()
        } else {
            return getRowBluePrint_VideoRecord1_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoRecord2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoRecord2_Pad()
        } else {
            return getRowBluePrint_VideoRecord2_Pad()
        }
    }

    @MainActor func getRowBluePrint_VideoExport1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport1_Pad()
        } else {
            return getRowBluePrint_VideoExport1_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport2_Pad()
        } else {
            return getRowBluePrint_VideoExport2_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport3_Pad()
        } else {
            return getRowBluePrint_VideoExport3_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport4(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        return nil
    }

    @MainActor func getRowBluePrint_Zoom1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom1_Pad()
        } else {
            return getRowBluePrint_Zoom1_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_Zoom2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom2_Pad()
        } else {
            return getRowBluePrint_Zoom2_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_Zoom3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom3_Pad()
        } else {
            return getRowBluePrint_Zoom3_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_Zoom4(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
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
