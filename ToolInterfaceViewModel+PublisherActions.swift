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
    
    private func getAllCommonElements() -> [ToolInterfaceElement] {
        return [
                .buttonMenu,
                .checkBoxDarkMode,
                .checkBoxPurchasedEnabled,
                .mainTabDocumentMode,
                .buttonUndo,
                .buttonRedo,
                .enterModeVideoRecord,
                .enterModeVideoExport,
                .enterModeZoom,
                .exitModeVideoRecord,
                .exitModeVideoExport,
                .exitModeZoom,
                .sliderJiggleOpacity,
        ]
    }
    
    private func getAllGrabElements() -> [ToolInterfaceElement] {
        return [
            .checkBoxAnimationGrabApplyToAll,
            .sliderJigglePower,
            .sliderJiggleSpeed,
            .sliderJiggleDampen,
            
        ]
    }
    
    private func getAllJigglesElements() -> [ToolInterfaceElement] {
        return [
            .buttonRotateJiggleRight,
            .buttonRotateJiggleLeft,
            .buttonFlipJiggleH,
            .buttonFlipJiggleV,
            .buttonFreezeSelectedJiggle,
            .buttonUnfreezeAllJiggles,
            .buttonCloneJiggle,
            .buttonDeleteJiggle,
            .buttonDeleteJigglePoint,
            .buttonSelectNextJigglePoint,
            .buttonSelectPreviousJigglePoint,
            .buttonSelectNextJiggle,
            .buttonSelectPreviousJiggle,
            .createSwatchMakeAndDrawJiggle,
            .createSwatchAddAndRemoveJigglePoints,
            .enterModeGuides,
            .segmentEditMode,
        ]
    }
    
    private func getAllGuidesElements() -> [ToolInterfaceElement] {
        return [
            .buttonRotateGuideLeft,
            .buttonRotateGuideRight,
            .buttonFlipGuideH,
            .buttonFlipGuideV,
            .buttonFreezeSelectedGuide,
            .buttonUnfreezeAllGuides,
            .buttonCloneGuide,
            .buttonDeleteGuide,
            .buttonDeleteGuidePoint,
            .buttonSelectNextGuidePoint,
            .buttonSelectPreviousGuidePoint,
            .buttonSelectNextGuide,
            .buttonSelectPreviousGuide,
            .buttonGenerateTopography,
            .createSwatchMakeAndDrawGuide,
            .createSwatchAddAndRemoveGuidePoints,
            .enterModeGraph,
            .exitModeGuides,
            .exitModeGraph,
            .segmentWeightMode,
        ]
    }
    
    private func getAllTimeLineElements() -> [ToolInterfaceElement] {
        return [.sliderTimeLineFrameOffset,
                .sliderTimeLineDuration,
                .buttonTimeLineSyncFrames,
                .buttonTimeLineDupeAll,
                .buttonTimeLineDupeCurrentChannel,
                .buttonTimeLineResetCurve,
                .buttonTimeLineResetCurveSmall,
                .buttonTimeLineResetDivot,
                .buttonTimeLineResetDivotSmall,
                .buttonTimeLineResetFlat,
                .buttonTimeLineResetSwan,
                .buttonTimeLineShiftDown,
                .buttonTimeLineShiftUp,
                .buttonTimeLineInvertH,
                .buttonTimeLineInvertV,
                .buttonTimeLineAmplify,
                .buttonTimeLineDampen,
                .buttonTimeLineFlipAll,
                .stepperTimelinePointCount,
                .checkBoxAnimationLoopApplyToAll,
                .enterModeContinuousPage1,
                .enterModeContinuousPage2,
                .enterModeContinuousPage3,
                .enterModeAnimationContinuous,
                .exitModeContinuousPage1,
                .exitModeContinuousPage2,
                .exitModeContinuousPage3,
                .exitModeAnimationContinuous,
        ]
    }
    
    private func getAllContinuousElements() -> [ToolInterfaceElement] {
        return [
            .sliderContinuousAngle,
            .sliderContinuousDuration,
            .sliderContinuousPower,
            .sliderContinuousSwoop,
            .sliderContinuousFrameOffset,
            .sliderContinuousStartScale,
            .sliderContinuousEndScale,
            .sliderContinuousStartRotation,
            .sliderContinuousEndRotation,
            .buttonContinuousSyncFrames,
            .buttonContinuousResetDuration,
            .buttonContinuousResetFrameOffset,
            .buttonContinuousResetAngleVertical,
            .buttonContinuousResetAngleHorizontal,
            .buttonContinuousResetAngleDiag1,
            .buttonContinuousResetAngleDiag2,
            .buttonContinuousResetSwoop,
            .buttonContinuousResetStartScale,
            .buttonContinuousResetEndScale,
            .buttonContinuousResetStartRotation,
            .buttonContinuousResetEndRotation,
            .checkBoxAnimationContinuousApplyToAll,
            .enterModeLoopsPage1,
            .enterModeLoopsPage2,
            .enterModeLoopsPage3,
            .exitModeLoopsPage1,
            .exitModeLoopsPage2,
            .exitModeLoopsPage3,
            .enterModeTimeLinePage1,
            .enterModeTimeLinePage2,
            .enterModeTimeLinePage3,
            .exitModeTimeLinePage1,
            .exitModeTimeLinePage2,
            .exitModeTimeLinePage3,
            .enterModeAnimationLoops,
            .exitModeAnimationLoops,
            .enterModeTimeLine,
            .exitModeTimeLine,
        ]
    }
    
    private func getAllGraphElements() -> [ToolInterfaceElement] {
        return [
            .buttonResetWeightGraphInverse,
            .buttonResetWeightGraphInverseDampened,
            .buttonResetWeightGraphLinear,
            .buttonResetWeightGraphLinearDampened,
            .buttonResetWeightGraphStandard,
            .buttonResetWeightGraphStandardDampened,
            .buttonSwivelPanLeft,
            .buttonSwivelPanReset,
            .buttonSwivelPanRight,
            .enterModeGuides,
            .enterModeGraph,
            .enterModeGraphPage2,
            .exitModeGuides,
            .exitModeGraph,
            .exitModeGraphPage2
        ]
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
            if elements.count > 0 {
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
    }
    
    @MainActor func handleTimeLineUpdate() {
        refreshAllRowsMatching(elements: getAllTimeLineElements())
    }
    
    func handleTimePointOrTanHandleUpdate() {
        
    }
    
    func handleSelectedTimeLineSwatchDidChange() {
        refreshAllRowsMatching(elements: [
            .sliderTimeLineFrameOffset,
        ])
    }
    
    @MainActor func handleSelectedJiggleDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllJigglesElements())
        elements.append(contentsOf: getAllGuidesElements())
        elements.append(contentsOf: getAllGraphElements())
        elements.append(contentsOf: getAllGrabElements())
        elements.append(contentsOf: getAllCommonElements())
        elements.append(contentsOf: getAllTimeLineElements())
        elements.append(contentsOf: getAllContinuousElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    func handleTimelinePointCountDidChange() {
        refreshAllRowsMatching(elements: [
            .stepperTimelinePointCount,
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
    }
    
    func handleWeightCurveGraphEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    func handleGuidesEnabledDidChange() {
        
    }
    
    func handleAnimationLoopsEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    func handleAnimationContinuousEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    func handleLoopsPageDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    func handleTimeLinePageDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    //T.I.V.M.
    func handleContinuousPageDidChange() {
        refreshAllRowsMatching(elements: [

        ])
    }
    
    func handleGraphPage2DidChange() {
        
    }
    
    
    func handleTimeLineEnabledDidChange() {

    }
    
    func handleCreatorModesDidChange() {
        
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllJigglesElements())
        elements.append(contentsOf: getAllGuidesElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
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
    }
    
    func handleAnimationContinuousAppliedToAllDidChange() {
        refreshAllRowsMatching(elements: [
            .checkBoxAnimationContinuousApplyToAll,
            .buttonContinuousSyncFrames,
            .buttonContinuousResetDuration,
            .buttonContinuousResetFrameOffset,
            .buttonContinuousResetAngleVertical,
            .buttonContinuousResetAngleHorizontal,
            .buttonContinuousResetAngleDiag1,
            .buttonContinuousResetAngleDiag2,
            .buttonContinuousResetSwoop,
            .buttonContinuousResetStartScale,
            .buttonContinuousResetEndScale,
            .buttonContinuousResetStartRotation,
            .buttonContinuousResetEndRotation,
        ])
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
    
    func handleContinuousDisableGrabDidChange() {
        refreshAllRowsMatching(elements: [.checkBoxContinuousDisableGrab])
        print("handleContinuousDisableGrabDidChange...")
    }
    
    func handleContinuousAngleDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousAngle])
        print("handleContinuousAngleDidChange...")
    }
    
    func handleContinuousDurationDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousDuration])
    }
    
    func handleContinuousPowerDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousPower])
    }
    
    func handleContinuousSwoopDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousSwoop])
    }
    
    func handleContinuousFrameOffsetDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousFrameOffset])
    }
    
    func handleContinuousStartScaleDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousStartScale])
    }
    
    func handleContinuousEndScaleDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousEndScale])
    }
    
    func handleContinuousStartRotationDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousStartRotation])
    }
    
    func handleContinuousEndRotationDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousEndRotation])
    }
    
    func handleSliderActiveDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllJigglesElements())
        elements.append(contentsOf: getAllGuidesElements())
        elements.append(contentsOf: getAllGraphElements())
        elements.append(contentsOf: getAllGrabElements())
        
        elements.append(contentsOf: getAllCommonElements())
        elements.append(contentsOf: getAllTimeLineElements())
        elements.append(contentsOf: getAllContinuousElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    func handleContinuousDraggedJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllContinuousElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    func handleContinuousUpdate() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllContinuousElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    func handleTimeLineDraggedJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllTimeLineElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    func handleGraphDraggedJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllGraphElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
}
