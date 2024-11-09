//
//  ToolInterfaceViewModel+PublisherActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAllRows() -> [ToolRow] {
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
                .buttonTimeLineFlipCurrentChannelVertical,
                .buttonTimeLineFlipCurrentChannelHorizontal,
                .stepperTimelinePointCount,
                .checkBoxAnimationLoopApplyToAll,
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
    
    @MainActor private func refreshAllRows() {
        let allRows = getAllRows()
        for row in allRows {
            for node in row.nodes {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    @MainActor private func refreshAllRowsMatching(elements: [ToolInterfaceElement]) {
        
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
    
    @MainActor func handleTimeLineUpdate() {
        refreshAllRowsMatching(elements: getAllTimeLineElements())
    }

    @MainActor func handleSelectedTimeLineSwatchDidChange() {
        refreshAllRowsMatching(elements: [
            .sliderTimeLineFrameOffset,
        ])
    }
    
    @MainActor func handleSelectedJiggleDidChange() {
        //var elements: [ToolInterfaceElement] = []
        //elements.append(contentsOf: getAllJigglesElements())
        //elements.append(contentsOf: getAllGuidesElements())
        //elements.append(contentsOf: getAllGraphElements())
        //elements.append(contentsOf: getAllGrabElements())
        //elements.append(contentsOf: getAllCommonElements())
        //elements.append(contentsOf: getAllTimeLineElements())
        //elements.append(contentsOf: getAllContinuousElements())
        refreshAllRows()
    }
    
    @MainActor func handleTimelinePointCountDidChange() {
        refreshAllRowsMatching(elements: [
            .stepperTimelinePointCount,
        ])
    }
    
    @MainActor func handleZoomEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleVideoExportEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleVideoRecordEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleRecordingEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
            
        ])
    }
    
    @MainActor func handleResetZoomActiveDidChange() {
        refreshAllRowsMatching(elements: [
            
            
        ])
    }
    
    @MainActor func handleWeightCurveGraphEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleGuidesEnabledDidChange() {
        
    }
    
    @MainActor func handleAnimationLoopsEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleAnimationContinuousEnabledDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleLoopsPageDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleGraphPageDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleTimeLinePageDidChange() {
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleContinuousPageDidChange() {
        refreshAllRowsMatching(elements: [

        ])
    }
    
    @MainActor func handleTimeLineEnabledDidChange() {

    }
    
    @MainActor func handleCreatorModesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllJigglesElements())
        elements.append(contentsOf: getAllGuidesElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleJigglesDidChange() {
        //TODO: More, More
        refreshAllRowsMatching(elements: [
            
        ])
    }
    
    @MainActor func handleControlPointsDidChange() {
        refreshAllRowsMatching(elements: [
            .createSwatchAddAndRemoveJigglePoints
        ])
    }
    
    @MainActor func handleDocumentModeDidChange() {
        refreshAllRowsMatching(elements: [
            .mainTabDocumentMode
        ])
    }
    
    @MainActor func handleEditModeDidChange() {
        refreshAllRowsMatching(elements: [
            .segmentEditMode
        ])
    }
    
    @MainActor func handleWeightModeDidChange() {
        refreshAllRowsMatching(elements: [
            .segmentWeightMode
        ])
    }
    
    @MainActor func handleUndoRedoDidChange() {
        refreshAllRowsMatching(elements: [.buttonRedo,
                                          .buttonUndo])
    }
    
    @MainActor func handleDarkModeDidChange() {
        refreshAllRowsMatching(elements: [.checkBoxDarkMode])
    }
    
    @MainActor func handleFrozenJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllJigglesElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleFrozenGuidesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllGuidesElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleStereoscopicDidChange() {
        refreshAllRowsMatching(elements: [
            .checkBoxStereoscopicEnabled
        ])
    }
    
    @MainActor func handleAnimationGrabAppliedToAllDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllGrabElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleAnimationLoopsAppliedToAllDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllTimeLineElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleAnimationContinuousAppliedToAllDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllContinuousElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleJiggleSpeedDidChange() {
        refreshAllRowsMatching(elements: [.sliderJiggleSpeed])
    }
    
    @MainActor func handleJigglePowerDidChange() {
        refreshAllRowsMatching(elements: [.sliderJigglePower])
    }
    
    @MainActor func handleJiggleDampenDidChange() {
        refreshAllRowsMatching(elements: [.sliderJiggleDampen])
    }
    
    @MainActor func handleContinuousDisableGrabDidChange() {
        refreshAllRowsMatching(elements: [.checkBoxContinuousDisableGrab])
        print("handleContinuousDisableGrabDidChange...")
    }
    
    @MainActor func handleContinuousAngleDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousAngle])
        print("handleContinuousAngleDidChange...")
    }
    
    @MainActor func handleContinuousDurationDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousDuration])
    }
    
    @MainActor func handleContinuousPowerDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousPower])
    }
    
    @MainActor func handleContinuousSwoopDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousSwoop])
    }
    
    @MainActor func handleContinuousFrameOffsetDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousFrameOffset])
    }
    
    @MainActor func handleContinuousStartScaleDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousStartScale])
    }
    
    @MainActor func handleContinuousEndScaleDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousEndScale])
    }
    
    @MainActor func handleContinuousStartRotationDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousStartRotation])
    }
    
    @MainActor func handleContinuousEndRotationDidChange() {
        refreshAllRowsMatching(elements: [.sliderContinuousEndRotation])
    }
    
    @MainActor func handleSliderActiveDidChange() {
        //var elements: [ToolInterfaceElement] = []
        //elements.append(contentsOf: getAllJigglesElements())
        //elements.append(contentsOf: getAllGuidesElements())
        //elements.append(contentsOf: getAllGraphElements())
        //elements.append(contentsOf: getAllGrabElements())
        //elements.append(contentsOf: getAllCommonElements())
        //elements.append(contentsOf: getAllTimeLineElements())
        //elements.append(contentsOf: getAllContinuousElements())
        //refreshAllRowsMatching(elements: elements)
        refreshAllRows()
    }
    
    @MainActor func handleContinuousUpdate() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllContinuousElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleContinuousDraggedJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllContinuousElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleTimeLineDraggedJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllTimeLineElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
    @MainActor func handleGraphDraggedJigglesDidChange() {
        var elements: [ToolInterfaceElement] = []
        elements.append(contentsOf: getAllGraphElements())
        elements.append(contentsOf: getAllCommonElements())
        refreshAllRowsMatching(elements: elements)
    }
    
}
