//
//  JiggleViewController+ToolActionPhaseSliceHistoryUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

extension JiggleViewController {
    
    @MainActor func toolActionConsumePhaseSliceSetAnimationContinuousMode(_ slice: ToolActionPhaseSliceSetAnimationContinuousMode) {
        jiggleViewModel.jiggleDocument.isAnimationContinuousEnabled = slice.isAnimationContinuousMode
        toolInterfaceViewModel.handleAnimationContinuousEnabledDidChange()
        jiggleViewModel.handleAnimationModeDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetTimeLineMode(_ slice: ToolActionPhaseSliceSetTimeLineMode) {
        jiggleViewModel.jiggleDocument.isTimeLineEnabled = slice.isTimeLineMode
        if slice.isTimeLineMode {
            jiggleViewModel.refreshAllTimeLines()
        }
        toolInterfaceViewModel.handleTimeLineEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetGuidesMode(_ slice: ToolActionPhaseSliceSetGuidesMode) {
        jiggleViewModel.jiggleDocument.isGuidesEnabled = slice.isGuideMode
        toolInterfaceViewModel.handleGuidesEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetAnimationLoopsMode(_ slice: ToolActionPhaseSliceSetAnimationLoopsMode) {
        jiggleViewModel.jiggleDocument.isAnimationLoopsEnabled = slice.isAnimationLoopsMode
        toolInterfaceViewModel.handleAnimationLoopsEnabledDidChange()
        jiggleViewModel.handleAnimationModeDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceHistoryUndo(_ slice: ToolActionPhaseSliceApplyHistoryUndo) {
        executeHistoryStateUndo(slice.historyState)
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceHistoryRedo(_ slice: ToolActionPhaseSliceApplyHistoryRedo) {
        executeHistoryStateRedo(slice.historyState)
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetGraphMode(_ slice: ToolActionPhaseSliceSetGraphMode) {
        jiggleViewModel.isGraphEnabled = slice.isGraphMode
        toolInterfaceViewModel.handleWeightCurveGraphEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetZoomMode(_ slice: ToolActionPhaseSliceSetZoomMode) {
        jiggleViewModel.isZoomEnabled = slice.isZoomMode
        toolInterfaceViewModel.handleZoomEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetVideoExportMode(_ slice: ToolActionPhaseSliceSetVideoExportMode) {
        jiggleViewModel.isVideoExportEnabled = slice.isVideoExportEnabled
        toolInterfaceViewModel.handleVideoExportEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetVideoRecordMode(_ slice: ToolActionPhaseSliceSetVideoRecordMode) {
        jiggleViewModel.isVideoRecordEnabled = slice.isVideoRecordEnabled
        toolInterfaceViewModel.handleVideoRecordEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetExpandedDraggable(_ slice: ToolActionPhaseSliceSetExpandedDraggable) {
        jiggleViewModel.isPadMenuExpanded = slice.isExpanded
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetExpandedPhoneTop(_ slice: ToolActionPhaseSliceSetExpandedPhoneTop) {
        jiggleViewModel.isPhoneTopMenuExpanded = slice.isExpanded
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetExpandedPhoneBottom(_ slice: ToolActionPhaseSliceSetExpandedPhoneBottom) {
        jiggleViewModel.isPhoneBottomMenuExpanded = slice.isExpanded
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetLoopsPage(_ slice: ToolActionPhaseSliceSetLoopsPage) {
        jiggleViewModel.jiggleDocument.animationLoopsPage = slice.animationLoopsPage
        toolInterfaceViewModel.handleLoopsPageDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetTimeLinePage(_ slice: ToolActionPhaseSliceSetTimeLinePage) {
        jiggleViewModel.jiggleDocument.animationTimeLinePage = slice.animationTimeLinePage
        toolInterfaceViewModel.handleTimeLinePageDidChange()
        jiggleViewModel.killDragAll()
    }
   
    @MainActor func toolActionConsumePhaseSliceSetContinuousPage(_ slice: ToolActionPhaseSliceSetContinuousPage) {
        jiggleViewModel.jiggleDocument.animationContinuousPage = slice.animationContinuousPage
        toolInterfaceViewModel.handleContinuousPageDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetGraphPage(_ slice: ToolActionPhaseSliceSetGraphPage) {
        jiggleViewModel.jiggleDocument.graphPage = slice.graphPage
        toolInterfaceViewModel.handleGraphPageDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetCreatorMode(_ slice: ToolActionPhaseSliceSetCreatorMode) {
        jiggleViewModel.setCreatorMode(slice.creatorMode)
        toolInterfaceViewModel.handleCreatorModesDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceDisableAllCreateModes(_ slice: ToolActionPhaseSliceDisableAllCreateModes) {
        jiggleViewModel.setCreatorMode(.none)
        toolInterfaceViewModel.handleCreatorModesDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceJiggleMeshCommandOneJiggle(_ slice: ToolActionPhaseSliceJiggleMeshCommandOneJiggle) {
        jiggleViewModel.applyMeshCommandOneJiggle(meshCommand: slice.meshCommand,
                                                  guideCommand: slice.guideCommand,
                                                  jiggle: slice.jiggle)
    }
    
    @MainActor func toolActionConsumePhaseSliceJiggleMeshCommandAllJiggles(_ slice: ToolActionPhaseSliceJiggleMeshCommandAllJiggles) {
        jiggleViewModel.applyMeshCommandAllJiggles(meshCommand: slice.meshCommand,
                                                   guideCommand: slice.guideCommand)
    }
    
    @MainActor func toolActionConsumePhaseSliceLockState(_ slice: ToolActionPhaseSliceLockState) {
        jiggleViewModel.lockShowingState()
    }
    
    @MainActor func toolActionConsumePhaseSliceUnlockState(_ slice: ToolActionPhaseSliceUnlockState) {
        jiggleViewModel.unlockShowingState()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetDocumentMode(_ slice: ToolActionPhaseSliceSetDocumentMode) {
        jiggleViewModel.jiggleDocument.documentMode = slice.documentMode
        jiggleViewModel.handleDocumentModeDidChange()
        toolInterfaceViewModel.handleDocumentModeDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetEditMode(_ slice: ToolActionPhaseSliceSetEditMode) {
        jiggleViewModel.jiggleDocument.editMode = slice.editMode
        jiggleViewModel.handleEditModeDidChange()
        toolInterfaceViewModel.handleEditModeDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetWeightMode(_ slice: ToolActionPhaseSliceSetWeightMode) {
        jiggleViewModel.jiggleDocument.weightMode = slice.weightMode
        toolInterfaceViewModel.handleWeightModeDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetRenderingMode(_ slice: ToolActionPhaseSliceSetRenderingMode) {
        jiggleViewModel.isRenderingRegular = slice.isRenderingRegularMode
        jiggleViewModel.isRenderingSwivel = slice.isRenderingSwivelMode
    }
    
    @MainActor func toolActionConsumePhaseSliceSetStereoscopicMode(_ slice: ToolActionPhaseSliceSetStereoscopicMode) {
        jiggleViewModel.isStereoscopicEnabled = slice.isStereoscopicMode
        toolInterfaceViewModel.handleStereoscopicDidChange()
        jiggleViewModel.killDragAll()
    }
    
    @MainActor func toolActionConsumePhaseSliceSetDarkModeEnabled(_ slice: ToolActionPhaseSliceSetDarkModeEnabled) {
        ApplicationController.isDarkModeEnabled = slice.isDarkModeEnabled
        
        // Move to brickmode
        toolInterfaceViewModel.handleDarkModeDidChange()
        handleDarkModeDidChange()
        
        ApplicationController.shared.configSave()
        jiggleViewModel.killDragAll()
        
    }
    
    @MainActor func toolActionConsumePhaseSliceSetPurchasedEnabled(_ slice: ToolActionPhaseSliceSetPurchasedEnabled) {
        ApplicationController.isPurchased = slice.isPurchased
        
        print("$$$$ #### $$$$ #### $$$$")
        print("$$$$ ==> \(ApplicationController.isPurchased)")
        print("$$$$ #### $$$$ #### $$$$")
        
        handlePurchasedDidChange()
        
        ApplicationController.shared.configSave()
        jiggleViewModel.killDragAll()
        
    }
    
    @MainActor func toolActionConsumePhaseSliceAnyClosure(_ slice: ToolActionPhaseSliceAnyClosure) {
        if let code = slice.code {
            code()
        }
    }
}
