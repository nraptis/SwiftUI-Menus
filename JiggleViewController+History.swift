//
//  JiggleViewController+History.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/12/24.
//

import Foundation

extension JiggleViewController {
    
    func getHistoryInterfaceToolAction(_ historyState: HistoryState) -> ToolAction {
        let worldConfiguration = historyState.getWorldConfiguration()
        
        
        let toolAction = batchInterfaceAction(disableCreatorModes: true,
                                              changeCommand: { configuration in
            
            var result = [ToolActionPhaseSlice]()
            
            if configuration.documentMode != worldConfiguration.documentMode {
                configuration.documentMode = worldConfiguration.documentMode
                result.append(ToolActionPhaseSliceSetDocumentMode(documentMode: worldConfiguration.documentMode))
            }
            
            switch worldConfiguration.timeLineType {
            case .forceEnter:
                if configuration.isTimeLineEnabled != true {
                    configuration.isTimeLineEnabled = true
                    result.append(ToolActionPhaseSliceSetTimeLineMode(isTimeLineMode: true))
                }
            case .forceLeave:
                if configuration.isTimeLineEnabled != false {
                    configuration.isTimeLineEnabled = false
                    result.append(ToolActionPhaseSliceSetTimeLineMode(isTimeLineMode: false))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.animationContinuousType {
            case .forceEnter:
                if configuration.isAnimationContinuousEnabled != true {
                    configuration.isAnimationContinuousEnabled = true
                    result.append(ToolActionPhaseSliceSetAnimationContinuousMode(isAnimationContinuousMode: true))
                }
            case .forceLeave:
                if configuration.isAnimationContinuousEnabled != false {
                    configuration.isAnimationContinuousEnabled = false
                    result.append(ToolActionPhaseSliceSetAnimationContinuousMode(isAnimationContinuousMode: false))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.animationLoopType {
            case .forceEnter:
                if configuration.isAnimationLoopsEnabled != true {
                    configuration.isAnimationLoopsEnabled = true
                    result.append(ToolActionPhaseSliceSetAnimationLoopsMode(isAnimationLoopsMode: true))
                }
            case .forceLeave:
                if configuration.isAnimationLoopsEnabled != false {
                    configuration.isAnimationLoopsEnabled = false
                    result.append(ToolActionPhaseSliceSetAnimationLoopsMode(isAnimationLoopsMode: false))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.editModeType {
            case .forceEnter(let editMode):
                if configuration.editMode != editMode {
                    configuration.editMode = editMode
                    result.append(ToolActionPhaseSliceSetEditMode(editMode: editMode))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.weightModeType {
            case .forceEnter(let weightMode):
                if configuration.weightMode != weightMode {
                    configuration.weightMode = weightMode
                    result.append(ToolActionPhaseSliceSetWeightMode(weightMode: weightMode))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.graphType {
            case .forceEnter:
                if configuration.isGraphEnabled == false {
                    configuration.isGraphEnabled = true
                    result.append(ToolActionPhaseSliceSetGraphMode(isGraphMode: true))
                }
            case .forceLeave:
                if configuration.isGraphEnabled == true {
                    configuration.isGraphEnabled = false
                    result.append(ToolActionPhaseSliceSetGraphMode(isGraphMode: false))
                }
            case .dontCare:
                break
            }
            
            switch worldConfiguration.guidesType {
            case .forceEnter:
                if configuration.isGuidesEnabled == false {
                    configuration.isGuidesEnabled = true
                    result.append(ToolActionPhaseSliceSetGuidesMode(isGuideMode: true))
                }
            case .forceLeave:
                if configuration.isGuidesEnabled == true {
                    configuration.isGuidesEnabled = false
                    result.append(ToolActionPhaseSliceSetGuidesMode(isGuideMode: false))
                }
            case .dontCare:
                break
            }
            
            
            if configuration.isZoomEnabled {
                configuration.isZoomEnabled = false
                result.append(ToolActionPhaseSliceSetZoomMode(isZoomMode: false))
            }
            
            if configuration.isVideoRecordEnabled {
                configuration.isVideoRecordEnabled = false
                result.append(ToolActionPhaseSliceSetVideoRecordMode(isVideoRecordEnabled: false))
            }
            
            if configuration.isVideoExportEnabled {
                configuration.isVideoExportEnabled = false
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
            
        }, alongsideMeshCommand: {
            [ ]
        })
        
        return toolAction
        
    }
    
}
