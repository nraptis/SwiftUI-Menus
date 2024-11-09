//
//  JiggleViewController+ToolActionPhaseSlicePrepareInterfaceConfigurationPad.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/10/24.
//

import UIKit

extension JiggleViewController {
    
    //
    // It's expected that all the stuff is going to
    // be correctly assigned after this functon finished..
    //
    @MainActor func toolActionConsumePhaseSlicePrepareInterfaceConfigurationPad(_ slice: ToolActionPhaseSlicePrepareInterfaceConfigurationPad) {
        let configurationPrevious = slice.interfaceConfigurationPrevious
        let configurationCurrent = slice.interfaceConfigurationCurrent
        let isReversed = configurationPrevious.isRightOf(configurationCurrent)
        let primaryAction = InterfaceConfigurationPad.getPrimaryAction(previousConfiguration: configurationPrevious,
                                                                       previousExpanded: configurationPrevious.isExpanded,
                                                                       currentConfiguration: configurationCurrent,
                                                                       currentExpanded: configurationCurrent.isExpanded)
        
        let secondaryAction = InterfaceConfigurationPad.getSecondaryAction(previousConfiguration: configurationPrevious,
                                                                             previousExpanded: configurationPrevious.isExpandedTop,
                                                                             currentConfiguration: configurationCurrent,
                                                                             currentExpanded: configurationCurrent.isExpandedTop)
        
        padDraggableMenu.handle_Step1(actionPrimary: primaryAction,
                                      actionSecondary: secondaryAction,
                                      configuration: configurationCurrent,
                                      reversed: isReversed)
        
        if (configurationCurrent.isGuides == true) && (configurationCurrent.isGraphEnabled == true) {
            jiggleViewModel.graphUpdateRelay()
        }
        
    }
}
