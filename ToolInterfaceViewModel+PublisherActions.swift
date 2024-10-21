//
//  ToolInterfaceViewModel+PublisherActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getAllRows() -> [ToolRow] {
        var result = [ToolRow]()
        result.append(contentsOf: rowsZoom)
        result.append(contentsOf: rowsVideoRecord)
        result.append(contentsOf: rowsVideoExport)
        if Device.isPad {
            result.append(contentsOf: rowsDraggable)
        } else {
            result.append(contentsOf: rowsTop)
            result.append(contentsOf: rowsBottom)
        }
        return result
    }
    
    private func refreshAllRows() {
        Task { @MainActor in
            let allRows = getAllRows()
            for row in allRows {
                for node in row.nodes {
                    node.magicalViewModel.refresh()
                }
            }
            
        }
    }
    
    private func refreshAllRowsMatching(elements: [ToolInterfaceElement]) {
        Task { @MainActor in
            var elementSet = Set<ToolInterfaceElement>()
            for element in elements {
                elementSet.insert(element)
            }
            let allRows = getAllRows()
            for row in allRows {
                for node in row.nodes {
                    if elementSet.contains(node.element) {
                        node.magicalViewModel.refresh()
                    }
                }
            }
            
        }
    }
    
    
    func handleTimeLineUpdate() {
        refreshAllRowsMatching(elements: [.sliderTimeLineOffset,
                                          .sliderTimeLineDuration,
                                          .buttonTimeLineDampen,
                                          .buttonTimeLineAmplify,
                                          .buttonTimeLineInvertH,
                                          .buttonTimeLineInvertV,
                                          .buttonTimeLineBreakPoint,
                                          .buttonTimeLineResetCurve,
                                          .buttonTimeLineResetFlatCurrentChannel,
                                          .buttonTimeLineResetDefaultCurrentChannel,
                                          .stepperTimelinePointCount,
        
        ])
        /*
        @MainActor func handleTimeLineUpdate(row: ToolRow) {
            for node in row.nodes {
                if .sliderTimeLineOffset,
                    .sliderTimeLineDuration,
                    .buttonTimeLineDampen,
                    .buttonTimeLineAmplify,
                    .buttonTimeLineInvertH,
                    .buttonTimeLineInvertV,
                    .buttonTimeLineBreakPoint,
                    .buttonTimeLineResetCurve,
                    .buttonTimeLineResetFlatCurrentChannel,
                    .buttonTimeLineResetDefaultCurrentChannel,
                    .stepperTimelinePointCount {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleTimeLineUpdate(row: row) }
        }
        */
    }
    
    func handleSelectedTimeLineSwatchDidChange() {
        refreshAllRowsMatching(elements: [.sliderTimeLineOffset,
        
        ])
        /*
        @MainActor func handleSelectedJiggleDidChange(row: ToolRow) {
            for node in row.nodes {
                if .sliderTimeLineOffset
                {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleSelectedJiggleDidChange(row: row) }
        }
        */
    }
    
    func handleSelectedJiggleDidChange() {
        
        refreshAllRowsMatching(elements: [
            .sliderJigglePower,
            .sliderJiggleSpeed,
            .sliderJiggleDampen,
            
                
            .enterModeZoom,
            .enterModeGraph,
            .enterModeGuides,
            
            .createSwatchMakeAndDrawJiggle,
            .createSwatchMakeAndDrawGuide,
            .createSwatchAddAndRemoveJigglePoints,
            .createSwatchAddAndRemoveGuidePoints,
            
            .stepperTimelinePointCount,
            .stepperGemCount,
            .stepperCoinCount,
            
            .buttonSelectNextJiggle,
            .buttonSelectPreviousJiggle,
            .buttonSelectNextGuide,
            .buttonSelectPreviousGuide,
            
            .buttonFlipJiggleH,
            .buttonFlipJiggleV,
            .buttonRotateJiggleLeft,
            .buttonRotateJiggleRight,
            
            .buttonFlipGuideH,
            .buttonFlipGuideV,
            .buttonRotateGuideLeft,
            .buttonRotateGuideRight,
            
            .buttonFreezeSelectedJiggle,
            .buttonFreezeSelectedGuide,
            .buttonUnfreezeAllJiggles,
            .buttonUnfreezeAllGuides,
            
            .buttonCloneJiggle,
            .buttonDeleteJiggle,
            .buttonCloneGuide,
            .buttonDeleteGuide,
            
            .buttonDeleteJigglePoint,
            .buttonDeleteJigglePoint,
            
            .buttonZoomJiggle
        ])
    }
    
    func handleTimelinePointCountDidChange() {
        refreshAllRowsMatching(elements: [.stepperTimelinePointCount,
                                          
        ])
    }
    
    func handleZoomEnabledDidChange() {
        refreshAllRowsMatching(elements: [
                                          
        ])
    }
    
    func handleRecordingEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
                                          
        ])
    }
    
    func handleResetZoomActiveDidChange() {
        refreshAllRowsMatching(elements: [
            
                                          
        ])
        /*
        @MainActor func handleResetZoomActiveDidChange(row: ToolRow) {
            for node in row.nodes {
                //if .OLDcheckBoxZoomEnabled {
                //    node.magicalViewModel.refresh()
                //}
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleResetZoomActiveDidChange(row: row) }
        }
        */
    }
    
    func handleWeightCurveGraphEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
                                          
        ])
        /*
        @MainActor func handleWeightCurveGraphEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxWeightCurveGraphEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleWeightCurveGraphEnabledDidChange(row: row) }
        }
        */
    }
    
    func handleGuidesEnabledDidChange() {
        
        /*
        @MainActor func handleGuidesEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleGuidesEnabledDidChange(row: row) }
        }
        */
    }
    
    
    
    
    func handleAnimationLoopsEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            //.checkBoxAutoLoopEnabled,
                                          
                                          
        ])
        /*
        @MainActor func handleAnimationLoopsEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAutoLoopEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleAnimationLoopsEnabledDidChange(row: row) }
        }
        */
    }
    
    func handleAnimationContinuousEnabledDidChange() {
        refreshAllRowsMatching(elements: [
                                          
        ])
        /*
        @MainActor func handleAnimationContinuousEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAutoLoopEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleAnimationContinuousEnabledDidChange(row: row) }
        }
        */
    }
    
    func handleAnimationLoopsPageDidChange() {
        refreshAllRowsMatching(elements: [
            //.checkBoxAutoLoopEnabled
                                          
        ])
        /*
        @MainActor func handleAnimationLoopsPageDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAutoLoopEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleAnimationLoopsPageDidChange(row: row) }
        }
        */
    }
    
    func handleTimeLinePage2DidChange() {
        print("handleTimeLinePage2DidChange()...")
        
    }
    
    
    func handleTimeLineEnabledDidChange() {
        
        /*
        @MainActor func handleTimeLineEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
                
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleTimeLineEnabledDidChange(row: row) }
        }
        */
    }
    
    func handleCreatorModesDidChange() {
        
        //TODO: More, More
        refreshAllRowsMatching(elements: [.buttonRedo,
                                          .buttonRedo,
                                          
                                          .buttonRotateJiggleLeft,
                                          .buttonRotateJiggleRight,
                                          
                                          .createSwatchMakeAndDrawJiggle,
                                          .createSwatchMakeAndDrawGuide,
                                          .createSwatchAddAndRemoveJigglePoints,
                                          .createSwatchAddAndRemoveGuidePoints,
                                          
                                          .checkBoxDarkMode,
                                          
                                          .buttonSelectNextJiggle,
                                          .buttonSelectPreviousJiggle,
                                          .buttonSelectNextGuide,
                                          .buttonSelectPreviousGuide,
                                          
                                        .enterModeGuides,
                                          .enterModeGraph,
                                          .exitModeGuides,
                                          .exitModeGraph,
        ])
        /*
        @MainActor func handleCreatorModesDidChange(row: ToolRow) {
            for node in row.nodes {
                
                if
                {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() {
                handleCreatorModesDidChange(row: row)
            }
        }
        */
    }
    
    func handleJigglesDidChange() {
        //TODO: More, More
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    func handleControlPointsDidChange() {
        refreshAllRowsMatching(elements: [
            .createSwatchAddAndRemoveJigglePoints
        ])
    }
    
    func handleDocumentModeDidChange() {
        refreshAllRowsMatching(elements: [
            .mainTabDocumentMode
        ])
    }
    
    func handleEditModeDidChange() {
        refreshAllRowsMatching(elements: [
            .segmentEditMode
        ])
    }
    
    func handleWeightModeDidChange() {
        refreshAllRowsMatching(elements: [
            .segmentWeightMode
        ])
    }
    
    func handleUndoRedoDidChange() {
        // DONE!
        refreshAllRowsMatching(elements: [.buttonRedo,
                                          .buttonUndo])
    }
    
    func handleDarkModeDidChange() {
        refreshAllRowsMatching(elements: [.checkBoxDarkMode])
    }
    
    func handleFrozenJigglesDidChange() {
        refreshAllRowsMatching(elements: [.buttonFreezeSelectedJiggle,
                                          .buttonFreezeSelectedGuide,
                                          .buttonUnfreezeAllJiggles,
                                          .buttonUnfreezeAllGuides,
                                          .buttonSelectNextJiggle,
                                          .buttonSelectPreviousJiggle,
                                          .buttonSelectNextGuide,
                                          .buttonSelectPreviousGuide,
                                          
                                            .createSwatchMakeAndDrawJiggle,
                                            .createSwatchMakeAndDrawGuide,
                                            .createSwatchAddAndRemoveJigglePoints,
                                            .createSwatchAddAndRemoveGuidePoints,
        
        ])
    }
    
    func handleFrozenGuidesDidChange() {
        refreshAllRowsMatching(elements: [
            .buttonFreezeSelectedGuide,
            .buttonUnfreezeAllGuides,
            .buttonSelectNextGuide,
            .buttonSelectPreviousGuide,
            .createSwatchMakeAndDrawGuide,
            .createSwatchAddAndRemoveGuidePoints,
            
        ])
    }
    
    func handleStereoscopicDidChange() {
        refreshAllRowsMatching(elements: [
            .checkBoxStereoscopicEnabled
        ])
    }
    
    func handleAnimationGrabAppliedToAllDidChange() {
        
        refreshAllRowsMatching(elements: [
            .checkBoxAnimationGrabApplyToAll
        ])
    }
    
    func handleAnimationLoopsAppliedToAllDidChange() {
        refreshAllRowsMatching(elements: [
            .checkBoxAnimationLoopApplyToAll
        ])
        /*
        @MainActor func handleAnimationLoopsAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAnimationLoopApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleAnimationLoopsAppliedToAllDidChange(row: row) }
        }
        */
    }
    
    func handleJiggleSpeedDidChange() {
        refreshAllRowsMatching(elements: [.sliderJiggleSpeed])
    }
    
    func handleJigglePowerDidChange() {
        refreshAllRowsMatching(elements: [.sliderJigglePower])
    }
    
    func handleJiggleDampenDidChange() {
        refreshAllRowsMatching(elements: [.sliderJiggleDampen])
    }
    
}
