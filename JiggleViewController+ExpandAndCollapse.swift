//
//  JiggleViewController+ExpandAndCollapse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/4/24.
//

import UIKit

extension JiggleViewController {
    
    func toolActionPhoneToggleTopMenu() {
        if jiggleViewModel.isPhoneTopMenuExpanded {
            toolActionPhoneCollapseTopMenu()
        } else {
            toolActionPhoneExpandTopMenu()
        }
    }
    
    func toolActionPhoneToggleBottomMenu() {
        if jiggleViewModel.isPhoneBottomMenuExpanded {
            toolActionPhoneCollapseBottomMenu()
        } else {
            toolActionPhoneExpandBottomMenu()
        }
    }
    
    func toolActionPhoneExpandTopMenu() {
        
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        
        if jiggleViewModel.isPhoneTopMenuExpanded == false {
            let interfaceConfigurationPrevious = toolInterfaceViewModel.getCurrentInterfaceConfigurationPhone()
            var interfaceConfigurationCurrent = interfaceConfigurationPrevious
            interfaceConfigurationCurrent.isExpandedTop = true
            
            let time = Self.getExpandCollapseAnimationTime(orientation: jiggleDocument.orientation)
            
            let phaseSliceModify = ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: true)
            let phaseSliceInterface = ToolActionPhaseSliceUpdateInterfaceConfigurationPhone(interfaceConfigurationPrevious: interfaceConfigurationPrevious,
                                                                                       interfaceConfigurationCurrent: interfaceConfigurationCurrent)
            let phase = ToolActionPhase(slices: [phaseSliceModify, phaseSliceInterface],
                                        time: time)
            let toolAction = ToolAction(phase: phase)
            toolActionPerform(toolAction)
        }
    }
    
    func toolActionPhoneCollapseTopMenu() {
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        
        if jiggleViewModel.isPhoneTopMenuExpanded == true {
            let interfaceConfigurationPrevious = toolInterfaceViewModel.getCurrentInterfaceConfigurationPhone()
            var interfaceConfigurationCurrent = interfaceConfigurationPrevious
            interfaceConfigurationCurrent.isExpandedTop = false
            let time = Self.getExpandCollapseAnimationTime(orientation: jiggleDocument.orientation)
            
            let phaseSliceModify = ToolActionPhaseSliceSetExpandedPhoneTop(isExpanded: false)
            let phaseSliceInterface = ToolActionPhaseSliceUpdateInterfaceConfigurationPhone(interfaceConfigurationPrevious: interfaceConfigurationPrevious,
                                                                                       interfaceConfigurationCurrent: interfaceConfigurationCurrent)
            let phase = ToolActionPhase(slices: [phaseSliceModify, phaseSliceInterface],
                                        time: time)
            let toolAction = ToolAction(phase: phase)
            toolActionPerform(toolAction)
        }
    }
    
    func toolActionPhoneExpandBottomMenu() {
        
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        
        if jiggleViewModel.isPhoneBottomMenuExpanded == false {
            let interfaceConfigurationPrevious = toolInterfaceViewModel.getCurrentInterfaceConfigurationPhone()
            var interfaceConfigurationCurrent = interfaceConfigurationPrevious
            interfaceConfigurationCurrent.isExpandedBottom = true
            
            let time = Self.getExpandCollapseAnimationTime(orientation: jiggleDocument.orientation)
            
            let phaseSliceModify = ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: true)
            let phaseSliceInterface = ToolActionPhaseSliceUpdateInterfaceConfigurationPhone(interfaceConfigurationPrevious: interfaceConfigurationPrevious,
                                                                                       interfaceConfigurationCurrent: interfaceConfigurationCurrent)
            let phase = ToolActionPhase(slices: [phaseSliceModify, phaseSliceInterface],
                                        time: time)
            let toolAction = ToolAction(phase: phase)
            toolActionPerform(toolAction)
        }
    }
    
    func toolActionPhoneCollapseBottomMenu() {
        if toolInterfaceViewModel.isBlocked { return }
        if Device.isPad { return }
        
        if jiggleViewModel.isPhoneBottomMenuExpanded == true {
            let interfaceConfigurationPrevious = toolInterfaceViewModel.getCurrentInterfaceConfigurationPhone()
            var interfaceConfigurationCurrent = interfaceConfigurationPrevious
            interfaceConfigurationCurrent.isExpandedBottom = false
            
            let time = Self.getExpandCollapseAnimationTime(orientation: jiggleDocument.orientation)
            
            let phaseSliceModify = ToolActionPhaseSliceSetExpandedPhoneBottom(isExpanded: false)
            let phaseSliceInterface = ToolActionPhaseSliceUpdateInterfaceConfigurationPhone(interfaceConfigurationPrevious: interfaceConfigurationPrevious,
                                                                                       interfaceConfigurationCurrent: interfaceConfigurationCurrent)
            let phase = ToolActionPhase(slices: [phaseSliceModify, phaseSliceInterface],
                                        time: time)
            let toolAction = ToolAction(phase: phase)
            toolActionPerform(toolAction)
        }
    }
    
}
