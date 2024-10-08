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
                                          .sexyButtonTimeLineDampen,
                                          .sexyButtonTimeLineAmplify,
                                          .sexyButtonTimeLineInvertH,
                                          .sexyButtonTimeLineInvertV,
                                          .sexyButtonTimeLineBreakPoint,
                                          .sexyButtonTimeLineResetCurve,
                                          .sexyButtonTimeLineFlattenCurrentChannel,
                                          .sexyButtonTimeLineResetDefaultCurrentChannel,
                                          .sexyStepperTimelinePointCount,
        
        ])
        /*
        @MainActor func handleTimeLineUpdate(row: ToolRow) {
            for node in row.nodes {
                if .sliderTimeLineOffset,
                    .sliderTimeLineDuration,
                    .sexyButtonTimeLineDampen,
                    .sexyButtonTimeLineAmplify,
                    .sexyButtonTimeLineInvertH,
                    .sexyButtonTimeLineInvertV,
                    .sexyButtonTimeLineBreakPoint,
                    .sexyButtonTimeLineResetCurve,
                    .sexyButtonTimeLineFlattenCurrentChannel,
                    .sexyButtonTimeLineResetDefaultCurrentChannel,
                    .sexyStepperTimelinePointCount {
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
        refreshAllRowsMatching(elements: [.sliderJigglePower,
                                          .sliderJiggleSpeed,
                                          .sliderJiggleDampen,
                                          
                                          .enterModeZoomEnter,
                                          .enterModeGraphEnter,
                                          .enterModeGuidesEnter,
                                          
                                          .createSwatchMakeAndDrawJiggle,
                                          .createSwatchMakeAndDrawGuide,
                                          
                                          .createSwatchAddAndRemoveJigglePoints,
                                          .createSwatchAddAndRemoveGuidePoints,
                                          
                                        .sexyStepperTimelinePointCount,
                                          .sexyStepperGemCount,
                                          .sexyStepperCoinCount,
                                          
                                          .sexyButtonSelectNextJiggle,
                                          .sexyButtonSelectPreviousJiggle,
                                          .sexyButtonSelectNextGuide,
                                          .sexyButtonSelectPreviousGuide,
                                          
                                        .sexyButtonFlipJiggleH,
                                        .sexyButtonFlipJiggleV,
                                        .sexyButtonRotateJiggleLeft,
                                        .sexyButtonRotateJiggleRight,
                                                                      
                                        .sexyButtonFlipGuideH,
                                        .sexyButtonFlipGuideV,
                                        .sexyButtonRotateGuideLeft,
                                        .sexyButtonRotateGuideRight,
                                          
                                            .sexyButtonFreezeSelectedJiggle,
                                          .sexyButtonFreezeSelectedGuide,
                                          .sexyButtonUnfreezeAllJiggles,
                                          .sexyButtonUnfreezeAllGuides,
                                          
                                                                        
                                          
            .sexyButtonZoomJiggle
        
        ])
        /*
        @MainActor func handleSelectedJiggleDidChange(row: ToolRow) {
            for node in row.nodes {
                if .sliderJigglePower,
                    .sliderJiggleSpeed,
                    .sliderJiggleDampen,
                    .textIconButtonFreezeOnSelectedJiggle,
                    .enterModeZoomEnter,
                    .enterModeGraphEnter,
                    .enterModeGuidesEnter,
                    
                    .createSwatchMakeAndDrawJiggle,
                    .createSwatchMakeAndDrawGuide,
                    
                    .createSwatchAddAndRemoveJigglePoints,
                    .createSwatchAddAndRemoveGuidePoints,
                    
                    .sexyStepperTimelinePointCount,
                    
                    .sexyButtonSelectNextJiggle,
                    .sexyButtonSelectPreviousJiggle,
                    .sexyButtonSelectNextGuide,
                    .sexyButtonSelectPreviousGuide
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
    
    func handleTimelinePointCountDidChange() {
        refreshAllRowsMatching(elements: [.sexyStepperTimelinePointCount,
                                          
        ])
        /*
        @MainActor func handleTimelinePointCountDidChange(row: ToolRow) {
            for node in row.nodes {
                if .sexyStepperTimelinePointCount {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            for row in getAllRows() { handleTimelinePointCountDidChange(row: row) }
        }
        */
    }
    
    func handleZoomEnabledDidChange() {
        refreshAllRowsMatching(elements: [
                                          
        ])
        /*
        @MainActor func handleZoomEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxZoomEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        
        Task { @MainActor in
            for row in getAllRows() { handleZoomEnabledDidChange(row: row) }
        }
        */
    }
    
    func handleRecordingEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
                                          
        ])
        /*
        @MainActor func handleRecordingEnabledDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
                
            }
        }
        
        Task { @MainActor in
            for row in getAllRows() { handleRecordingEnabledDidChange(row: row) }
        }
        */
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
        refreshAllRowsMatching(elements: [.sexyCheckBoxAutoLoopEnabled,
                                          
                                          
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
        refreshAllRowsMatching(elements: [.sexyCheckBoxAutoLoopEnabled
                                          
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
        refreshAllRowsMatching(elements: [.sexyButtonRedo,
                                          .sexyButtonRedo,
                                          
                                          .sexyButtonRotateJiggleLeft,
                                          .sexyButtonRotateJiggleRight,
                                          
                                          .createSwatchMakeAndDrawJiggle,
                                          .createSwatchMakeAndDrawGuide,
                                          .createSwatchAddAndRemoveJigglePoints,
                                          .createSwatchAddAndRemoveGuidePoints,
                                          
                                          .sexyCheckBoxDarkMode,
                                          .sexyCheckBoxGuideCenters,
                                          .sexyCheckBoxJiggleCenters,
                                          
                                          .sexyButtonSelectNextJiggle,
                                          .sexyButtonSelectPreviousJiggle,
                                          .sexyButtonSelectNextGuide,
                                          .sexyButtonSelectPreviousGuide
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
        /*
        @MainActor func handleJigglesDidChange(row: ToolRow) {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleJigglesDidChange(row: row) }
        }
        */
    }
    
    func handleControlPointsDidChange() {
        
        refreshAllRowsMatching(elements: [.createSwatchAddAndRemoveJigglePoints
            
        ])
        
        /*
        @MainActor func handleControlPointsDidChange(row: ToolRow) {
            for node in row.nodes {
                if .createSwatchAddAndRemoveJigglePoints {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleControlPointsDidChange(row: row) }
        }
        */
    }
    
    func handleDocumentModeDidChange() {
        refreshAllRowsMatching(elements: [.mainTabDocumentMode
            
        ])
        
        /*
        @MainActor func handleDocumentModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if .mainTabDocumentMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleDocumentModeDidChange(row: row) }
        }
        */
    }
    
    func handleEditModeDidChange() {
        refreshAllRowsMatching(elements: [.segmentEditMode
            
        ])
        /*
        @MainActor func handleEditModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if .segmentEditMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleEditModeDidChange(row: row) }
        }
        */
    }
    
    func handleWeightModeDidChange() {
        refreshAllRowsMatching(elements: [.segmentWeightMode
            
        ])
        /*
        @MainActor func handleWeightModeDidChange(row: ToolRow) {
            for node in row.nodes {
                if .segmentWeightMode {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleWeightModeDidChange(row: row) }
        }
        */
    }
    
    func handleUndoRedoDidChange() {
        // DONE!
        refreshAllRowsMatching(elements: [.sexyButtonRedo,
                                          .sexyButtonUndo])
    }
    
    func handleDarkModeDidChange() {
        refreshAllRowsMatching(elements: [.sexyCheckBoxDarkMode])
    }
    
    func handleFrozenJigglesDidChange() {
        refreshAllRowsMatching(elements: [.sexyButtonFreezeSelectedJiggle,
                                          .sexyButtonFreezeSelectedGuide,
                                          .sexyButtonUnfreezeAllJiggles,
                                          .sexyButtonUnfreezeAllGuides,
                                          .sexyButtonSelectNextJiggle,
                                          .sexyButtonSelectPreviousJiggle,
                                          .sexyButtonSelectNextGuide,
                                          .sexyButtonSelectPreviousGuide])
    }
    
    func handleFrozenGuidesDidChange() {
        refreshAllRowsMatching(elements: [.sexyButtonFreezeSelectedGuide,
                                          .sexyButtonUnfreezeAllGuides,
                                          .sexyButtonSelectNextGuide,
                                          .sexyButtonSelectPreviousGuide])
    }
    
    func handleSwivelOrbitDidChange() {
        /*
        @MainActor func handleSwivelOrbitDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxSwivelOrbitEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleSwivelOrbitDidChange(row: row) }
            
        }
        */
    }
    
    func handleStereoscopicDidChange() {
        /*
        @MainActor func handleStereoscopicDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxStereoscopicEnabled {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleStereoscopicDidChange(row: row) }
        }
        */
    }
    
    func handleAnimationJiggleAppliedToAllDidChange() {
        
        refreshAllRowsMatching(elements: [.sexyCheckBoxAnimationJiggleApplyToAll])
        /*
        @MainActor func handleAnimationJiggleAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAnimationJiggleApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleAnimationJiggleAppliedToAllDidChange(row: row) }
        }
        */
    }
    
    func handleAnimationBounceAppliedToAllDidChange() {
        refreshAllRowsMatching(elements: [.sexyCheckBoxAnimationBounceApplyToAll])
        /*
        @MainActor func handleAnimationBounceAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAnimationBounceApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleAnimationBounceAppliedToAllDidChange(row: row) }
        }
        */
    }
    
    func handleAnimationWobbleAppliedToAllDidChange() {
        refreshAllRowsMatching(elements: [.sexyCheckBoxAnimationWobbleApplyToAll])
        /*
        @MainActor func handleAnimationWobbleAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if .checkBoxAnimationWobbleApplyToAll {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleAnimationWobbleAppliedToAllDidChange(row: row) }
        }
        */
    }
    
    func handleAnimationTwistAppliedToAllDidChange() {
        refreshAllRowsMatching(elements: [.sexyCheckBoxAnimationTwistApplyToAll])
        /*
        @MainActor func handleAnimationTwistAppliedToAllDidChange(row: ToolRow) {
            for node in row.nodes {
                if . {
                    node.magicalViewModel.refresh()
                }
            }
        }
        Task { @MainActor in
            
            for row in getAllRows() { handleAnimationTwistAppliedToAllDidChange(row: row) }
        }
        */
    }
    
    func handleJiggleSpeedDidChange() {
        refreshAllRowsMatching(elements: [.sliderJiggleSpeed])
    }
    
    func handleJigglePowerDidChange() {
        refreshAllRowsMatching(elements: [.sliderJigglePower])
    }
}
