//
//  JiggleViewModel+HistoryUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewModel {
    
    func applyHistoryStateJiggleSpeedUndo(_ historyState: HistoryStateJiggleSpeed) {
        print("applyHistoryStateJiggleSpeedUndo")
        
        for valueNode in historyState.valueNodes {
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                if jiggleIndex == valueNode.jiggleIndex {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jiggleSpeedAmount = valueNode.startValue
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
    
    func applyHistoryStateGyroPowerUndo(_ historyState: HistoryStateGyroPower) {
        print("applyHistoryStateGyroPowerUndo")
        
        for valueNode in historyState.valueNodes {
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                if jiggleIndex == valueNode.jiggleIndex {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jigglePowerAmount = valueNode.startValue
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
    
    func applyHistoryStateJiggleDampenUndo(_ historyState: HistoryStateJiggleDampen) {
        print("applyHistoryStateJiggleDampenUndo")
        
        for valueNode in historyState.valueNodes {
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                if jiggleIndex == valueNode.jiggleIndex {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jiggleDampenAmount = valueNode.startValue
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
    
    func applyHistoryStateRotateOrFlipJiggleUndo(_ historyState: HistoryStateRotateOrFlipJiggle) {
        
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            historyState.fileBufferBefore.readReset()
            _ = selectedJiggle.load(fileBuffer: historyState.fileBufferBefore,
                                    isSelected: true)
            jiggleDocument.refreshFlipOrRotateJiggleAndSelect(at: historyState.jiggleIndex,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled//,
                                                              //isCreateOrRemove: false
            )
            jiggleDocument.killDragAll()
        }
    }
    
    func applyHistoryStateRotateOrFlipGuideUndo(_ historyState: HistoryStateRotateOrFlipGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.guideIndex) {
                
                historyState.fileBufferBefore.readReset()
                _ = selectedGuide.load(fileBuffer: historyState.fileBufferBefore)
                
                jiggleDocument.refreshFlipOrRotateGuideAndSelect(at: historyState.jiggleIndex,
                                                                 guideIndex: historyState.guideIndex,
                                                                 displayMode: displayMode,
                                                                 isGraphEnabled: isGraphEnabled)
                jiggleDocument.killDragAll()
                
            }
            
            
        }
    }
    
    func applyHistoryStateMoveWeightGraphPositionUndo(_ historyState: HistoryStateMoveWeightGraphPosition) {
        let isFirstControlPoint = historyState.isFirstControlPoint
        let isLastControlPoint = historyState.isLastControlPoint
        let guideIndex = historyState.guideIndex
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedWeightCurveControlPoint = selectedJiggle.getWeightCurveControlPoint(isFirstControlPoint: isFirstControlPoint,
                                                                                               isLastControlPoint: isLastControlPoint,
                                                                                               guideIndex: guideIndex) {
                
                selectedWeightCurveControlPoint.isManualHeightEnabled = historyState.startHeightManual
                selectedWeightCurveControlPoint.normalizedHeightFactor = historyState.startHeightFactor
                
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
    
    func applyHistoryStateMoveWeightGraphTangentUndo(_ historyState: HistoryStateMoveWeightGraphTangent) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            
            
            let isFirstControlPoint = historyState.isFirstControlPoint
            let isLastControlPoint = historyState.isLastControlPoint
            let guideIndex = historyState.guideIndex
            
            if let selectedWeightCurveControlPoint = selectedJiggle.getWeightCurveControlPoint(isFirstControlPoint: isFirstControlPoint,
                                                                                               isLastControlPoint: isLastControlPoint,
                                                                                               guideIndex: guideIndex) {
                selectedWeightCurveControlPoint.isManualTanHandleEnabled = historyState.startTangentManual
                
                switch historyState.tanType {
                case .in:
                    selectedWeightCurveControlPoint.normalizedTanDirection = historyState.startDirection
                    selectedWeightCurveControlPoint.normalizedTanMagnitudeIn = historyState.startMagnitudeIn
                case .out:
                    selectedWeightCurveControlPoint.normalizedTanDirection = historyState.startDirection
                    selectedWeightCurveControlPoint.normalizedTanMagnitudeOut = historyState.startMagnitudeOut
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
    
    func applyHistoryStateResetWeightGraphUndo(_ historyState: HistoryStateResetWeightGraph) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if historyState.storageNodes.count > 0 {
                let firstNode = historyState.storageNodes[0]
                let lastNode = historyState.storageNodes[historyState.storageNodes.count - 1]
                selectedJiggle.weightCurveControlPointStart.isManualHeightEnabled = firstNode.startHeightManual
                selectedJiggle.weightCurveControlPointStart.normalizedHeightFactor = firstNode.startHeightFactor
                selectedJiggle.weightCurveControlPointStart.isManualTanHandleEnabled = firstNode.startTangentManual
                selectedJiggle.weightCurveControlPointStart.normalizedTanDirection = firstNode.startDirection
                selectedJiggle.weightCurveControlPointStart.normalizedTanMagnitudeIn = firstNode.startMagnitudeIn
                selectedJiggle.weightCurveControlPointStart.normalizedTanMagnitudeOut = firstNode.startMagnitudeOut
                selectedJiggle.weightCurveControlPointEnd.isManualHeightEnabled = lastNode.startHeightManual
                selectedJiggle.weightCurveControlPointEnd.normalizedHeightFactor = lastNode.startHeightFactor
                selectedJiggle.weightCurveControlPointEnd.isManualTanHandleEnabled = lastNode.startTangentManual
                selectedJiggle.weightCurveControlPointEnd.normalizedTanDirection = lastNode.startDirection
                selectedJiggle.weightCurveControlPointEnd.normalizedTanMagnitudeIn = lastNode.startMagnitudeIn
                selectedJiggle.weightCurveControlPointEnd.normalizedTanMagnitudeOut = lastNode.startMagnitudeOut
                for guideIndex in 0..<selectedJiggle.guideCount {
                    let storageNodeIndex = guideIndex + 1
                    if storageNodeIndex >= 0 && storageNodeIndex < historyState.storageNodes.count {
                        let storageNode = historyState.storageNodes[storageNodeIndex]
                        let guide = selectedJiggle.guides[guideIndex]
                        let weightCurveControlPoint = guide.weightCurveControlPoint
                        weightCurveControlPoint.isManualHeightEnabled = storageNode.startHeightManual
                        weightCurveControlPoint.normalizedHeightFactor = storageNode.startHeightFactor
                        weightCurveControlPoint.isManualTanHandleEnabled = storageNode.startTangentManual
                        weightCurveControlPoint.normalizedTanDirection = storageNode.startDirection
                        weightCurveControlPoint.normalizedTanMagnitudeIn = storageNode.startMagnitudeIn
                        weightCurveControlPoint.normalizedTanMagnitudeOut = storageNode.startMagnitudeOut
                    }
                }
            }
            
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
    //  a.) switchSelectedJiggle
    func applyHistoryStateCreateJiggleUndo(_ historyState: HistoryStateCreateJiggle) {
        _ = jiggleDocument.attemptRemoveJiggle(jiggleDocument.jiggleCount - 1,
                                               isHistoryAction: true,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
        jiggleDocument.killDragAll()
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) getMeshCommandForNewJiggle
    // Weight Ring Actions:
    //  a.) getGuideCommandForNewJiggle (to all)
    func applyHistoryStateRemoveJiggleUndo(_ historyState: HistoryStateRemoveJiggle) {
        let newJiggle = JigglePartsFactory.shared.withdrawJiggle()
        newJiggle.load(jiggleEngine: jiggleEngine)
        historyState.readReset()
        _ = newJiggle.load(fileBuffer: historyState.fileBuffer,
                           isSelected: true)
        jiggleDocument.insertJiggleHistoryAction(newJiggle,
                                                 at: historyState.jiggleIndex,
                                                 displayMode: displayMode,
                                                 isGraphEnabled: isGraphEnabled)
        jiggleDocument.killDragAll()
    }
    
    // [Verified]
    // Mesh Actions:
    //  a.) affine only
    func applyHistoryStateTransformJiggleUndo(_ historyState: HistoryStateTransformJiggle) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.center = historyState.startCenter
            selectedJiggle.scale = historyState.startScale
            selectedJiggle.rotation = historyState.startRotation
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
    func applyHistoryStateMoveControlPointUndo(_ historyState: HistoryStateMoveControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.selectedJiggleControlPointIndex = historyState.controlPointIndex
            if let selectedControlPoint = selectedJiggle.getSelectedJiggleControlPoint() {
                selectedControlPoint.x = historyState.startPoint.x
                selectedControlPoint.y = historyState.startPoint.y
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
    func applyHistoryStateCreateControlPointUndo(_ historyState: HistoryStateCreateControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if selectedJiggle.jiggleControlPointCount > 0 {
                _ = selectedJiggle.removeJiggleControlPoint(historyState.controlPointIndex)
            }
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
    func applyHistoryStateRemoveControlPointUndo(_ historyState: HistoryStateRemoveControlPoint) {
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
    //  a.) AffineOnlyWeights, Forced-Graph to selected jiggle.
    //  b.) Re-Spline added weight ring.
    //  c.) Re-Paint other weight rings.
    //  d.) select
    func applyHistoryStateCreateGuideUndo(_ historyState: HistoryStateCreateGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            _ = jiggleDocument.attemptDeleteGuide(selectedJiggle,
                                                  selectedJiggle.guideCount - 1,
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
    func applyHistoryStateDeleteGuideUndo(_ historyState: HistoryStateDeleteGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            let newGuide = JigglePartsFactory.shared.withdrawGuide()
            newGuide.load(jiggleEngine: jiggleEngine, jiggle: selectedJiggle)
            historyState.readReset()
            //let worldScale = getWorldScale()
            _ = newGuide.load(fileBuffer: historyState.fileBuffer)
            jiggleDocument.insertGuideHistoryAction(selectedJiggle,
                                                    newGuide,
                                                    at: historyState.weightCurveIndex - 1,
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
    func applyHistoryStateTransformGuideUndo(_ historyState: HistoryStateTransformGuide) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.center = historyState.startCenter
                selectedGuide.scale = historyState.startScale
                selectedGuide.rotation = historyState.startRotation
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
    func applyHistoryStateMoveGuideControlPointUndo(_ historyState: HistoryStateMoveGuideControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.selectedJiggleControlPointIndex = historyState.guideControlPointIndex
                if let selectedJiggleControlPoint = selectedGuide.getSelectedJiggleControlPoint() {
                    selectedJiggleControlPoint.x = historyState.startPoint.x
                    selectedJiggleControlPoint.y = historyState.startPoint.y
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
    func applyHistoryStateCreateGuideControlPointUndo(_ historyState: HistoryStateCreateGuideControlPoint) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            if let selectedGuide = selectedJiggle.getGuide(historyState.weightCurveIndex - 1) {
                selectedGuide.removeJiggleControlPoint(historyState.guideControlPointIndex)
                selectedJiggle.switchSelectedWeightCurveControlIndex(index: historyState.weightCurveIndex)
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
    func applyHistoryStateDeleteGuideControlPointUndo(_ historyState: HistoryStateDeleteGuideControlPoint) {
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
    func applyHistoryStateMoveWeightCenterUndo(_ historyState: HistoryStateMoveWeightCenter) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.guideCenter = historyState.startCenter
            jiggleDocument.refreshWeightCenterModify(jiggle: selectedJiggle,
                                                     displayMode: displayMode,
                                                     isGraphEnabled: isGraphEnabled)
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    func applyHistoryStateMoveJiggleCenterUndo(_ historyState: HistoryStateMoveJiggleCenter) {
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            selectedJiggle.offsetCenter = historyState.startCenter
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            jiggleDocument.killDragAll()
        }
    }
    
    func applyHistoryStateLoopAttributeOneUndo(_ historyState: HistoryStateLoopAttributeOne) {
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
                
                jiggleDocument.restoreFromAttribute(jiggle: selectedJiggle,
                                                    loopAttribute: historyState.startAttribute)
                
                jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                    displayMode: displayMode,
                                                    isGraphEnabled: isGraphEnabled)
                
                func processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch) {
                    timeLineSelectedSwatch = whichData.swatch
                    timeLineComputeCurrentChannel(selectedJiggle)
                    jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                }
                
                switch historyState.startAttribute.loopAttributeTypeWithData {
                case .timeLine(let LoopAttributeDataTimeLine):
                    timeLineSelectedSwatch = LoopAttributeDataTimeLine.swatchDataX.swatch
                    timeLineComputeCurrentChannel(selectedJiggle)
                    jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
                case .timeLineSwatchY(let LoopAttributeDataTimeLineSwatch):
                    
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                case .timeLineSwatchX(let LoopAttributeDataTimeLineSwatch):
                    
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
    
    func applyHistoryStateLoopAttributesAllUndo(_ historyState: HistoryStateLoopAttributesAll) {
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            
            let countA = historyState.startAttributes.count
            let countB = jiggleDocument.jiggleCount
            let count = min(countA, countB)
            
            for jiggleIndex in 0..<count {
                let jiggle = jiggleDocument.jiggles[jiggleIndex]
                let attribute = historyState.startAttributes[jiggleIndex]
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
                let referenceAttribute = historyState.startAttributes[0]
                
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
                case .timeLineSwatchY(let LoopAttributeDataTimeLineSwatch):
                    
                    processTimeLineSwatch(whichData: LoopAttributeDataTimeLineSwatch)
                    
                case .timeLineSwatchX(let LoopAttributeDataTimeLineSwatch):
                    
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
            
            //if let toolInterfaceViewModel = toolInterfaceViewModel {
            //    toolInterfaceViewModel.handleTimeLineUpdate()
            //}
            
            jiggleDocument.killDragAll()
            
        }
    }
    
    func applyHistoryStateContinuousAttributeOneUndo(_ historyState: HistoryStateContinuousAttributeOne) {
        
        if let selectedJiggle = jiggleDocument.getJiggle(historyState.jiggleIndex) {
            
            jiggleDocument.restoreFromAttribute(jiggle: selectedJiggle,
                                                continuousAttribute: historyState.startAttribute)
            
            jiggleDocument.switchSelectedJiggle(newSelectedJiggleIndex: historyState.jiggleIndex,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            
            if let toolInterfaceViewModel = toolInterfaceViewModel {
                toolInterfaceViewModel.handleContinuousUpdate()
            }

            
            jiggleDocument.killDragAll()
        }
        
    }
    
    func applyHistoryStateContinuousAttributesAllUndo(_ historyState: HistoryStateContinuousAttributesAll) {
        
        
        let countA = historyState.startAttributes.count
        let countB = jiggleDocument.jiggleCount
        let count = min(countA, countB)
        
        for jiggleIndex in 0..<count {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            let attribute = historyState.startAttributes[jiggleIndex]
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
