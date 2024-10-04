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
            
            switch worldConfiguration.guidesType {
            case .forceEnter:
                if interfaceConfigurationCurrent.isGuidesEnabled == false {
                    interfaceConfigurationCurrent.isGuidesEnabled = true
                    result.append(ToolActionPhaseSliceSetGuidesMode(isGuideMode: true))
                }
            case .forceLeave:
                if interfaceConfigurationCurrent.isGuidesEnabled == true {
                    interfaceConfigurationCurrent.isGuidesEnabled = false
                    result.append(ToolActionPhaseSliceSetGuidesMode(isGuideMode: false))
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
            
            /*
            if worldConfiguration.isJiggleCenters {
                
                if interfaceConfigurationCurrent.creatorMode == .moveJiggleCenter {
                    
                } else if interfaceConfigurationCurrent.creatorMode != .none {
                    result.append(ToolActionPhaseSliceSetCreatorMode(creatorMode: .none))
                }
                
            } else if worldConfiguration.isWeightCenters {
                
                if interfaceConfigurationCurrent.creatorMode == .moveGuideCenter {
                    
                } else if interfaceConfigurationCurrent.creatorMode != .none {
                    result.append(ToolActionPhaseSliceSetCreatorMode(creatorMode: .none))
                }
                
            } else {
                result.append(ToolActionPhaseSliceSetCreatorMode(creatorMode: .none))
            }
            */
            
            return result
            
        } alongsideMeshCommand: {
            [ ]
        }
        
        return toolAction
        
    }
    
}
