//
//  JiggleViewController+History.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/12/24.
//

import Foundation

extension JiggleViewController {
    
    func getHistoryInterfaceToolAction(_ historyState: HistoryState) -> ToolAction {
        let worldConfiguration = historyState.getWorldConfiguration(editMode: jiggleDocument.editMode,
                                                                    weightMode: jiggleDocument.weightMode)
        
        let toolAction = batchInterfaceAction { interfaceConfigurationCurrent in
            var result = [ToolActionPhaseSlice]()
            
            if interfaceConfigurationCurrent.documentMode != worldConfiguration.documentMode {
                interfaceConfigurationCurrent.documentMode = worldConfiguration.documentMode
                result.append(ToolActionPhaseSliceSetDocumentMode(documentMode: worldConfiguration.documentMode))
            }
            
            // TODO: Edit Mode Here...
            
            switch worldConfiguration.weightModeType {
            case .forceEnter(let weightMode):
                if interfaceConfigurationCurrent.weightMode != weightMode {
                    interfaceConfigurationCurrent.weightMode = weightMode
                    result.append(ToolActionPhaseSliceSetWeightMode(weightMode: weightMode))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.graphType {
            case .forceEnter:
                if interfaceConfigurationCurrent.isGraphEnabled == false {
                    interfaceConfigurationCurrent.isGraphEnabled = true
                    result.append(ToolActionPhaseSliceSetGraphMode(isGraphMode: true))
                }
            case .forceLeave:
                if interfaceConfigurationCurrent.isGraphEnabled == true {
                    interfaceConfigurationCurrent.isGraphEnabled = false
                    result.append(ToolActionPhaseSliceSetGraphMode(isGraphMode: false))
                }
            case .dontCare:
                break
            }
            
            
            if interfaceConfigurationCurrent.isZoomEnabled {
                interfaceConfigurationCurrent.isZoomEnabled = false
                result.append(ToolActionPhaseSliceSetZoomMode(isZoomMode: false))
            }
            
            if interfaceConfigurationCurrent.isVideoRecordEnabled {
                interfaceConfigurationCurrent.isVideoRecordEnabled = false
                result.append(ToolActionPhaseSliceSetVideoRecordMode(isVideoRecordEnabled: false))
            }
            
            if interfaceConfigurationCurrent.isVideoExportEnabled {
                interfaceConfigurationCurrent.isVideoExportEnabled = false
                result.append(ToolActionPhaseSliceSetVideoExportMode(isVideoExportEnabled: false))
            }
            
            if worldConfiguration.isJiggleCenters {
                result.append(ToolActionPhaseSliceSetJiggleCentersEnabled(isJiggleCentersEnabled: true))
            } else {
                result.append(ToolActionPhaseSliceSetJiggleCentersEnabled(isJiggleCentersEnabled: false))
            }
            
            if worldConfiguration.isWeightCenters {
                result.append(ToolActionPhaseSliceSetGuideCentersEnabled(isGuideCentersEnabled: true))
            } else {
                result.append(ToolActionPhaseSliceSetGuideCentersEnabled(isGuideCentersEnabled: false))
            }
            
            /*
            let documentMode: DocumentMode
            let editMode: EditMode
            let weightModeType: WeightModeType
            var graphType: GraphType
            var guidesType: GuidesType
            var phoneExpandedTopType: ExpandedType
            var phoneExpandedBottomType: ExpandedType
            var isJiggleCenters: Bool
            var isWeightCenters: Bool
            */
            
            return result
        } alongsideMeshCommand: {
            [ ]
        }
        
        return toolAction
        
    }
    
}
