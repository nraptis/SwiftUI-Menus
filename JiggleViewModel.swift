//
//  JiggleViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/9/23.
//

import UIKit
import Combine

class JiggleViewModel {
    
    private var _graphDraggingStatus = false
    func getGraphDraggingStatus() -> Bool {
        return _graphDraggingStatus
    }
    
    @MainActor private func _calculateGraphDraggingStatus() -> Bool {
        if isVideoExportEnabled { return false }
        if isVideoRecordEnabled { return false }
        if isZoomEnabled { return false }
        
        guard let jiggleViewController = ApplicationController.shared.jiggleViewController else {
            return false
        }
        
        switch jiggleDocument.documentMode {
        case .edit:
            if jiggleDocument.isGuidesEnabled {
                if isGraphEnabled {
                    let graphView: GraphView
                    if Device.isPad {
                        graphView = jiggleViewController.padDraggableMenu.standardContainerView.graphContainerView.graphView
                    } else {
                        graphView = jiggleViewController.phoneTopMenu.standardContainerView.graphContainerView.graphView
                    }
                    if graphView.selectedWeightCurveControlPointTouch !== nil {
                        return true
                    }
                    if graphView.selectedWeightCurveControlTanTouch !== nil {
                        return true
                    }
                    return false
                } else {
                    return false
                }
            } else {
                return false
            }
        case .view:
            return false
        }
    }
    
