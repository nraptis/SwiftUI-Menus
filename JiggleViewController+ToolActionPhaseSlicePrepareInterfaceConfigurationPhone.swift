//
//  JiggleViewController+ToolActionPhaseSlicePrepareInterfaceConfigurationPhone.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import UIKit

extension JiggleViewController {
    
    func toolActionConsumePhaseSlicePrepareInterfaceConfigurationPhone(_ slice: ToolActionPhaseSlicePrepareInterfaceConfigurationPhone) {
        
        let configurationPrevious = slice.interfaceConfigurationPrevious
        let configurationCurrent = slice.interfaceConfigurationCurrent
        
        let isReversed = configurationPrevious.isRightOf(configurationCurrent)
        
        let primaryAction = InterfaceConfigurationPhone.getPrimaryAction(previousConfiguration: configurationPrevious,
                                                                         previousExpanded: configurationPrevious.isExpandedTop,
                                                                         currentConfiguration: configurationCurrent,
                                                                         currentExpanded: configurationCurrent.isExpandedTop)
        let secondaryAction = InterfaceConfigurationPhone.getSecondaryAction(previousConfiguration: configurationPrevious,
                                                                             previousExpanded: configurationPrevious.isExpandedTop,
                                                                             currentConfiguration: configurationCurrent,
                                                                             currentExpanded: configurationCurrent.isExpandedTop)
        phoneTopMenu.handle_Step1(actionPrimary: primaryAction,
                                  actionSecondary: secondaryAction,
                                  configuration: configurationCurrent,
                                  reversed: isReversed)
        
        phoneBottomMenu.handle_Step1(action: secondaryAction,
                                     configuration: configurationCurrent,
                                     reversed: isReversed)
        
        if (configurationCurrent.isGuides == true) && (configurationCurrent.isGraphEnabled == true) {
            jiggleViewModel.graphUpdateRelay()
        }
    }
}
