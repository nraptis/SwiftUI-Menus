//
//  JiggleViewController+ToolActionPhaseSliceUpdateInterfaceConfigurationPad.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

extension JiggleViewController {
    
    // It's expected that all the stuff is going to
    // be correctly assigned after this functom..
    func toolActionConsumePhaseSliceUpdateInterfaceConfigurationPad(_ slice: ToolActionPhaseSliceUpdateInterfaceConfigurationPad) {
        
        let configurationPrevious = slice.interfaceConfigurationPrevious
        let configurationCurrent = slice.interfaceConfigurationCurrent
        
        func getDisplayFrame(configuration: any InterfaceConfigurationConforming) -> DisplayFrame {
            let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
            let safeAreaRight = Int(ApplicationController.rootViewController.view.safeAreaInsets.right + 0.5)
            let safeAreaTop = Int(ApplicationController.rootViewController.view.safeAreaInsets.top + 0.5)
            let safeAreaBottom = Int(ApplicationController.rootViewController.view.safeAreaInsets.bottom + 0.5)
            let orientation = toolInterfaceViewModel.orientation
            return DisplayFrame.with(configuration: configuration, orientation: orientation,
                                     safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                                     safeAreaTop: safeAreaTop, safeAreaBottom: safeAreaBottom,
                                     phoneMenuCollapseOffset: 0)
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
                                          previousDocumentMode: configurationPrevious.documentMode,
                                          currentDocumentMode: configurationCurrent.documentMode,
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
        
        
        if configurationPrevious.isExpanded != configurationCurrent.isExpanded {
            snapMenuExpandedPad(configuration: configurationCurrent, snapMenus: false)
        } else if configurationPrevious.heightCategory != configurationCurrent.heightCategory {
            if (configurationPrevious.isExpanded == true) && (configurationPrevious.isExpanded == true) {
                animateMenuExpandedPad(configurationPrevious: configurationPrevious,
                                       configurationCurrent: configurationCurrent,
                                       snapMenus: false,
                                       time: slice.time)
            }
        }
        
        let primaryAction = InterfaceConfigurationPad.getPrimaryAction(previousConfiguration: configurationPrevious,
                                                                       previousExpanded: configurationPrevious.isExpanded,
                                                                       currentConfiguration: configurationCurrent,
                                                                       currentExpanded: configurationCurrent.isExpanded)
        
        let secondaryAction = InterfaceConfigurationPad.getSecondaryAction(previousConfiguration: configurationPrevious,
                                                                           previousExpanded: configurationPrevious.isExpandedTop,
                                                                           currentConfiguration: configurationCurrent,
                                                                           currentExpanded: configurationCurrent.isExpandedTop)
        
        padDraggableMenu.handle_Step2(actionPrimary: primaryAction,
                                      actionSecondary: secondaryAction,
                                      configuration: configurationCurrent,
                                      reversed: isReversed,
                                      time: time)
    }
    
}
