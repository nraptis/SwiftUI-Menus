//
//  JiggleViewController+ToolActionPhaseSliceUpdateInterfaceConfigurationPhone.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

extension JiggleViewController {
    
    func toolActionConsumePhaseSliceUpdateInterfaceConfigurationPhone(_ slice: ToolActionPhaseSliceUpdateInterfaceConfigurationPhone) {
        
        let configurationPrevious = slice.interfaceConfigurationPrevious
        let configurationCurrent = slice.interfaceConfigurationCurrent
        
        func getDisplayFrame(configuration: any InterfaceConfigurationConforming) -> DisplayFrame {
            let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(ApplicationController.rootViewController.view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(ApplicationController.rootViewController.view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(ApplicationController.rootViewController.view.safeAreaInsets.bottom + 0.5)
            let phoneMenuCollapseOffset = Self.phoneMenuCollapseOffset
            let orientation = toolInterfaceViewModel.orientation
            return DisplayFrame.with(configuration: configuration, orientation: orientation,
                                     safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                                     safeAreaTop: safeAreaTop, safeAreaBottom: safeAreaBottom,
                                     phoneMenuCollapseOffset: phoneMenuCollapseOffset)
        }
        
        let displayFramePrevious = getDisplayFrame(configuration: configurationPrevious)
        let displayFrameCurrent = getDisplayFrame(configuration: configurationCurrent)
        
        let isReversed = configurationPrevious.isRightOf(configurationCurrent)
        let time = slice.time
        
        if (displayFramePrevious != displayFrameCurrent) || (configurationPrevious.displayMode != configurationCurrent.displayMode) {
            
            let stackingCategory = JiggleViewModel.DisplayStackingCategory.horizontal
            jiggleScene.displayTransition(time: Float(time),
                                          previousDisplayMode: configurationPrevious.displayMode,
                                          currentDisplayMode: configurationCurrent.displayMode,
                                          stackingCategory: stackingCategory,
                                          clipFrameX: Float(displayFrameCurrent.clipFrameX),
                                          clipFrameY: Float(displayFrameCurrent.clipFrameY),
                                          clipFrameWidth: Float(displayFrameCurrent.clipFrameWidth),
                                          clipFrameHeight: Float(displayFrameCurrent.clipFrameHeight),
                                          previousContentFrameX: Float(displayFramePrevious.contentFrameX),
                                          previousContentFrameY: Float(displayFramePrevious.contentFrameY),
                                          previousContentFrameWidth: Float(displayFramePrevious.contentFrameWidth),
                                          previousContentFrameHeight: Float(displayFramePrevious.contentFrameHeight),
                                          contentFrameX: Float(displayFrameCurrent.contentFrameX),
                                          contentFrameY: Float(displayFrameCurrent.contentFrameY),
                                          contentFrameWidth: Float(displayFrameCurrent.contentFrameWidth),
                                          contentFrameHeight: Float(displayFrameCurrent.contentFrameHeight)) {
            }
        }
        
        if (configurationPrevious.isExpandedTop != configurationCurrent.isExpandedTop) ||
            (configurationPrevious.isExpandedBottom != configurationCurrent.isExpandedBottom) ||
            (configurationPrevious.heightCategoryTop != configurationCurrent.heightCategoryTop) ||
            (configurationPrevious.heightCategoryBottom != configurationCurrent.heightCategoryBottom) {
            
            animateMenuExpandedPhone(configurationPrevious: configurationPrevious,
                                     configurationCurrent: configurationCurrent,
                                     snapMenus: false,
                                     time: slice.time)
        }
        
        let primaryAction = InterfaceConfigurationPhone.getPrimaryAction(previousConfiguration: configurationPrevious,
                                                                         previousExpanded: configurationPrevious.isExpandedTop,
                                                                         currentConfiguration: configurationCurrent,
                                                                         currentExpanded: configurationCurrent.isExpandedTop)
        
        let secondaryAction = InterfaceConfigurationPhone.getSecondaryAction(previousConfiguration: configurationPrevious,
                                                                             previousExpanded: configurationPrevious.isExpandedTop,
                                                                             currentConfiguration: configurationCurrent,
                                                                             currentExpanded: configurationCurrent.isExpandedTop)
        
        phoneTopMenu.handle_Step2(actionPrimary: primaryAction,
                                  actionSecondary: secondaryAction,
                                  configuration: configurationCurrent,
                                  reversed: isReversed,
                                  time: time)
        
        phoneBottomMenu.handle_Step2(action: secondaryAction,
                                     configuration: configurationCurrent,
                                     reversed: isReversed,
                                     time: time)
    }
}