    @MainActor func graphDragNotifyStarted() {
        print("graphDragNotifyStarted")
        
        _graphDraggingStatus = _calculateGraphDraggingStatus()
        print("_graphDraggingStatus = \(_graphDraggingStatus)")
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleGraphDraggedJigglesDidChange()
        }
    }
    
    @MainActor func graphDragNotifyFinished() {
        print("graphDragNotifyFinished")
        
        
        _graphDraggingStatus = _calculateGraphDraggingStatus()
        
        print("_graphDraggingStatus = \(_graphDraggingStatus)")
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleGraphDraggedJigglesDidChange()
        }
    }

    private var _timeLineDraggingStatus = false
    @MainActor func getTimeLineDraggingStatus() -> Bool {
        return _timeLineDraggingStatus
    }
    
    @MainActor private func _calculateTimeLineDraggingStatus() -> Bool {
        if isVideoExportEnabled { return false }
        if isVideoRecordEnabled { return false }
        if isZoomEnabled { return false }
        
        guard let jiggleViewController = ApplicationController.shared.jiggleViewController else {
            return false
        }
        
        switch jiggleDocument.documentMode {
        case .edit:
            return false
        case .view:
            if jiggleDocument.isAnimationLoopsEnabled {
                
                if jiggleDocument.isTimeLineEnabled {
                    
                    let timeLineView: TimeLineView
                    if Device.isPad {
                        timeLineView = jiggleViewController.padDraggableMenu.standardContainerView.timeLineContainerView.timeLineView
                    } else {
                        timeLineView = jiggleViewController.phoneTopMenu.standardContainerView.timeLineContainerView.timeLineView
                    }
                    if timeLineView.selectedTimeLineControlPointTouch !== nil {
                        return true
                    }
                    if timeLineView.selectedTimeLineControlTanTouch !== nil {
                        return true
                    }
                    return false
                } else {
                    return false
                }
            } else {
                return false
            }
        }
    }
    
    @MainActor func timeLineDragNotifyStarted() {
        print("timeLineDragNotifyStarted")
        
        _timeLineDraggingStatus = _calculateTimeLineDraggingStatus()
        print("_timeLineDraggingStatus = \(_timeLineDraggingStatus)")
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleTimeLineDraggedJigglesDidChange()
        }
    }
    
    
    @MainActor func timeLineDragNotifyFinished() {
        print("timeLineDragNotifyFinished")
        
        
        _timeLineDraggingStatus = _calculateTimeLineDraggingStatus()
        
        print("_timeLineDraggingStatus = \(_timeLineDraggingStatus)")
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleTimeLineDraggedJigglesDidChange()
        }
    }
    
    
    
    
    private var _continuousDraggingStatus = false
    @MainActor func getContinuousDraggingStatus() -> Bool {
        return _continuousDraggingStatus
    }
    
    @MainActor private func _calculateContinuousDraggingStatus() -> Bool {
        if isVideoExportEnabled { return false }
        if isVideoRecordEnabled { return false }
        if isZoomEnabled { return false }
        
        switch jiggleDocument.documentMode {
        case .edit:
            return false
        case .view:
            if jiggleDocument.isAnimationLoopsEnabled {
                return false
            }
            if jiggleDocument.isAnimationContinuousEnabled {
                
                // Is any jiggle being dragged by touch?
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    if jiggle.animationInstructionContinuous.animationTouchCount > 0 {
                        return true
                    }
                }
                
                return false
                
            } else {
                return false
            }
        }
    }
    
    @MainActor func continuousRealizeJiggleWillStartGrab(jiggle: Jiggle) {
        print("*** continuousRealizeJiggleWillStartGrab")
        
        jiggle.snapShotContinuousDragHistory()
        
    }
    
    @MainActor func continuousRealizeJiggleDidStartGrab(jiggle: Jiggle) {
        print("*** continuousRealizeJiggleDidStartGrab")
        
        _continuousDraggingStatus = _calculateContinuousDraggingStatus()
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleContinuousDraggedJigglesDidChange()
        }
        
    }
    
    @MainActor func continuousRealizeJiggleWillStopGrab(jiggle: Jiggle) {
        print("*** continuousRealizeJiggleWillStopGrab")
        
        
        if let jiggleIndex = jiggleDocument.getJiggleIndex(jiggle) {
            
            let startData = ContinuousAttributeDataUserAll(duration: jiggle._snapShotContinuousDuration,
                                                            angle: jiggle._snapShotContinuousAngle,
                                                            power: jiggle._snapShotContinuousPower,
                                                            swoop: jiggle._snapShotContinuousSwoop,
                                                            frameOffset: jiggle._snapShotContinuousFrameOffset,
                                                            startScale: jiggle._snapShotContinuousStartScale,
                                                            endScale: jiggle._snapShotContinuousEndScale,
                                                            startRotation: jiggle._snapShotContinuousStartRotation,
                                                            endRotation: jiggle._snapShotContinuousEndRotation)
            let startAttribute = ContinuousAttribute(jiggleIndex: jiggleIndex,
                                                     continuousAttributeType: .continuousAll,
                                                     continuousAttributeTypeWithData: .continuousAll(startData))
            
            let endData = ContinuousAttributeDataUserAll(duration: jiggle.continuousDuration,
                                                          angle: jiggle.continuousAngle,
                                                          power: jiggle.continuousPower,
                                                          swoop: jiggle.continuousSwoop,
                                                          frameOffset: jiggle.continuousFrameOffset,
                                                          startScale: jiggle.continuousStartScale,
                                                          endScale: jiggle.continuousEndScale,
                                                          startRotation: jiggle.continuousStartRotation,
                                                          endRotation: jiggle.continuousEndRotation)
            let endAttribute = ContinuousAttribute(jiggleIndex: jiggleIndex,
                                                   continuousAttributeType: .continuousAll,
                                                   continuousAttributeTypeWithData: .continuousAll(endData))
            
            historyRecordContinuousAttributeOne(jiggleIndex: jiggleIndex,
                                                startAttribute: startAttribute,
                                                endAttribute: endAttribute)
            
        }
        
        
        
        
        _continuousDraggingStatus = _calculateContinuousDraggingStatus()
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleContinuousDraggedJigglesDidChange()
        }
    }
    
    
    
    func snapshotTimeLineHistoryForTimeLineModifyAll(jiggle: Jiggle) {
        if isAnimationLoopsAppliedToAll {
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLine,
                                                     selectedJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        } else {
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLine,
                                                    targetJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        }
    }
    
    func snapshotTimeLineHistoryForOneSwatchAll(jiggle: Jiggle) {
        switch timeLineSelectedSwatch {
        case .x:
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchX,
                                                     selectedJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        case .y:
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchY,
                                                     selectedJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        case .scale:
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchScale,
                                                     selectedJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        case .rotation:
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchRotation,
                                                     selectedJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        }
    }
    
    func snapshotTimeLineHistoryForOneSwatchSelected(jiggle: Jiggle) {
        switch timeLineSelectedSwatch {
        case .x:
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchX,
                                                    targetJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        case .y:
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchY,
                                                    targetJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        case .scale:
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchScale,
                                                    targetJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        case .rotation:
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchRotation,
                                                    targetJiggleIndex: jiggleDocument.getJiggleIndex(jiggle),
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        }
    }
    
    @MainActor func recordTimeLineHistoryForOneSwatch() {
        if jiggleDocument.snapShotLoopAttributeIsAppliedToAll {
            let startAttributes = jiggleDocument.snapShotLoopAttributesAll
            if startAttributes.count > 0 {
                switch startAttributes[0].loopAttributeTypeWithData {
                case .timeLine:
                    break
                case .timeLineFrameOffset:
                    break
                case .timeLineDuration:
                    break
                case .timeLineSwatchX(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchX,
                                                             selectedJiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                             timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                    if startAttributes.count == endAttributes.count {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                       startAttributes: startAttributes,
                                                       endAttributes: endAttributes)
                    }
                case .timeLineSwatchY(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchY,
                                                             selectedJiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                             timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                    if startAttributes.count == endAttributes.count {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                       startAttributes: startAttributes,
                                                       endAttributes: endAttributes)
                    }
                case .timeLineSwatchScale(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchScale,
                                                             selectedJiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                             timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                    if startAttributes.count == endAttributes.count {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                       startAttributes: startAttributes,
                                                       endAttributes: endAttributes)
                    }
                case .timeLineSwatchRotation(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchRotation,
                                                             selectedJiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                             timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                    if startAttributes.count == endAttributes.count {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                       startAttributes: startAttributes,
                                                       endAttributes: endAttributes)
                    }
                }
            }
        } else {
            if let startAttribute = jiggleDocument.snapShotLoopAttributeOne {
                switch startAttribute.loopAttributeTypeWithData {
                case .timeLine:
                    break
                case .timeLineFrameOffset:
                    break
                case .timeLineDuration:
                    break
                case .timeLineSwatchX(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchX,
                                                            targetJiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                            timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    if let endAttribute = jiggleDocument.snapShotLoopAttributeOne {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                      startAttribute: startAttribute,
                                                      endAttribute: endAttribute)
                    }
                case .timeLineSwatchY(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchY,
                                                            targetJiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                            timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    if let endAttribute = jiggleDocument.snapShotLoopAttributeOne {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                      startAttribute: startAttribute,
                                                      endAttribute: endAttribute)
                    }
                case .timeLineSwatchScale(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchScale,
                                                            targetJiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                            timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    if let endAttribute = jiggleDocument.snapShotLoopAttributeOne {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                      startAttribute: startAttribute,
                                                      endAttribute: endAttribute)
                    }
                case .timeLineSwatchRotation(let timeLineSwatchDataStart):
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchRotation,
                                                            targetJiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                            timeLineSelectedSwatch: timeLineSwatchDataStart.selectedSwatch)
                    if let endAttribute = jiggleDocument.snapShotLoopAttributeOne {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                      startAttribute: startAttribute,
                                                      endAttribute: endAttribute)
                    }
                }
            }
        }
    }
    
    func snapshotTimeLineHistoryForTimeLineViewDrag(jiggle: Jiggle) {
        if isAnimationLoopsAppliedToAll {
            snapshotTimeLineHistoryForOneSwatchAll(jiggle: jiggle)
        } else {
            snapshotTimeLineHistoryForOneSwatchSelected(jiggle: jiggle)
        }
    }
    
    // [DONE!]: We can do a little better here; Better to save just the swatch / channel in question.
    //       What are the trade offs of this improvement? Might be better to just have much less
    //       channels at the max end and keep the over-fitted solution...
    @MainActor func recordTimeLineHistoryForTimeLineViewDrag() {
        recordTimeLineHistoryForOneSwatch()
    }
    
    func isSliderActiveBesides(thisSlider: ToolInterfaceElement) -> Bool {
        if isAnySliderActive {
            if activeSlider == .buttonMenu {
                return false
            }
            if activeSlider == thisSlider {
                return false
            }
            return true
        } else {
            return false
        }
    }
    
    var isAnySliderActive = false
    var isAnySliderActiveStaleTime = Float(0.0)
    var activeSlider = ToolInterfaceElement.buttonMenu
    
    @MainActor func ANY_sliderActiveNotify(whichSlider: ToolInterfaceElement) {
        print("*** SLIDER ACTIVE!!!")
        isAnySliderActive = true
        activeSlider = whichSlider
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleSliderActiveDidChange()
        }
    }
    
    @MainActor func ANY_sliderInactiveNotify() {
        print("*** SLIDER INACTIVE!!!")
        isAnySliderActive = false
        activeSlider = ToolInterfaceElement.buttonMenu
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleSliderActiveDidChange()
        }
    }
    
    var isZoomEnabled = false
    var isGraphEnabled = false
    //var isTimeLinePage2Enabled = false
    
    var timeLineSelectedSwatch = Swatch.scale
    
    @MainActor func selectTimeLineSwatch(swatch: Swatch) {
        timeLineSelectedSwatch = swatch
        jiggleDocument.selectedTimeLineSwatchUpdatePublisher.send(())
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleTimelinePointCountDidChange()
        }
    }
    
    @MainActor func setContinuousDisableGrab(isEnabled: Bool) {
        jiggleDocument.isContinuousDisableGrabEnabled = isEnabled
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            toolInterfaceViewModel.handleContinuousDisableGrabDidChange()
        }
    }
    
    var sliderStartedJiggleSpeedValueNodes = [HistorySingleJiggleValueNode]()
    var sliderStartedJigglePowerValueNodes = [HistorySingleJiggleValueNode]()
    var sliderStartedJiggleDampenValueNodes = [HistorySingleJiggleValueNode]()
    
    @discardableResult
    @MainActor
    func attemptCloneJiggle() -> Bool {
        if let clonedJiggle = jiggleDocument.attemptCloneJiggle(displayMode: displayMode,
                                             isGraphEnabled: isGraphEnabled,
                                             jiggleEngine: jiggleEngine) {
            
            timeLineComputeAllChannels(clonedJiggle)
            
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor
    func attemptCloneGuide() -> Bool {
        if jiggleDocument.attemptCloneGuide(displayMode: displayMode,
                                            isGraphEnabled: isGraphEnabled,
                                            jiggleEngine: jiggleEngine) !== nil {
            
            return true
        }
        return false
    }
    
    @MainActor func rotateGuideRight() {
        if let selectedJiggle = getSelectedJiggle() {
            if let selectedGuide = selectedJiggle.getSelectedGuide() {
                
                let fileBufferBefore = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferBefore)
                
                jiggleDocument.rotateGuideRight(selectedJiggle: selectedJiggle,
                                                selectedGuide: selectedGuide,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
                
                let fileBufferAfter = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferAfter)
                
                let selectedGuideIndex = (selectedJiggle.selectedWeightCurveControlIndex - 1)
                historyRecordRotateOrFlipGuide(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                               guideIndex: selectedGuideIndex,
                                               fileBufferBefore: fileBufferBefore,
                                               fileBufferAfter: fileBufferAfter)
            }
        }
    }
    
    @MainActor func rotateGuideLeft() {
        if let selectedJiggle = getSelectedJiggle() {
            if let selectedGuide = selectedJiggle.getSelectedGuide() {
                
                let fileBufferBefore = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferBefore)
                
                jiggleDocument.rotateGuideLeft(selectedJiggle: selectedJiggle,
                                               selectedGuide: selectedGuide,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
                
                let fileBufferAfter = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferAfter)
                
                let selectedGuideIndex = (selectedJiggle.selectedWeightCurveControlIndex - 1)
                historyRecordRotateOrFlipGuide(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                               guideIndex: selectedGuideIndex,
                                               fileBufferBefore: fileBufferBefore,
                                               fileBufferAfter: fileBufferAfter)
            }
        }
    }
    
    @MainActor func flipGuideHorizontal() {
        if let selectedJiggle = getSelectedJiggle() {
            if let selectedGuide = selectedJiggle.getSelectedGuide() {
                let fileBufferBefore = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferBefore)
                jiggleDocument.flipGuideHorizontal(selectedJiggle: selectedJiggle,
                                                   selectedGuide: selectedGuide,
                                                   displayMode: displayMode,
                                                   isGraphEnabled: isGraphEnabled)
                let fileBufferAfter = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferAfter)
                let selectedGuideIndex = (selectedJiggle.selectedWeightCurveControlIndex - 1)
                historyRecordRotateOrFlipGuide(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                               guideIndex: selectedGuideIndex,
                                               fileBufferBefore: fileBufferBefore,
                                               fileBufferAfter: fileBufferAfter)
            }
        }
    }
    
    @MainActor func flipGuideVertical() {
        if let selectedJiggle = getSelectedJiggle() {
            if let selectedGuide = selectedJiggle.getSelectedGuide() {
                let fileBufferBefore = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferBefore)
                jiggleDocument.flipGuideVertical(selectedJiggle: selectedJiggle,
                                                 selectedGuide: selectedGuide,
                                                 displayMode: displayMode,
                                                 isGraphEnabled: isGraphEnabled)
                let fileBufferAfter = FileBuffer()
                selectedGuide.save(fileBuffer: fileBufferAfter)
                let selectedGuideIndex = (selectedJiggle.selectedWeightCurveControlIndex - 1)
                historyRecordRotateOrFlipGuide(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                               guideIndex: selectedGuideIndex,
                                               fileBufferBefore: fileBufferBefore,
                                               fileBufferAfter: fileBufferAfter)
            }
        }
    }
    
    private(set) var isRecordingEnabled = true
    @MainActor func startVideoRecording() {
        if isRecordingEnabled == false {
            isRecordingEnabled = true
            toolInterfaceViewModel.handleRecordingEnabledDidChange()
        }
    }
    
    @MainActor func stopVideoRecording() {
        if isRecordingEnabled == false {
            isRecordingEnabled = true
            //toolInterfaceViewModel.handlRecordingEnabledDidChange()
        }
    }
    
    @MainActor func zoomReset() {
        if isResetZoomActive == false {
            self.isResetZoomActive = true
            cancelAllTouchesAndGestures(touches: [],
                                        points: [])
            resetZoomActiveUpdatePublisher.send(())
            resetZoomAnimationTimeElapsed = 0.0
            
            resetZoomEndScale = jiggleScene.sceneScaleBase
            resetZoomEndX = jiggleScene.sceneTranslationBase.x
            resetZoomEndY = jiggleScene.sceneTranslationBase.y
            
            
            resetZoomStartScale = jiggleScene.sceneScale; resetZoomStartRotation = jiggleScene.sceneRotation
            resetZoomStartX = jiggleScene.sceneTranslation.x; resetZoomStartY = jiggleScene.sceneTranslation.y
        }
    }
    
    @MainActor func zoomJiggle() {
        
        if let selectedJiggle = getSelectedJiggle() {
            if isResetZoomActive == false {
                
                selectedJiggle.refreshOutline()
                if selectedJiggle.outlineJiggleWeightPointCount > 0 {
                    
                    let _point0 = selectedJiggle.outlineJiggleWeightPoints[0].point
                    let point0 = jiggleScene.convertFromSceneToWorld(point: _point0,
                                                                     translation: .zero,
                                                                     scale: 1.0,
                                                                     rotation: -jiggleScene.sceneRotation,
                                                                     frameX: 0.0,
                                                                     frameY: 0.0)
                    
                    var centerMinX = _point0.x
                    var centerMaxX = _point0.x
                    var centerMinY = _point0.y
                    var centerMaxY = _point0.y
                    
                    var scaleMinX = point0.x
                    var scaleMaxX = point0.x
                    var scaleMinY = point0.y
                    var scaleMaxY = point0.y
                    
                    for outlineJiggleWeightPointIndex in 0..<selectedJiggle.outlineJiggleWeightPointCount {
                        let x = selectedJiggle.outlineJiggleWeightPoints[outlineJiggleWeightPointIndex].x
                        let y = selectedJiggle.outlineJiggleWeightPoints[outlineJiggleWeightPointIndex].y
                        
                        centerMinX = min(centerMinX, x)
                        centerMaxX = max(centerMaxX, x)
                        centerMinY = min(centerMinY, y)
                        centerMaxY = max(centerMaxY, y)
                        
                        let point = Point(x: x, y: y)
                        let converted = jiggleScene.convertFromSceneToWorld(point: point,
                                                                            translation: .zero,
                                                                            scale: 1.0,
                                                                            rotation: -jiggleScene.sceneRotation,
                                                                            frameX: 0.0,
                                                                            frameY: 0.0)
                        scaleMinX = min(scaleMinX, converted.x)
                        scaleMaxX = max(scaleMaxX, converted.x)
                        scaleMinY = min(scaleMinY, converted.y)
                        scaleMaxY = max(scaleMaxY, converted.y)
                    }
                    
                    var rangeScaleX = abs(scaleMaxX - scaleMinX)
                    if rangeScaleX < 32.0 { rangeScaleX = 32.0 }
                    
                    var rangeScaleY = abs(scaleMaxY - scaleMinY)
                    if rangeScaleY < 32.0 { rangeScaleY = 32.0 }
                    
                    let appWidth: Float
                    let appHeight: Float
                    switch jiggleDocument.orientation {
                    case .landscape:
                        appWidth = ApplicationController.widthLandscape
                        appHeight = ApplicationController.heightLandscape
                    case .portrait:
                        appWidth = ApplicationController.widthPortrait
                        appHeight = ApplicationController.heightPortrait
                    }
                    
                    if appWidth > 16.0 && appHeight > 16.0 {
                        
                        self.isResetZoomActive = true
                        cancelAllTouchesAndGestures(touches: [], points: [])
                        
                        resetZoomActiveUpdatePublisher.send(())
                        resetZoomAnimationTimeElapsed = 0.0
                        
                        resetZoomStartScale = jiggleScene.sceneScale; resetZoomStartRotation = jiggleScene.sceneRotation
                        resetZoomStartX = jiggleScene.sceneTranslation.x; resetZoomStartY = jiggleScene.sceneTranslation.y
                        
                        let scaleFactorX = rangeScaleX / appWidth
                        let scaleFactorY = rangeScaleY / appHeight
                        let appScale = max(scaleFactorX, scaleFactorY)
                        resetZoomEndScale = (1.0 / appScale)
                        
                        // With this new scale (resetZoomEndScale), we now want
                        // the point (sceneOldCenterX, sceneOldCenterY) centered
                        // at the center of the screen...
                        
                        let screenCenterX = appWidth * 0.5
                        let screenCenterY = appHeight * 0.5
                        let convertedScreenCenter = jiggleScene.convertFromWorldToScene(point: Point(x: screenCenterX,
                                                                                                     y: screenCenterY),
                                                                                        translation: .zero,
                                                                                        scale: resetZoomEndScale,
                                                                                        rotation: 0.0,
                                                                                        frameX: 0.0, frameY: 0.0)
                        
                        let sceneJiggleCenterX = centerMinX + (centerMaxX - centerMinX) * 0.5
                        let sceneJiggleCenterY = centerMinY + (centerMaxY - centerMinY) * 0.5
                        
                        resetZoomEndX = (convertedScreenCenter.x - sceneJiggleCenterX) * resetZoomEndScale
                        resetZoomEndY = (convertedScreenCenter.y - sceneJiggleCenterY) * resetZoomEndScale
                        
                    }
                }
            }
        }
    }
    
    @MainActor func selectNextJiggle() {
        jiggleDocument.selectNextJiggle(displayMode: displayMode,
                                        isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectPreviousJiggle() {
        jiggleDocument.selectPreviousJiggle(displayMode: displayMode,
                                            isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectNextGuide() {
        jiggleDocument.selectNextGuide(displayMode: displayMode,
                                       isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectPreviousGuide() {
        jiggleDocument.selectPreviousGuide(displayMode: displayMode,
                                           isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectNextJigglePoint() {
        jiggleDocument.selectNextJigglePoint(displayMode: displayMode,
                                             isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectPreviousJigglePoint() {
        jiggleDocument.selectPreviousJigglePoint(displayMode: displayMode,
                                                 isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectNextGuidePoint() {
        jiggleDocument.selectNextGuidePoint(displayMode: displayMode,
                                            isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func selectPreviousGuidePoint() {
        jiggleDocument.selectPreviousGuidePoint(displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func rotateJiggleRight() {
        if let selectedJiggle = getSelectedJiggle() {
            
            let fileBufferBefore = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferBefore)
            
            jiggleDocument.rotateJiggleRight(selectedJiggle: selectedJiggle,
                                             displayMode: displayMode,
                                             isGraphEnabled: isGraphEnabled)
            
            let fileBufferAfter = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferAfter)
            
            historyRecordRotateOrFlipJiggle(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                            fileBufferBefore: fileBufferBefore,
                                            fileBufferAfter: fileBufferAfter)
        }
    }
    
    @MainActor func rotateJiggleLeft() {
        if let selectedJiggle = getSelectedJiggle() {
            
            let fileBufferBefore = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferBefore)
            
            jiggleDocument.rotateJiggleLeft(selectedJiggle: selectedJiggle,
                                            displayMode: displayMode,
                                            isGraphEnabled: isGraphEnabled)
            
            let fileBufferAfter = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferAfter)
            
            historyRecordRotateOrFlipJiggle(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                            fileBufferBefore: fileBufferBefore,
                                            fileBufferAfter: fileBufferAfter)
        }
    }
    
    @MainActor func flipJiggleHorizontal() {
        if let selectedJiggle = getSelectedJiggle() {
            
            let fileBufferBefore = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferBefore)
            
            jiggleDocument.flipJiggleHorizontal(selectedJiggle: selectedJiggle,
                                                displayMode: displayMode,
                                                isGraphEnabled: isGraphEnabled)
            
            let fileBufferAfter = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferAfter)
            
            historyRecordRotateOrFlipJiggle(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                            fileBufferBefore: fileBufferBefore,
                                            fileBufferAfter: fileBufferAfter)
        }
    }
    
    @MainActor func flipJiggleVertical() {
        if let selectedJiggle = getSelectedJiggle() {
            
            let fileBufferBefore = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferBefore)
            
            jiggleDocument.flipJiggleVertical(selectedJiggle: selectedJiggle,
                                              displayMode: displayMode,
                                              isGraphEnabled: isGraphEnabled)
            
            let fileBufferAfter = FileBuffer()
            selectedJiggle.save(fileBuffer: fileBufferAfter)
            
            historyRecordRotateOrFlipJiggle(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                            fileBufferBefore: fileBufferBefore,
                                            fileBufferAfter: fileBufferAfter)
        }
    }
    
    
    //var displayMode = DisplayMode.regular
    var displayMode: DisplayMode {
        if isGraphEnabled {
            return .swivel
        } else {
            return .regular
        }
    }
    
    var isGraphMode: Bool {
        if jiggleDocument.isGuidesMode {
            if isGraphEnabled {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    var isVideoRecordEnabled = false
    var isVideoExportEnabled = false
    
    var isPadMenuExpanded = true
    
    var isPhoneTopMenuExpanded = true
    var isPhoneBottomMenuExpanded = true
    
    var isRenderingRegular: Bool
    var isRenderingSwivel: Bool
    
    var isAnimationGrabAppliedToAll = true
    var isAnimationLoopsAppliedToAll = false
    var isAnimationContinuousAppliedToAll = false
    //var isAnimationTwistAppliedToAll = false
    //var isAnimationWobbleAppliedToAll = false
    
    
    @MainActor func isAnyJiggleFrozen() -> Bool {
        jiggleDocument.isAnyJiggleFrozen()
    }
    
    @MainActor func unfreezeAllJiggles() {
        jiggleDocument.unfreezeAllJiggles(displayMode: displayMode,
                                          isGraphEnabled: isGraphEnabled)
        toolInterfaceViewModel.handleFrozenJigglesDidChange()
    }
    
    @MainActor func freezeSelectedJiggle() {
        jiggleDocument.freezeSelectedJiggle(displayMode: displayMode,
                                            isGraphEnabled: isGraphEnabled)
        toolInterfaceViewModel.handleFrozenJigglesDidChange()
    }
    
    @MainActor func unfreezeAllGuides() {
        jiggleDocument.unfreezeAllGuides(displayMode: displayMode,
                                         isGraphEnabled: isGraphEnabled)
        toolInterfaceViewModel.handleFrozenGuidesDidChange()
    }
    
    @MainActor func freezeSelectedGuide() {
        jiggleDocument.freezeSelectedGuide(displayMode: displayMode,
                                           isGraphEnabled: isGraphEnabled)
        toolInterfaceViewModel.handleFrozenGuidesDidChange()
    }
    
    @MainActor func setJiggleOpacity(_ jiggleOpacity: Float) {
        ApplicationController.jiggleOpacity = jiggleOpacity
        jiggleDocument.setJiggleOpacity(jiggleOpacity)
    }
    
    //
    // Architectural Flaw: The view model should not reference the "view layer", instead it
    // should broadcast events, which the view layer receives. We are doing this very frequently
    // with the Combine (tm) publishers on the "model" layer...
    //
    // There are just too many button actions to make a separate publisher for each one,
    // so we are keeping the bad architecture until v1 is released.
    //
    weak var jiggleViewController: JiggleViewController?
    
    static let resetZoomAnimationTime = Float(0.6)
    
    //static let tanFactorJiggleControl = Float(0.3)
    //static let tanFactorJiggleWeightControl = Float(0.3)
    static let tanFactorWeightCurve = Float(0.3)
    static let tanFactorTimeLine = Float(0.325)
    
    static let tanFactorWeightCurveAutoMidde = Float(0.35)
    static let tanFactorWeightCurveAutoStart = Float(0.6)
    static let tanFactorWeightCurveAutoEnd = Float(0.6)
    
    @MainActor func applyMeshCommandAllJiggles(meshCommand: JiggleMeshCommand,
                                    guideCommand: GuideCommand) {
        jiggleDocument.applyMeshCommandAllJiggles(meshCommand: meshCommand,
                                                  guideCommand: guideCommand)
    }
    
    @MainActor func applyMeshCommandOneJiggle(meshCommand: JiggleMeshCommand,
                                   guideCommand: GuideCommand,
                                   jiggle: Jiggle) {
        jiggleDocument.applyMeshCommandOneJiggle(meshCommand: meshCommand,
                                                 guideCommand: guideCommand,
                                                 jiggle: jiggle)
    }
    
    @MainActor func lockShowingState() {
        jiggleDocument.lockShowingState()
    }
    
    @MainActor func unlockShowingState() {
        jiggleDocument.unlockShowingState()
    }
    
    @MainActor lazy var swivelCoordinator: SwivelCoordinator = {
        let camera = jiggleScene.camera
        let result = SwivelCoordinator(camera: camera)
        return result
    }()
    
    typealias Point = Math.Point
    typealias Vector = Math.Vector
    typealias TanType = JiggleDocument.TanType
    
    unowned var gestureView: GestureView?
    
    
    
    @MainActor var isBlocked: Bool {
        toolInterfaceViewModel.isBlocked
    }
    
    @MainActor var isBlockedAnyTransition: Bool {
        toolInterfaceViewModel.isBlockedAnyTransition
    }
    
    @MainActor var isBlockedExceptForHistory: Bool {
        toolInterfaceViewModel.isBlockedExceptForHistory
    }
    
    private(set) var isResetZoomActive = false
    private var resetZoomAnimationTimeElapsed = Float(0.0)
    
    var isStereoscopicEnabled = false
    
    
    var isDisplayTransitionActive: Bool {
        jiggleScene.isDisplayTransitionActiveRegular || jiggleScene.isDisplayTransitionActiveSwivel
    }
    
    var selectedWeightCurveDataUpdateCancellable: AnyCancellable?
    var selectedJiggleDidChangeCancellable: AnyCancellable?
    
    var jigglesDidChangeCancellable: AnyCancellable?
    
    var createJiggleCancellable: AnyCancellable?
    var removeJiggleCancellable: AnyCancellable?
    var transformJiggleCancellable: AnyCancellable?
    var jiggleNumberOfControlPointsCancellable: AnyCancellable?
    
    var createGuideCancellable: AnyCancellable?
    var removeGuideCancellable: AnyCancellable?
    var transformGuideCancellable: AnyCancellable?
    var guideNumberOfControlPointsCancellable: AnyCancellable?
    
    var grabControlPointStopCancellable: AnyCancellable?
    
    var grabGuidePointStopCancellable: AnyCancellable?
    
    var grabWeightCenterStopCancellable: AnyCancellable?
    var grabJiggleCenterStopCancellable: AnyCancellable?
    
    
    var grabWeightCurveControlPointStopCancellable: AnyCancellable?
    var grabWeightCurveControlTanHandleStopCancellable: AnyCancellable?
    
    var animationContinuousDraggingCancellable: AnyCancellable?
    var animationContinuousScaleCancellable: AnyCancellable?
    var animationContinuousRotationCancellable: AnyCancellable?
    var animationContinuousSyncAllCancellable: AnyCancellable?
    
    
    //var zoomEnabledUpdatePublisher = PassthroughSubject<Void, Never>()
    var resetZoomActiveUpdatePublisher = PassthroughSubject<Void, Never>()
    
    //var weightCurveGraphEnabledUpdatePublisher = PassthroughSubject<Void, Never>()
    
    private var resetZoomStartScale = Float(0.0)
    private var resetZoomStartRotation = Float(0.0)
    private var resetZoomStartX = Float(0.0)
    private var resetZoomStartY = Float(0.0)
    
    
    private var resetZoomEndScale = Float(0.0)
    private let resetZoomEndRotation = Float(0.0)
    private var resetZoomEndX = Float(0.0)
    private var resetZoomEndY = Float(0.0)
    
    
    var documentMode: DocumentMode {
        jiggleDocument.documentMode
    }
    
    var weightMode: WeightMode {
        jiggleDocument.weightMode
    }
    
    var orientation: Orientation {
        jiggleDocument.orientation
    }
    
    let sceneWidth: Float
    let sceneHeight: Float
    let jiggleScene: JiggleScene
    let jiggleEngine: JiggleEngine
    let jiggleDocument: JiggleDocument
    let rootViewModel: RootViewModel
    
    var toolInterfaceViewModel: ToolInterfaceViewModel!
    
    @MainActor init(jiggleScene: JiggleScene,
                    jiggleDocument: JiggleDocument,
                    rootViewModel: RootViewModel) {
        self.jiggleScene = jiggleScene
        self.jiggleEngine = jiggleScene.jiggleEngine
        self.jiggleDocument = jiggleDocument
        self.rootViewModel = rootViewModel
        
        switch jiggleDocument.orientation {
        case .landscape:
            sceneWidth = ApplicationController.widthLandscape
            sceneHeight = ApplicationController.heightLandscape
        case .portrait:
            sceneWidth = ApplicationController.widthPortrait
            sceneHeight = ApplicationController.heightPortrait
        }
        
        jiggleDocument.jiggleScene = jiggleScene
        
        let displayMode: DisplayMode
        if isGraphEnabled {
            displayMode = .swivel
        } else {
            displayMode = .regular
        }
        
        if jiggleDocument.isViewMode {
            isRenderingRegular = true
            isRenderingSwivel = false
        } else if jiggleDocument.isGuidesMode {
            switch displayMode {
            case .regular:
                isRenderingRegular = true
                isRenderingSwivel = false
            case .swivel:
                isRenderingRegular = false
                isRenderingSwivel = true
            }
        } else {
            isRenderingRegular = true
            isRenderingSwivel = false
        }
        
        self.toolInterfaceViewModel = ToolInterfaceViewModel(orientation: orientation, jiggleViewModel: self)
        
        ApplicationController.shared.jiggleViewModel = self
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] JiggleViewModel")
        }
    }
    
    @MainActor func publisherLinkUp() {
        
        selectedJiggleDidChangeCancellable = jiggleDocument
            .selectedJiggleDidChangePublisher
            .sink { [weak self] data in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.graphUpdateRelay()
                        self.timeLineUpdateRelay()
                    }
                //}
            }
        
        jigglesDidChangeCancellable = jiggleDocument
            .jigglesDidChangePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        
                        self.handleJigglesDidChange()
                    }
                //}
            }
        
        jiggleNumberOfControlPointsCancellable = jiggleDocument
            .controlPointsDidChangePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        
                        self.handleControlPointsDidChange()
                    }
                //}
            }
        createJiggleCancellable = jiggleDocument
            .createJigglePublisher
            .sink { [weak self] createJiggleData in
                if !createJiggleData.isHistoryAction {
                //Task { @MainActor [weak self] in
                    if let self = self {
                        
                            self.historyRecordCreateJiggle(fileBuffer: createJiggleData.jiggleData)
                        }
                    }
                //}
            }
        
        createGuideCancellable = jiggleDocument
            .createGuidePublisher
            .sink { [weak self] createGuideData in
                if !createGuideData.isHistoryAction {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            if let jiggleIndex = createGuideData.jiggleIndex {
                                self.historyRecordCreateGuide(jiggleIndex: jiggleIndex,
                                                              fileBuffer: createGuideData.guideData)
                            }
                        }
                    }
                
            }
        
        removeJiggleCancellable = jiggleDocument
            .removeJigglePublisher
            .sink { [weak self] removeJiggleData in
                if !removeJiggleData.isHistoryAction {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            
                            if let jiggleIndex = removeJiggleData.jiggleIndex {
                                self.historyRecordRemoveJiggle(fileBuffer: removeJiggleData.jiggleData,
                                                               jiggleIndex: jiggleIndex)
                            }
                        }
                    }
                //}
            }
        
        removeGuideCancellable = jiggleDocument
            .removeGuidePublisher
            .sink { [weak self] removeGuideData in
                if !removeGuideData.isHistoryAction {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            
                            if let jiggleIndex = removeGuideData.jiggleIndex,
                               let weightCurveIndex = removeGuideData.weightCurveIndex {
                                self.historyRecordDeleteGuide(jiggleIndex: jiggleIndex,
                                                              weightCurveIndex: weightCurveIndex,
                                                              fileBuffer: removeGuideData.guideData)
                            }
                            
                        }
                    //}
                }
            }
        
        transformJiggleCancellable = jiggleDocument
            .transformJigglePublisher
            .sink { [weak self] transformJiggleData in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        if let jiggleIndex = transformJiggleData.jiggleIndex {
                            historyRecordTransformJiggle(jiggleIndex: jiggleIndex, data: transformJiggleData)
                        }
                    }
                
            }
        
        transformGuideCancellable = jiggleDocument
            .transformGuidePublisher
            .sink { [weak self] transformJiggleData in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        if let jiggleIndex = transformJiggleData.jiggleIndex,
                           let weightCurveIndex = transformJiggleData.weightCurveIndex {
                            historyRecordTransformGuide(jiggleIndex: jiggleIndex,
                                                        weightCurveIndex: weightCurveIndex,
                                                        data: transformJiggleData)
                        }
                    }
                //}
            }
        
        grabControlPointStopCancellable = jiggleDocument
            .grabControlPointStopPublisher
            .sink { [weak self] grabControlPointData in
                if grabControlPointData.didChange {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            
                            if let jiggleIndex = grabControlPointData.jiggleIndex, let controlPointIndex = grabControlPointData.controlPointIndex {
                                let startPoint = Point(x: grabControlPointData.startX,
                                                       y: grabControlPointData.startY)
                                let endPoint = Point(x: grabControlPointData.endX,
                                                     y: grabControlPointData.endY)
                                self.historyRecordMoveControlPoint(jiggleIndex: jiggleIndex,
                                                                   controlPointIndex: controlPointIndex,
                                                                   startPoint: startPoint,
                                                                   endPoint: endPoint)
                            }
                        }
                    //}
                }
            }
        
        grabGuidePointStopCancellable = jiggleDocument
            .grabGuidePointStopPublisher
            .sink { [weak self] grabGuidePointData in
                if grabGuidePointData.didChange {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            
                            let startPoint = Point(x: grabGuidePointData.startX,
                                                   y: grabGuidePointData.startY)
                            let endPoint = Point(x: grabGuidePointData.endX,
                                                 y: grabGuidePointData.endY)
                            if let jiggleIndex = grabGuidePointData.jiggleIndex,
                               let weightCurveIndex = grabGuidePointData.weightCurveIndex,
                               let weightControlPointIndex = grabGuidePointData.weightControlPointIndex {
                                self.historyRecordMoveGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                        weightCurveIndex: weightCurveIndex,
                                                                        guideControlPointIndex: weightControlPointIndex,
                                                                        startPoint: startPoint,
                                                                        endPoint: endPoint)
                            }
                        }
                    //}
                }
            }
        
        grabWeightCenterStopCancellable = jiggleDocument
            .grabWeightCenterStopPublisher
            .sink { [weak self] grabWeightCenterData in
                if grabWeightCenterData.didChange {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            
                            let startPoint = Point(x: grabWeightCenterData.startX,
                                                   y: grabWeightCenterData.startY)
                            let endPoint = Point(x: grabWeightCenterData.endX,
                                                 y: grabWeightCenterData.endY)
                            if let jiggleIndex = grabWeightCenterData.jiggleIndex {
                                self.historyRecordMoveWeightCenter(jiggleIndex: jiggleIndex,
                                                                   startCenter: startPoint,
                                                                   endCenter: endPoint)
                            }
                        }
                    //}
                }
            }
        
        grabJiggleCenterStopCancellable = jiggleDocument
            .grabJiggleCenterStopPublisher
            .sink { [weak self] grabJiggleCenterData in
                if grabJiggleCenterData.didChange {
                    //Task { @MainActor [weak self] in
                        if let self = self {
                            
                            let startPoint = Point(x: grabJiggleCenterData.startX,
                                                   y: grabJiggleCenterData.startY)
                            let endPoint = Point(x: grabJiggleCenterData.endX,
                                                 y: grabJiggleCenterData.endY)
                            if let jiggleIndex = grabJiggleCenterData.jiggleIndex {
                                self.historyRecordMoveJiggleCenter(jiggleIndex: jiggleIndex,
                                                                   startCenter: startPoint,
                                                                   endCenter: endPoint)
                            }
                        }
                    //}
                }
            }
        
        animationContinuousDraggingCancellable = jiggleDocument
            .animationContinuousDraggingPublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        if let toolInterfaceViewModel = self.toolInterfaceViewModel {
                            toolInterfaceViewModel.handleContinuousAngleDidChange()
                            toolInterfaceViewModel.handleContinuousPowerDidChange()
                        }
                    }
                //}
            }
        
        animationContinuousScaleCancellable = jiggleDocument
            .animationContinuousScalePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        if let toolInterfaceViewModel = self.toolInterfaceViewModel {
                            toolInterfaceViewModel.handleContinuousStartScaleDidChange()
                        }
                    }
                //}
            }
        
        animationContinuousRotationCancellable = jiggleDocument
            .animationContinuousRotationPublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        if let toolInterfaceViewModel = self.toolInterfaceViewModel {
                            toolInterfaceViewModel.handleContinuousStartRotationDidChange()
                        }
                    }
                //}
            }
        
        animationContinuousSyncAllCancellable = jiggleDocument
            .animationContinuousSyncAllPublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        if let toolInterfaceViewModel = self.toolInterfaceViewModel {
                            toolInterfaceViewModel.handleContinuousAngleDidChange()
                            toolInterfaceViewModel.handleContinuousPowerDidChange()
                            toolInterfaceViewModel.handleContinuousStartScaleDidChange()
                            toolInterfaceViewModel.handleContinuousEndScaleDidChange()
                            toolInterfaceViewModel.handleContinuousStartRotationDidChange()
                            toolInterfaceViewModel.handleContinuousEndRotationDidChange()
                            
                            // Shouldn't need these 3?
                            toolInterfaceViewModel.handleContinuousDurationDidChange()
                            toolInterfaceViewModel.handleContinuousSwoopDidChange()
                            toolInterfaceViewModel.handleContinuousFrameOffsetDidChange()
                        }
                    }
                //}
            }
        
        if let jiggleViewController = jiggleViewController {
            
            let grabWeightCurveControlPointStopPublisher: PassthroughSubject<JiggleDocumentPublisherLibrary.GrabWeightCurveControlPointData, Never>
            let grabWeightCurveControlTanHandleStopPublisher: PassthroughSubject<JiggleDocumentPublisherLibrary.GrabWeightCurveControlTanHandleData, Never>
            if Device.isPad {
                grabWeightCurveControlPointStopPublisher = jiggleViewController.padDraggableMenu.standardContainerView.graphContainerView.graphView.grabWeightCurveControlPointStopPublisher
                grabWeightCurveControlTanHandleStopPublisher = jiggleViewController.padDraggableMenu.standardContainerView.graphContainerView.graphView.grabWeightCurveControlTanHandleStopPublisher
            } else {
                grabWeightCurveControlPointStopPublisher = jiggleViewController.phoneTopMenu.standardContainerView.graphContainerView.graphView.grabWeightCurveControlPointStopPublisher
                grabWeightCurveControlTanHandleStopPublisher = jiggleViewController.phoneTopMenu.standardContainerView.graphContainerView.graphView.grabWeightCurveControlTanHandleStopPublisher
            }
            
            grabWeightCurveControlPointStopCancellable = grabWeightCurveControlPointStopPublisher
                .sink { [weak self] grabWeightCurveControlPointData in
                    if grabWeightCurveControlPointData.didChange {
                        //Task { @MainActor [weak self] in
                            if let self = self {
                                
                                if let jiggleIndex = grabWeightCurveControlPointData.jiggleIndex {
                                    if let guideIndex = grabWeightCurveControlPointData.guideIndex {
                                        self.historyRecordMoveWeightGraphPosition(jiggleIndex: jiggleIndex,
                                                                                  isFirstControlPoint: grabWeightCurveControlPointData.isFirstControlPoint,
                                                                                  isLastControlPoint: grabWeightCurveControlPointData.isLastControlPoint,
                                                                                  guideIndex: guideIndex,
                                                                                  startHeightManual: grabWeightCurveControlPointData.startManual,
                                                                                  startHeightFactor: grabWeightCurveControlPointData.startHeightFactor,
                                                                                  endHeightFactor: grabWeightCurveControlPointData.endHeightFactor)
                                        
                                    } else if (grabWeightCurveControlPointData.isFirstControlPoint || grabWeightCurveControlPointData.isLastControlPoint) {
                                        self.historyRecordMoveWeightGraphPosition(jiggleIndex: jiggleIndex,
                                                                                  isFirstControlPoint: grabWeightCurveControlPointData.isFirstControlPoint,
                                                                                  isLastControlPoint: grabWeightCurveControlPointData.isLastControlPoint,
                                                                                  guideIndex: -1,
                                                                                  startHeightManual: grabWeightCurveControlPointData.startManual,
                                                                                  startHeightFactor: grabWeightCurveControlPointData.startHeightFactor,
                                                                                  endHeightFactor: grabWeightCurveControlPointData.endHeightFactor)
                                    }
                                }
                            }
                        //}
                    }
                }
            
            grabWeightCurveControlTanHandleStopCancellable = grabWeightCurveControlTanHandleStopPublisher
                .sink { [weak self] grabWeightCurveControlTanHandleData in
                    if grabWeightCurveControlTanHandleData.didChange {
                        //Task { @MainActor [weak self] in
                            if let self = self {
                                
                                if let jiggleIndex = grabWeightCurveControlTanHandleData.jiggleIndex {
                                    
                                    if let guideIndex = grabWeightCurveControlTanHandleData.guideIndex {
                                        self.historyRecordMoveWeightGraphTangent(jiggleIndex: jiggleIndex,
                                                                                 isFirstControlPoint: grabWeightCurveControlTanHandleData.isFirstControlPoint,
                                                                                 isLastControlPoint: grabWeightCurveControlTanHandleData.isLastControlPoint,
                                                                                 guideIndex: guideIndex,
                                                                                 tanType: grabWeightCurveControlTanHandleData.startType,
                                                                                 startTangentManual: grabWeightCurveControlTanHandleData.startManual,
                                                                                 startDirection: grabWeightCurveControlTanHandleData.startDirection,
                                                                                 startMagnitudeIn: grabWeightCurveControlTanHandleData.startMagnitudeIn,
                                                                                 startMagnitudeOut: grabWeightCurveControlTanHandleData.startMagnitudeOut,
                                                                                 endDirection: grabWeightCurveControlTanHandleData.endDirection,
                                                                                 endMagnitudeIn: grabWeightCurveControlTanHandleData.endMagnitudeIn,
                                                                                 endMagnitudeOut: grabWeightCurveControlTanHandleData.endMagnitudeOut)
                                    } else if (grabWeightCurveControlTanHandleData.isFirstControlPoint || grabWeightCurveControlTanHandleData.isLastControlPoint) {
                                        self.historyRecordMoveWeightGraphTangent(jiggleIndex: jiggleIndex,
                                                                                 isFirstControlPoint: grabWeightCurveControlTanHandleData.isFirstControlPoint,
                                                                                 isLastControlPoint: grabWeightCurveControlTanHandleData.isLastControlPoint,
                                                                                 guideIndex: -1,
                                                                                 tanType: grabWeightCurveControlTanHandleData.startType,
                                                                                 startTangentManual: grabWeightCurveControlTanHandleData.startManual,
                                                                                 startDirection: grabWeightCurveControlTanHandleData.startDirection,
                                                                                 startMagnitudeIn: grabWeightCurveControlTanHandleData.startMagnitudeIn,
                                                                                 startMagnitudeOut: grabWeightCurveControlTanHandleData.startMagnitudeOut,
                                                                                 endDirection: grabWeightCurveControlTanHandleData.endDirection,
                                                                                 endMagnitudeIn: grabWeightCurveControlTanHandleData.endMagnitudeIn,
                                                                                 endMagnitudeOut: grabWeightCurveControlTanHandleData.endMagnitudeOut)
                                    }
                                }
                            }
                        //}
                    }
                }
        }
    }
    
    var autoSaveTimer = Float(0.0)
    @MainActor func update(deltaTime: Float) {
        
        var isStereoscopicEnabled = false
        if let jiggleViewController = jiggleViewController {
            isStereoscopicEnabled = jiggleViewController.isStereoscopicEnabled
        }
        
        let untransformScale: Float
        if jiggleScene.sceneScale > Math.epsilon {
            untransformScale = jiggleScene.sceneScale
        } else {
            untransformScale = 1.0
        }
        
        let isTransitionActive = (jiggleScene.isDisplayTransitionActiveRegular || jiggleScene.isDisplayTransitionActiveSwivel)
        
        let animatonMode = _getAnimationMode()
        jiggleDocument.update(deltaTime: deltaTime,
                              displayMode: displayMode,
                              weightMode: weightMode,
                              isStereoscopicEnabled: isStereoscopicEnabled,
                              untransformScale: untransformScale,
                              isGraphEnabled: isGraphEnabled,
                              isTransitionActive: isTransitionActive,
                              animationMode: animatonMode)
        
        swivelCoordinator.update(deltaTime: deltaTime,
                                 jiggle: getSelectedJiggle())
        
        autoSaveTimer += deltaTime
        if autoSaveTimer >= 5.0 {
            autoSaveTimer -= 5.0
            _ = jiggleDocument.writeSceneFileToRecent()
        }
        
        if isResetZoomActive {
            resetZoomAnimationTimeElapsed += deltaTime
            if resetZoomAnimationTimeElapsed >= Self.resetZoomAnimationTime {
                jiggleScene.sceneScale = resetZoomEndScale
                jiggleScene.sceneRotation = resetZoomEndRotation
                jiggleScene.sceneTranslation.x = resetZoomEndX
                jiggleScene.sceneTranslation.y = resetZoomEndY
                isResetZoomActive = false
                resetZoomActiveUpdatePublisher.send(())
            } else {
                var percent = resetZoomAnimationTimeElapsed / Self.resetZoomAnimationTime
                percent = sinf(Float(percent * (Math.pi_2)))
                if percent < 0.0 { percent = 0.0 }
                if percent > 1.0 { percent = 1.0 }
                let rotationDistance = Math.distanceBetweenAngles(resetZoomStartRotation, resetZoomEndRotation)
                jiggleScene.sceneRotation = resetZoomStartRotation + (rotationDistance * percent)
                jiggleScene.sceneScale = resetZoomStartScale + (resetZoomEndScale - resetZoomStartScale) * percent
                jiggleScene.sceneTranslation.x = resetZoomStartX + (resetZoomEndX - resetZoomStartX) * percent
                jiggleScene.sceneTranslation.y = resetZoomStartY + (resetZoomEndY - resetZoomStartY) * percent
            }
        }
    }
    
    @MainActor func setAnimationGrabAppliedToAll(_ isAnimationGrabAppliedToAll: Bool) {
        self.isAnimationGrabAppliedToAll = isAnimationGrabAppliedToAll
        toolInterfaceViewModel.handleAnimationGrabAppliedToAllDidChange()
    }
    
    @MainActor func setAnimationLoopsAppliedToAll(_ isAnimationLoopsAppliedToAll: Bool) {
        print("isAnimationLoopsAppliedToAll => \(isAnimationLoopsAppliedToAll)")
        self.isAnimationLoopsAppliedToAll = isAnimationLoopsAppliedToAll
        toolInterfaceViewModel.handleAnimationLoopsAppliedToAllDidChange()
    }
    
    @MainActor func setAnimationContinuousAppliedToAll(_ isAnimationContinuousAppliedToAll: Bool) {
        print("setAnimationContinuousAppliedToAll => \(isAnimationContinuousAppliedToAll)")
        self.isAnimationContinuousAppliedToAll = isAnimationContinuousAppliedToAll
        toolInterfaceViewModel.handleAnimationContinuousAppliedToAllDidChange()
    }
    
    func setResetZoomActive() {
        
    }
    
    
    enum DisplayStackingCategory {
        case horizontal
        case vertical
    }
    
    func getSelectedJiggle() -> Jiggle? {
        return jiggleDocument.getSelectedJiggle()
    }
    
    func getSelectedGuide() -> Guide? {
        return jiggleDocument.getSelectedGuide()
    }
    
    @discardableResult
    @MainActor func attemptDeleteSelectedJiggle(isHistoryAction: Bool) -> Bool {
        if jiggleDocument.attemptDeleteSelectedJiggle(isHistoryAction: isHistoryAction,
                                                      displayMode: displayMode,
                                                      isGraphEnabled: isGraphEnabled) {
            return true
        }
        return false
    }
    
    @MainActor func selectAnyJiggleIfNoneSelected() {
        jiggleDocument.selectAnyJiggleIfNoneSelected(displayMode: displayMode,
                                                     isGraphEnabled: isGraphEnabled)
    }
    
    var isAnyJigglePresent: Bool {
        if jiggleDocument.jiggleCount > 0 {
            return true
        }
        return false
    }
    
    @MainActor func cancelAllTouchesAndGestures(touches: [UITouch], points: [Math.Point]) {
        if let gestureView = gestureView {
            gestureView.cancelAllGestureRecognizers()
            gestureView.cancelAllTouches(touches: [],
                                         points: [])
        }
    }
    
    @discardableResult
    @MainActor func attemptJiggleAffineSelectWithTouch(at point: Point) -> Bool {
        if jiggleDocument.attemptJiggleAffineSelectWithTouch(at: point,
                                                             displayMode: displayMode,
                                                             isGraphEnabled: isGraphEnabled) {
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptGuideAffineSelectWithTouch(at point: Point) -> Bool {
        if jiggleDocument.attemptGuideAffineSelectWithTouch(at: point,
                                                            displayMode: displayMode,
                                                            isGraphEnabled: isGraphEnabled) {
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptCreateJiggleStandard(at point: Point) -> Bool {
        if jiggleDocument.attemptCreateJiggle(at: point,
                                              jiggleEngine: jiggleEngine,
                                              displayMode: displayMode,
                                              isGraphEnabled: isGraphEnabled) {
            if let selectedJiggle = getSelectedJiggle() {
                timeLineComputeAllChannels(selectedJiggle)
            }
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptCreateControlPoint(at point: Point) -> Bool {
        if jiggleDocument.attemptCreateControlPoint(point,
                                                    displayMode: displayMode,
                                                    isGraphEnabled: isGraphEnabled) {
            if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                historyRecordCreateControlPoint(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                                controlPointIndex: selectedJiggle.selectedJiggleControlPointIndex)
            }
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptRemoveControlPoint(at point: Point, sceneScaleBase: Float) -> Bool {
        if let attemptRemoveControlPointResult = jiggleDocument.attemptRemoveControlPoint(point,
                                                                                          sceneScaleBase: sceneScaleBase,
                                                                                          displayMode: displayMode,
                                                                                          isGraphEnabled: isGraphEnabled) {
            historyRecordRemoveControlPoint(jiggleIndex: attemptRemoveControlPointResult.jiggleIndex,
                                            controlPointIndex: attemptRemoveControlPointResult.controlPointIndex,
                                            point: attemptRemoveControlPointResult.point)
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptDeleteSelectedJigglePoint() -> Bool {
        if let attemptRemoveControlPointResult = jiggleDocument.attemptDeleteSelectedJigglePoint(displayMode: displayMode,
                                                                                                 isGraphEnabled: isGraphEnabled) {
            historyRecordRemoveControlPoint(jiggleIndex: attemptRemoveControlPointResult.jiggleIndex,
                                            controlPointIndex: attemptRemoveControlPointResult.controlPointIndex,
                                            point: attemptRemoveControlPointResult.point)
            return true
        }
        return false
    }
    
    @MainActor func attemptCreateGuidesFromSplines(splines: [ManualSpline],
                                        isUntransformRequired: Bool,
                                        isFixWeightCenterRequired: Bool) -> Bool {
        if jiggleDocument.createGuidesFromSplines(splines: splines,
                                                  jiggleEngine: jiggleEngine,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled,
                                                  isUntransformRequired: isUntransformRequired,
                                                  isFixWeightCenterRequired: isFixWeightCenterRequired) {
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptCreateGuide(at point: Point) -> Bool {
        if jiggleDocument.attemptCreateGuide(point,
                                             jiggleEngine: jiggleEngine,
                                             displayMode: displayMode,
                                             isGraphEnabled: isGraphEnabled) {
            jiggleDocument.refreshWeightCurve()
            graphUpdateRelay()
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptRemoveSelectedGuide(isHistoryAction: Bool) -> Bool {
        if jiggleDocument.attemptRemoveSelectedGuide(isHistoryAction: isHistoryAction,
                                                     displayMode: displayMode,
                                                     isGraphEnabled: isGraphEnabled) {
            jiggleDocument.refreshWeightCurve()
            graphUpdateRelay()
            
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptCreateGuidePoint(at point: Point) -> Bool {
        if jiggleDocument.attemptCreateGuidePoint(point,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled) {
            if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
                if let selectedGuide = selectedJiggle.getSelectedGuide() {
                    if let selectedJiggleControlPoint = selectedGuide.getSelectedJiggleControlPoint() {
                        historyRecordCreateGuideControlPoint(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                                             weightCurveIndex: selectedJiggle.selectedWeightCurveControlIndex,
                                                             guideControlPointIndex: selectedGuide.selectedJiggleControlPointIndex,
                                                             point: selectedJiggleControlPoint.point)
                    }
                }
            }
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptRemoveGuidePoint(at point: Point, sceneScaleBase: Float) -> Bool {
        if let attemptRemoveControlPointResult = jiggleDocument.attemptDeleteGuideControlPoint(point,
                                                                                               sceneScaleBase: sceneScaleBase,
                                                                                               displayMode: displayMode,
                                                                                               isGraphEnabled: isGraphEnabled) {
            historyRecordDeleteGuideControlPoint(jiggleIndex: attemptRemoveControlPointResult.jiggleIndex,
                                                 weightCurveIndex: attemptRemoveControlPointResult.weightCurveIndex,
                                                 guideControlPointIndex: attemptRemoveControlPointResult.guideControlPointIndex,
                                                 point: attemptRemoveControlPointResult.point)
            
            return true
        }
        return false
    }
    
    @discardableResult
    @MainActor func attemptDeleteSelectedGuidePoint() -> Bool {
        if let attemptRemoveControlPointResult = jiggleDocument.attemptRemoveSelectedGuideControlPoint(displayMode: displayMode,
                                                                                                       isGraphEnabled: isGraphEnabled) {
            historyRecordDeleteGuideControlPoint(jiggleIndex: attemptRemoveControlPointResult.jiggleIndex,
                                                 weightCurveIndex: attemptRemoveControlPointResult.weightCurveIndex,
                                                 guideControlPointIndex: attemptRemoveControlPointResult.guideControlPointIndex,
                                                 point: attemptRemoveControlPointResult.point)
            return true
        }
        return false
    }
    
    
    
    @discardableResult
    @MainActor func attemptResetWeightGraph() -> Bool {
        if let selectedJiggle = jiggleDocument.getSelectedJiggle() {
            typealias StorageNode = HistoryStateResetWeightGraph.StorageNode
            var storageNodes = [StorageNode]()
            let weightCurveControlPointStart = selectedJiggle.weightCurveControlPointStart
            let storageNodeStart = StorageNode(startHeightManual: weightCurveControlPointStart.isManualHeightEnabled,
                                               startHeightFactor: weightCurveControlPointStart.normalizedHeightFactor,
                                               startTangentManual: weightCurveControlPointStart.isManualTanHandleEnabled,
                                               startDirection: weightCurveControlPointStart.normalizedTanDirection,
                                               startMagnitudeIn: weightCurveControlPointStart.normalizedTanMagnitudeIn,
                                               startMagnitudeOut: weightCurveControlPointStart.normalizedTanMagnitudeOut)
            storageNodes.append(storageNodeStart)
            for guideIndex in 0..<selectedJiggle.guideCount {
                let guide = selectedJiggle.guides[guideIndex]
                let weightCurveControlPoint = guide.weightCurveControlPoint
                let storageNode = StorageNode(startHeightManual: weightCurveControlPoint.isManualHeightEnabled,
                                              startHeightFactor: weightCurveControlPoint.normalizedHeightFactor,
                                              startTangentManual: weightCurveControlPoint.isManualTanHandleEnabled,
                                              startDirection: weightCurveControlPoint.normalizedTanDirection,
                                              startMagnitudeIn: weightCurveControlPoint.normalizedTanMagnitudeIn,
                                              startMagnitudeOut: weightCurveControlPoint.normalizedTanMagnitudeOut)
                storageNodes.append(storageNode)
            }
            let weightCurveControlPointEnd = selectedJiggle.weightCurveControlPointEnd
            let storageNodeEnd = StorageNode(startHeightManual: weightCurveControlPointEnd.isManualHeightEnabled,
                                             startHeightFactor: weightCurveControlPointEnd.normalizedHeightFactor,
                                             startTangentManual: weightCurveControlPointEnd.isManualTanHandleEnabled,
                                             startDirection: weightCurveControlPointEnd.normalizedTanDirection,
                                             startMagnitudeIn: weightCurveControlPointEnd.normalizedTanMagnitudeIn,
                                             startMagnitudeOut: weightCurveControlPointEnd.normalizedTanMagnitudeOut)
            storageNodes.append(storageNodeEnd)
            if jiggleDocument.attemptResetWeightGraph(displayMode: displayMode,
                                                      isGraphEnabled: isGraphEnabled) {
                historyRecordResetWeightGraph(jiggleIndex: jiggleDocument.selectedJiggleIndex,
                                              storageNodes: storageNodes)
                
                graphUpdateRelay()
                
                return true
            }
        }
        return false
    }
    
    @MainActor func attemptGrabDrawJiggles(touch: UITouch,
                                at point: Point) {
        _ = jiggleDocument.attemptGrabDrawJiggles(touch: touch,
                                                  at: point)
    }
    
    @MainActor func attemptGrabDrawGuides(touch: UITouch,
                               at point: Point) {
        _ = jiggleDocument.attemptGrabDrawGuides(touch: touch,
                                                 at: point)
    }
    
    @MainActor func attemptUpdateDrawJiggles(touch: UITouch,
                                  at point: Point,
                                  isFromRelease: Bool) {
        _ = jiggleDocument.attemptUpdateDrawJiggles(touch: touch,
                                                    at: point,
                                                    baseAdjustScale: jiggleScene.baseAdjustScale,
                                                    isFromRelease: isFromRelease)
    }
    
    @MainActor func attemptUpdateDrawGuides(touch: UITouch,
                                 at point: Point,
                                 isFromRelease: Bool) {
        _ = jiggleDocument.attemptUpdateDrawGuides(touch: touch,
                                                   at: point,
                                                   baseAdjustScale: jiggleScene.baseAdjustScale,
                                                   isFromRelease: isFromRelease)
    }
    
    @MainActor func attemptReleaseDrawJiggles(touch: UITouch,
                                   at point: Point) {
        if jiggleDocument.attemptReleaseDrawJiggles(touch: touch,
                                                    at: point,
                                                    jiggleEngine: jiggleEngine,
                                                    displayMode: displayMode,
                                                    isGraphEnabled: isGraphEnabled) {
            if let selectedJiggle = getSelectedJiggle() {
                timeLineComputeAllChannels(selectedJiggle)
            }
        }
    }
    
    @MainActor func attemptReleaseDrawGuides(touch: UITouch,
                                  at point: Point) {
        _ = jiggleDocument.attemptReleaseDrawGuides(touch: touch,
                                                    at: point,
                                                    jiggleEngine: jiggleEngine,
                                                    displayMode: displayMode,
                                                    isGraphEnabled: isGraphEnabled)
    }
    
    private func _getAnimationMode() -> AnimatonMode {
        
        switch jiggleDocument.documentMode {
        case .view:
            if jiggleDocument.isAnimationLoopsEnabled {
                return .loops
            } else if jiggleDocument.isAnimationContinuousEnabled {
                return .continuous
            } else {
                return .grab
            }
        case .edit:
            return .unknown
        }
    }
    
    @MainActor func attemptTouchesBegan_ViewMode_Yes(touches: [UITouch],
                                                     at points: [Point],
                                                     allTouchCount: Int) {
        let animatonMode = _getAnimationMode()
        switch animatonMode {
        case .grab:
            jiggleDocument.attemptTouchesBegan_ViewMode_Grab(touches: touches,
                                                             at: points,
                                                             allTouchCount: allTouchCount,
                                                             displayMode: displayMode,
                                                             isGraphEnabled: isGraphEnabled)
        case .continuous:
            jiggleDocument.attemptTouchesBegan_ViewMode_Continuous(touches: touches,
                                                                   at: points,
                                                                   allTouchCount: allTouchCount,
                                                                   displayMode: displayMode,
                                                                   isGraphEnabled: isGraphEnabled)
        case .loops:
            jiggleDocument.attemptTouchesBegan_ViewMode_Loops(touches: touches,
                                                              at: points,
                                                              allTouchCount: allTouchCount,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled)
        case .unknown:
            jiggleDocument.attemptKillDragAll_ViewMode()
        }
    }
    
    @MainActor func attemptTouchesBegan_ViewMode_No(touches: [UITouch],
                                                    at points: [Point],
                                                    allTouchCount: Int) {
        jiggleDocument.attemptKillDragAll_ViewMode()
    }
    
    @MainActor func attemptTouchesMoved_ViewMode_Yes(touches: [UITouch],
                                                     at points: [Point],
                                                     allTouchCount: Int) {
        
        let animatonMode = _getAnimationMode()
        switch animatonMode {
        case .grab:
            jiggleDocument.attemptTouchesMoved_ViewMode_Grab(touches: touches,
                                                             at: points,
                                                             allTouchCount: allTouchCount,
                                                             displayMode: displayMode,
                                                             isGraphEnabled: isGraphEnabled)
        case .continuous:
            jiggleDocument.attemptTouchesMoved_ViewMode_Continuous(touches: touches,
                                                                   at: points,
                                                                   allTouchCount: allTouchCount,
                                                                   displayMode: displayMode,
                                                                   isGraphEnabled: isGraphEnabled)
        case .loops:
            jiggleDocument.attemptTouchesMoved_ViewMode_Loops(touches: touches,
                                                              at: points,
                                                              allTouchCount: allTouchCount,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled)
        case .unknown:
            jiggleDocument.attemptKillDragAll_ViewMode()
        }
    }
    
    @MainActor func attemptTouchesMoved_ViewMode_No(touches: [UITouch],
                                                    at points: [Point],
                                                    allTouchCount: Int) {
        jiggleDocument.attemptKillDragAll_ViewMode()
    }
    
    @MainActor func attemptTouchesEnded_ViewMode_Yes(touches: [UITouch],
                                                     at points: [Point],
                                                     allTouchCount: Int) {
        let untransformScale: Float
        if jiggleScene.sceneScale > Math.epsilon {
            untransformScale = jiggleScene.sceneScale
        } else {
            untransformScale = 1.0
        }
        
        let animatonMode = _getAnimationMode()
        switch animatonMode {
        case .grab:
            jiggleDocument.attemptTouchesEnded_ViewMode_Grab(touches: touches,
                                                             at: points,
                                                             allTouchCount: allTouchCount,
                                                             displayMode: displayMode,
                                                             isGraphEnabled: isGraphEnabled,
                                                             untransformScale: untransformScale)
        case .continuous:
            jiggleDocument.attemptTouchesEnded_ViewMode_Continuous(touches: touches,
                                                                   at: points,
                                                                   allTouchCount: allTouchCount,
                                                                   displayMode: displayMode,
                                                                   isGraphEnabled: isGraphEnabled,
                                                                   untransformScale: untransformScale)
        case .loops:
            jiggleDocument.attemptTouchesEnded_ViewMode_Loops(touches: touches,
                                                              at: points,
                                                              allTouchCount: allTouchCount,
                                                              displayMode: displayMode,
                                                              isGraphEnabled: isGraphEnabled,
                                                              untransformScale: untransformScale)
        case .unknown:
            jiggleDocument.attemptKillDragAll_ViewMode()
        }
    }
    
    @MainActor func attemptTouchesEnded_ViewMode_No(touches: [UITouch],
                                                    at points: [Point],
                                                    allTouchCount: Int) {
        jiggleDocument.attemptKillDragAll_ViewMode()
    }
    
    @MainActor func attemptGrabControlPoint(touch: UITouch,
                                            at point: Point,
                                            sceneScaleBase: Float) {
        jiggleDocument.attemptGrabControlPoint(touch: touch,
                                               at: point,
                                               sceneScaleBase: sceneScaleBase,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func attemptGrabGuidePoint(touch: UITouch,
                                          at point: Point,
                                          sceneScaleBase: Float) {
        jiggleDocument.attemptGrabGuidePoint(touch: touch,
                                             at: point,
                                             sceneScaleBase: sceneScaleBase,
                                             displayMode: displayMode,
                                             isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func attemptUpdateControlPoint(touch: UITouch,
                                              at point: Point,
                                              isFromRelease: Bool) {
        jiggleDocument.attemptUpdateControlPoint(touch: touch,
                                                 at: point,
                                                 isFromRelease: isFromRelease,
                                                 displayMode: displayMode,
                                                 isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func attemptUpdateGuidePoint(touch: UITouch,
                                            at point: Point,
                                            isFromRelease: Bool) {
        jiggleDocument.attemptUpdateGuidePoint(touch: touch,
                                               at: point,
                                               isFromRelease: isFromRelease,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func attemptReleaseControlPoint(touch: UITouch,
                                               at point: Point) {
        jiggleDocument.attemptReleaseControlPoint(touch: touch,
                                                  at: point)
    }
    
    @MainActor func attemptReleaseGuidePoint(touch: UITouch,
                                             at point: Point) {
        jiggleDocument.attemptReleaseGuidePoint(touch: touch,
                                                at: point)
    }
    
    @MainActor func attemptGrabWeightCenter(touch: UITouch,
                                            at point: Point,
                                            sceneScaleBase: Float) {
        jiggleDocument.attemptGrabWeightCenter(touch: touch,
                                               at: point,
                                               sceneScaleBase: sceneScaleBase,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func attemptUpdateWeightCenter(touch: UITouch,
                                              at point: Point,
                                              isFromRelease: Bool) {
        jiggleDocument.attemptUpdateWeightCenter(touch: touch,
                                                 at: point,
                                                 isFromRelease: isFromRelease)
    }
    
    @MainActor func attemptReleaseWeightCenter(touch: UITouch,
                                               at point: Point) {
        jiggleDocument.attemptReleaseWeightCenter(touch: touch,
                                                  at: point)
    }
    
    @MainActor func attemptGrabJiggleCenter(touch: UITouch,
                                            at point: Point,
                                            sceneScaleBase: Float) {
        jiggleDocument.attemptGrabJiggleCenter(touch: touch,
                                               at: point,
                                               sceneScaleBase: sceneScaleBase,
                                               displayMode: displayMode,
                                               isGraphEnabled: isGraphEnabled)
    }
    
    @MainActor func attemptUpdateJiggleCenter(touch: UITouch,
                                              at point: Point,
                                              isFromRelease: Bool) {
        jiggleDocument.attemptUpdateJiggleCenter(touch: touch,
                                                 at: point,
                                                 isFromRelease: isFromRelease)
    }
    
    @MainActor func attemptReleaseJiggleCenter(touch: UITouch,
                                               at point: Point) {
        jiggleDocument.attemptReleaseJiggleCenter(touch: touch,
                                                  at: point)
    }
    
    @MainActor func killDragAll() {
        killDragNormal()
        killDragSwivel()
    }
    
    @MainActor func killDragNormal() {
        jiggleDocument.killDragNormal()
    }
    
    @MainActor func killDragSwivel() {
        swivelCoordinator.allTouchesWereCancelled(jiggle: getSelectedJiggle())
    }
    
    func getWorldScale() -> Float {
        var result = Float(1.0)
        if fabsf(jiggleScene.sceneScale) > Math.epsilon {
            result = (1.0 / jiggleScene.sceneScale)
        }
        return result
    }
    
    @MainActor func graphUpdateRelay() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphUpdateRelay(jiggle: getSelectedJiggle())
        }
    }
    
    @MainActor func timeLineUpdateRelay() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineUpdateRelay(jiggle: getSelectedJiggle())
        }
    }
    
    @MainActor func handleWakeUpBegin() {
        print(".....handleWakeUpBegin (Part Only).....")
        jiggleDocument.handleWakeUpBegin(jiggleEngine: jiggleEngine,
                                         displayMode: displayMode,
                                         isGraphEnabled: isGraphEnabled,
                                         jiggleScene: jiggleScene)
    }
    
    @MainActor func handleWakeUpComplete_PartA() {
        
        print(".....handleWakeUpComplete (PartA).....")
        
        jiggleDocument.handleWakeUpComplete_PartA(jiggleEngine: jiggleEngine,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
        refreshAllTimeLines()
    }
    
    @MainActor func handleWakeUpComplete_PartB() {
        print(".....handleWakeUpComplete (PartB).....")
        
        handleAnimationModeDidChange()
        handleJigglesDidChange()
        handleDocumentModeDidChange()
        
        jiggleDocument.handleWakeUpComplete_PartB(jiggleEngine: jiggleEngine,
                                                  displayMode: displayMode,
                                                  isGraphEnabled: isGraphEnabled)
        
        jiggleDocument.isWakeUpComplete = true
    }
    
    @MainActor func handleExit() {
        jiggleDocument.handleExit()
    }
    
    @MainActor func handleAnimationModeDidChange() {
        let animationMode = _getAnimationMode()
        jiggleDocument.handleAnimationModeDidChange(animationMode: animationMode)
    }
    
    @MainActor func handleJigglesDidChange() {
        let animationMode = _getAnimationMode()
        jiggleDocument.handleJigglesDidChange(animationMode: animationMode)
    }
    
    @MainActor func handleControlPointsDidChange() {
        jiggleDocument.handleControlPointsDidChange()
    }
    
    @MainActor func handleDocumentModeDidChange() {
        let animationMode = _getAnimationMode()
        jiggleDocument.handleDocumentModeDidChange(animationMode: animationMode)
    }
    
    @MainActor func handleEditModeDidChange() {
        jiggleDocument.handleEditModeDidChange()
    }
    
    @MainActor func applicationWillResignActive() {
        print("JiggleViewModel.applicationWillResignActive")
        jiggleDocument.applicationWillResignActive()
    }
    
    @MainActor func applicationDidBecomeActive() {
        print("JiggleViewModel.applicationDidBecomeActive")
        jiggleDocument.applicationDidBecomeActive()
    }
    
}
