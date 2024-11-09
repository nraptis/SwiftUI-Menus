//
//  JiggleViewModel+HistoryRedo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewModel {
    
    @MainActor func applyHistoryStateJiggleSpeedRedo(_ historyState: HistoryStateJiggleSpeed) {
        print("applyHistoryStateJiggleSpeedRedo")
        
        for valueNode in historyState.valueNodes {
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                if jiggleIndex == valueNode.jiggleIndex {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jiggleSpeedAmount = valueNode.endValue
                }
            }
        }
        
        if historyState.selectedJiggleIndex != -1 {
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.selectedJiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
        }
        
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.handleJiggleSpeedDidChange()
        }
        jiggleDocument.killDragAll()
    }
    
    @MainActor func applyHistoryStateGyroPowerRedo(_ historyState: HistoryStateGyroPower) {
        print("applyHistoryStateGyroPowerRedo")
        
        for valueNode in historyState.valueNodes {
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                if jiggleIndex == valueNode.jiggleIndex {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jigglePowerAmount = valueNode.endValue
                }
            }
        }
        
        if historyState.selectedJiggleIndex != -1 {
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.selectedJiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
        }
        
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.handleJigglePowerDidChange()
        }
        jiggleDocument.killDragAll()
    }
    
    @MainActor func applyHistoryStateJiggleDampenRedo(_ historyState: HistoryStateJiggleDampen) {
        print("applyHistoryStateJiggleDampenRedo")
        
        for valueNode in historyState.valueNodes {
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                if jiggleIndex == valueNode.jiggleIndex {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jiggleDampenAmount = valueNode.endValue
                }
            }
        }
        
        if historyState.selectedJiggleIndex != -1 {
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.selectedJiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
        }
        
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.handleJiggleDampenDidChange()
        }
        jiggleDocument.killDragAll()
    }
    
    @MainActor func applyHistoryStateRotateOrFlipJiggleRedo(_ historyState: HistoryStateRotateOrFlipJiggle) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            historyState.fileBufferAfter.readReset()
            _ = selectedJiggle.load(fileBuffer: historyState.fileBufferAfter,
                                    isSelected: true)
            jiggleDocument.refreshFlipOrRotateJiggleAndSelect(at: historyState.jiggleIndex,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled//,
                                                              //isCreateOrRemove: false
            )
            jiggleDocument.killDragAll()
        }
    }
    
    @MainActor func applyHistoryStateRotateOrFlipGuideRedo(_ historyState: HistoryStateRotateOrFlipGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.guideIndex) {
                
                historyState.fileBufferAfter.readReset()
                _ = selectedGuide.load(fileBuffer: historyState.fileBufferAfter)
                
                jiggleDocument.refreshFlipOrRotateGuideAndSelect(at: historyState.jiggleIndex,
                                                                 guideIndex: historyState.guideIndex,
                                                                 displayMode: displayMode,
                                                                 isGraphEnabled: isGraphEnabled)
                jiggleDocument.killDragAll()
                
            }
            
            
        }
    }
    
    @MainActor func applyHistoryStateMoveWeightGraphPositionRedo(_ historyState: HistoryStateMoveWeightGraphPosition) {
        let isFirstControlPoint = historyState.isFirstControlPoint
        let isLastControlPoint = historyState.isLastControlPoint
        let guideIndex = historyState.guideIndex
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedWeightCurveControlPoint = selectedJiggle.getWeightCurveControlPoint(isFirstControlPoint: isFirstControlPoint,
                                                                                               isLastControlPoint: isLastControlPoint,
                                                                                               guideIndex: guideIndex) {
                selectedWeightCurveControlPoint.isManualHeightEnabled = true
                selectedWeightCurveControlPoint.normalizedHeightFactor = historyState.endHeightFactor
                let weightCurveControlIndex = selectedJiggle.getWeightCurveControlIndex(isFirstControlPoint: isFirstControlPoint,
                                                                                        isLastControlPoint: isLastControlPoint,
                                                                                        guideIndex: guideIndex)
                jiggleDocument.refreshGraphModify(jiggle: selectedJiggle,
                                                  weightCurveControlIndex: weightCurveControlIndex,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
                selectedJiggle.refreshWeightCurve()
                graphUpdateRelay()
            }
            jiggleDocument.killDragAll()
        }
    }
    
    @MainActor func applyHistoryStateMoveWeightGraphTangentRedo(_ historyState: HistoryStateMoveWeightGraphTangent) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            let isFirstControlPoint = historyState.isFirstControlPoint
            let isLastControlPoint = historyState.isLastControlPoint
            let guideIndex = historyState.guideIndex
            if let selectedWeightCurveControlPoint = selectedJiggle.getWeightCurveControlPoint(isFirstControlPoint: isFirstControlPoint,
                                                                                               isLastControlPoint: isLastControlPoint,
                                                                                               guideIndex: guideIndex) {
                selectedWeightCurveControlPoint.isManualTanHandleEnabled = true
                switch historyState.tanType {
                case .in:
                    selectedWeightCurveControlPoint.normalizedTanDirection = historyState.endDirection
                    selectedWeightCurveControlPoint.normalizedTanMagnitudeIn = historyState.endMagnitudeIn
                case .out:
                    selectedWeightCurveControlPoint.normalizedTanDirection = historyState.endDirection
                    selectedWeightCurveControlPoint.normalizedTanMagnitudeOut = historyState.endMagnitudeOut
                }
                
                let weightCurveControlIndex = selectedJiggle.getWeightCurveControlIndex(isFirstControlPoint: isFirstControlPoint,
                                                                                        isLastControlPoint: isLastControlPoint,
                                                                                        guideIndex: guideIndex)
                jiggleDocument.refreshGraphModify(jiggle: selectedJiggle,
                                                  weightCurveControlIndex: weightCurveControlIndex,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
                selectedJiggle.refreshWeightCurve()
                graphUpdateRelay()
            }
            jiggleDocument.killDragAll()
        }
    }
    
    @MainActor func applyHistoryStateResetWeightGraphRedo(_ historyState: HistoryStateResetWeightGraph) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.weightCurveControlPointStart.isManualHeightEnabled = false
            selectedJiggle.weightCurveControlPointStart.isManualTanHandleEnabled = false
            for guideIndex in 0..<selectedJiggle.guideCount {
                let guide = selectedJiggle.guides[guideIndex]
                let weightCurveControlPoint = guide.weightCurveControlPoint
                weightCurveControlPoint.isManualHeightEnabled = false
                weightCurveControlPoint.isManualTanHandleEnabled = false
            }
            selectedJiggle.weightCurveControlPointEnd.isManualHeightEnabled = false
            selectedJiggle.weightCurveControlPointEnd.isManualTanHandleEnabled = false
            
            jiggleDocument.refreshGraphModify(jiggle: selectedJiggle,
                                              displayMode: displayMode,
                                              isGraphEnabled: isGraphEnabled)
            
            selectedJiggle.refreshWeightCurve()
            graphUpdateRelay()
            
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) getMeshCommandForNewJiggle
    // Weight Ring Actions:
    //  a.) getGuideCommandForNewJiggle (to all)
    @MainActor func applyHistoryStateCreateJiggleRedo(_ historyState: HistoryStateCreateJiggle) {
        let newJiggle = JigglePartsFactory.shared.withdrawJiggle()
        newJiggle.load(jiggleEngine: jiggleEngine)
        historyState.readReset()
        _ = newJiggle.load(fileBuffer: historyState.fileBuffer,
                           isSelected: true)
        jiggleDocument.addJiggleNotFromLoad(newJiggle,
                                            isHistoryAction: true,
                                            displayMode: displayMode,
                                            isGraphEnabled: isGraphEnabled)
        jiggleDocument.killDragAll()
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) switchSelectedJiggle
    @MainActor func applyHistoryStateRemoveJiggleRedo(_ historyState: HistoryStateRemoveJiggle) {
        _ = jiggleDocument.attemptRemoveJiggle(historyState.jiggleIndex,
                                               isHistoryAction: true,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
        jiggleDocument.killDragAll()
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) affine only
    @MainActor func applyHistoryStateTransformJiggleRedo(_ historyState: HistoryStateTransformJiggle) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.center = historyState.endCenter
            selectedJiggle.scale = historyState.endScale
            selectedJiggle.rotation = historyState.endRotation
            
            jiggleDocument.refreshJiggleAffineAndSelect(at: historyState.jiggleIndex,
                                                        displayMode: displayMode,
                                                        isGraphEnabled: isGraphEnabled)
            
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) Spline to selected jiggle.
    //  b.) switchSelectedJiggle
    @MainActor func applyHistoryStateMoveControlPointRedo(_ historyState: HistoryStateMoveControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.selectedJiggleControlPointIndex = historyState.controlPointIndex
            if let selectedControlPoint = selectedJiggle.getSelectedJiggleControlPoint() {
                selectedControlPoint.x = historyState.endPoint.x
                selectedControlPoint.y = historyState.endPoint.y
            }
            jiggleDocument.refreshJiggleControlPointAndSelect(at: historyState.jiggleIndex,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) Spline to selected jiggle.
    //  b.) switchSelectedJiggle
    @MainActor func applyHistoryStateCreateControlPointRedo(_ historyState: HistoryStateCreateControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.insertJiggleControlPoint(historyState.point.x,
                                                    historyState.point.y,
                                                    at: historyState.controlPointIndex)
            jiggleDocument.refreshJiggleControlPointAndSelect(at: historyState.jiggleIndex,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled)
            jiggleDocument.controlPointsDidChangePublisher.send(())
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) Spline to selected jiggle.
    //  b.) switchSelectedJiggle
    @MainActor func applyHistoryStateRemoveControlPointRedo(_ historyState: HistoryStateRemoveControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            _ = selectedJiggle.removeJiggleControlPoint(historyState.controlPointIndex)
            jiggleDocument.refreshJiggleControlPointAndSelect(at: historyState.jiggleIndex,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled)
            jiggleDocument.controlPointsDidChangePublisher.send(())
            jiggleDocument.killDragAll()
            
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) AffineOnlyWeights, Forced-Graph to selected jiggle.
    //  b.) Re-Spline added weight ring.
    //  c.) Re-Paint other weight rings.
    //  d.) select
    @MainActor func applyHistoryStateCreateGuideRedo(_ historyState: HistoryStateCreateGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            let newGuide = JigglePartsFactory.shared.withdrawGuide()
            newGuide.load(jiggleEngine: jiggleEngine, jiggle: selectedJiggle)
            historyState.readReset()
            //let worldScale = getWorldScale()
            _ = newGuide.load(fileBuffer: historyState.fileBuffer)
            jiggleDocument.addGuide(newGuide,
                                    jiggle: selectedJiggle,
                                    isHistoryAction: true,
                                    displayMode: displayMode,
                                    isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
            
            selectedJiggle.refreshWeightCurve()
            graphUpdateRelay()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) AffineOnlyWeights, Forced-Graph to selected jiggle.
    //  b.) Re-Spline added weight ring.
    //  c.) Re-Paint other weight rings.
    //  d.) select
    @MainActor func applyHistoryStateDeleteGuideRedo(_ historyState: HistoryStateDeleteGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            _ = jiggleDocument.attemptDeleteGuide(selectedJiggle,
                                                  historyState.weightCurveIndex - 1,
                                                  isHistoryAction: true,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
            
            selectedJiggle.refreshWeightCurve()
            graphUpdateRelay()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) AffineOnlyWeights, Forced-Graph to selected jiggle.
    //  b.) Re-Spline affine weight ring.
    //  c.) Re-Paint other weight rings.
    //  d.) switchSelectedJiggle
    @MainActor func applyHistoryStateTransformGuideRedo(_ historyState: HistoryStateTransformGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.center = historyState.endCenter
                selectedGuide.scale = historyState.endScale
                selectedGuide.rotation = historyState.endRotation
            }
            jiggleDocument.refreshGuideAffineAndSelect(jiggleIndex: historyState.jiggleIndex,
                                                       guideIndex: (historyState.weightCurveIndex - 1),
                                                       displayMode: displayMode,
                                                       isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) AffineOnlyWeights, Forced-Graph to selected jiggle.
    //  b.) Re-Spline affine weight ring.
    //  c.) Re-Paint other weight rings.
    //  d.) switchSelectedJiggle
    @MainActor func applyHistoryStateMoveGuideControlPointRedo(_ historyState: HistoryStateMoveGuideControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.selectedJiggleControlPointIndex = historyState.guideControlPointIndex
                if let selectedJiggleControlPoint = selectedGuide.getSelectedJiggleControlPoint() {
                    selectedJiggleControlPoint.x = historyState.endPoint.x
                    selectedJiggleControlPoint.y = historyState.endPoint.y
                }
            }
            jiggleDocument.refreshGuideAffineAndSelect(jiggleIndex: historyState.jiggleIndex,
                                                       guideIndex: (historyState.weightCurveIndex - 1),
                                                       displayMode: displayMode,
                                                       isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) refreshGuideModify.
    //  b.) switchSelectedJiggle
    @MainActor func applyHistoryStateCreateGuideControlPointRedo(_ historyState: HistoryStateCreateGuideControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.insertJiggleControlPoint(historyState.point.x,
                                                       historyState.point.y,
                                                       at: historyState.guideControlPointIndex)
                jiggleDocument.refreshGuideModify(jiggle: selectedJiggle,
                                                  guide: selectedGuide,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
            }
            jiggleDocument.guideControlPointsDidChangePublisher.send(())
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) refreshGuideModify.
    //  b.) switchSelectedJiggle
    @MainActor func applyHistoryStateDeleteGuideControlPointRedo(_ historyState: HistoryStateDeleteGuideControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.removeJiggleControlPoint(historyState.guideControlPointIndex)
                jiggleDocument.refreshGuideModify(jiggle: selectedJiggle,
                                                  guide: selectedGuide,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
            }
            jiggleDocument.guideControlPointsDidChangePublisher.send(())
            jiggleDocument.killDragAll()
        }
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) refreshGuideModify.
    //  b.) switchSelectedJiggle
    @MainActor func applyHistoryStateMoveWeightCenterRedo(_ historyState: HistoryStateMoveWeightCenter) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.guideCenter = historyState.endCenter
            jiggleDocument.refreshWeightCenterModify(jiggle: selectedJiggle,
                                                     displayMode: displayMode,
                                                     isGraphEnabled: isGraphEnabled)
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    @MainActor func applyHistoryStateMoveJiggleCenterRedo(_ historyState: HistoryStateMoveJiggleCenter) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.offsetCenter = historyState.endCenter
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    @MainActor func applyHistoryStateLoopAttributeOneRedo(_ historyState: HistoryStateLoopAttributeOne) {
        
        if let jiggleViewController = jiggleViewController {
            if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
                
                jiggleDocument.restoreFromAttribute(jiggle: selectedJiggle,
                                                    loopAttribute: historyState.endAttribute)
                
                jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                    displayMode: displayMode,
                                                    isGraphEnabled: isGraphEnabled)
                
                func processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch) {
                    timeLineSelectedSwatch = whichData.swatch
                    timeLineComputeCurrentChannel(selectedJiggle)
                    jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                }
                
                switch historyState.endAttribute.loopAttributeTypeWithData {
                case .timeLine(let LoopAttributeDataTimeLine):
                    timeLineSelectedSwatch = LoopAttributeDataTimeLine.swatchDataX.swatch
                    timeLineComputeCurrentChannel(selectedJiggle)
                case .timeLineSwatchX(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchY(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchScale(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchRotation(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineFrameOffset(let timeLineFrameOffsetData):
                    timeLineSelectedSwatch = timeLineFrameOffsetData.selectedSwatch
                    if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                        jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                    }
                case .timeLineDuration:
                    if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                        jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                    }
                }
                
                //if let toolInterfaceViewModel = toolInterfaceViewModel {
                //    toolInterfaceViewModel.handleTimeLineUpdate()
                //}
                
                jiggleDocument.killDragAll()
            }
        }
    }
    
    @MainActor func applyHistoryStateLoopAttributesAllRedo(_ historyState: HistoryStateLoopAttributesAll) {
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            //if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            
            let countA = historyState.endAttributes.count
            let countB = jiggleDocument.jiggleCount
            let count = min(countA, countB)
            
            for jiggleIndex in 0..<count {
                let jiggle = jiggleDocument.jiggles[jiggleIndex]
                let attribute = historyState.endAttributes[jiggleIndex]
                jiggleDocument.restoreFromAttribute(jiggle: jiggle,
                                                    loopAttribute: attribute)
            }
            
            if historyState.jiggleIndex >= 0 && historyState.jiggleIndex < jiggleDocument.jiggleCount {
                jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                    displayMode: displayMode,
                                                    isGraphEnabled: isGraphEnabled)
            }
            
            func processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch) {
                timeLineSelectedSwatch = whichData.swatch
                for jiggleIndex in 0..<count {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    timeLineComputeCurrentChannel(jiggle)
                }
                if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                    jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                }
            }
            
            if countA > 0 {
                let referenceAttribute = historyState.endAttributes[0]
                switch referenceAttribute.loopAttributeTypeWithData {
                case .timeLine(let LoopAttributeDataTimeLine):
                    timeLineSelectedSwatch = LoopAttributeDataTimeLine.swatchDataX.swatch
                    for jiggleIndex in 0..<count {
                        let jiggle = jiggleDocument.jiggles[jiggleIndex]
                        timeLineComputeChannel(jiggle, swatch: .x)
                        timeLineComputeChannel(jiggle, swatch: .y)
                        timeLineComputeChannel(jiggle, swatch: .scale)
                        timeLineComputeChannel(jiggle, swatch: .rotation)
                    }
                    if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                        jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                    }
                    
                case .timeLineSwatchX(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchY(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchScale(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchRotation(let LoopAttributeDataTimeLineSwatch):
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineFrameOffset(let timeLineFrameOffsetData):
                    timeLineSelectedSwatch = timeLineFrameOffsetData.selectedSwatch
                    if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                        jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                    }
                case .timeLineDuration:
                    if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                        jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                    }
                }
            }
            
            jiggleDocument.killDragAll()
            
        }
    }
    
    @MainActor func applyHistoryStateContinuousAttributeOneRedo(_ historyState: HistoryStateContinuousAttributeOne) {
        
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            
            jiggleDocument.restoreFromAttribute(jiggle: selectedJiggle,
                                                continuousAttribute: historyState.endAttribute)
            
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            
            if let toolInterfaceViewModel = toolInterfaceViewModel {
                toolInterfaceViewModel.handleContinuousUpdate()
            }
            
            jiggleDocument.killDragAll()
        }
        
    }
    
    @MainActor func applyHistoryStateContinuousAttributesAllRedo(_ historyState: HistoryStateContinuousAttributesAll) {
        
        let countA = historyState.endAttributes.count
        let countB = jiggleDocument.jiggleCount
        let count = min(countA, countB)
        
        for jiggleIndex in 0..<count {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            let attribute = historyState.endAttributes[jiggleIndex]
            jiggleDocument.restoreFromAttribute(jiggle: jiggle,
                                                continuousAttribute: attribute)
        }
        
        if historyState.jiggleIndex >= 0 && historyState.jiggleIndex < jiggleDocument.jiggleCount {
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
        }
        
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleContinuousUpdate()
        }
        
        jiggleDocument.killDragAll()
        
    }
    
}
