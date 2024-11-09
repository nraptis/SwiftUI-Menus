//
//  JiggleViewModel+History.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewModel {
    
    @MainActor func historyRecordJiggleSpeed(selectedJiggleIndex: Int, valueNodes: [HistorySingleJiggleValueNode]) {
        let historyStateJiggleSpeed = HistoryStateJiggleSpeed(selectedJiggleIndex: selectedJiggleIndex, valueNodes: valueNodes)
        storeHistoryState(historyState: historyStateJiggleSpeed)
    }
    
    @MainActor func historyRecordJigglePower(selectedJiggleIndex: Int, valueNodes: [HistorySingleJiggleValueNode]) {
        let historyStateGyroPower = HistoryStateGyroPower(selectedJiggleIndex: selectedJiggleIndex, valueNodes: valueNodes)
        storeHistoryState(historyState: historyStateGyroPower)
    }
    
    @MainActor func historyRecordJiggleDampen(selectedJiggleIndex: Int, valueNodes: [HistorySingleJiggleValueNode]) {
        let historyStateJiggleDampen = HistoryStateJiggleDampen(selectedJiggleIndex: selectedJiggleIndex, valueNodes: valueNodes)
        storeHistoryState(historyState: historyStateJiggleDampen)
    }
    
    @MainActor func historyRecordRotateOrFlipJiggle(jiggleIndex: Int,
                                                    fileBufferBefore: FileBuffer,
                                                    fileBufferAfter: FileBuffer) {
        let historyStateRotateOrFlipJiggle = HistoryStateRotateOrFlipJiggle(jiggleIndex: jiggleIndex,
                                                                            fileBufferBefore: fileBufferBefore,
                                                                            fileBufferAfter: fileBufferAfter)
        storeHistoryState(historyState: historyStateRotateOrFlipJiggle)
    }
    
    @MainActor func historyRecordRotateOrFlipGuide(jiggleIndex: Int,
                                                   guideIndex: Int,
                                                   fileBufferBefore: FileBuffer,
                                                   fileBufferAfter: FileBuffer) {
        let historyStateRotateOrFlipGuide = HistoryStateRotateOrFlipGuide(jiggleIndex: jiggleIndex,
                                                                          guideIndex: guideIndex,
                                                                          fileBufferBefore: fileBufferBefore,
                                                                          fileBufferAfter: fileBufferAfter)
        storeHistoryState(historyState: historyStateRotateOrFlipGuide)
    }
    
    @MainActor func historyRecordCreateJiggle(fileBuffer: FileBuffer) {
        let historyStateCreateJiggle = HistoryStateCreateJiggle(fileBuffer: fileBuffer)
        storeHistoryState(historyState: historyStateCreateJiggle)
    }
    
    @MainActor func historyRecordRemoveJiggle(fileBuffer: FileBuffer, jiggleIndex: Int) {
        let historyStateRemoveJiggle = HistoryStateRemoveJiggle(fileBuffer: fileBuffer,
                                                                jiggleIndex: jiggleIndex)
        storeHistoryState(historyState: historyStateRemoveJiggle)
    }
    
    @MainActor func historyRecordTransformJiggle(jiggleIndex: Int,
                                                 data: JiggleDocumentPublisherLibrary.TransformJiggleData) {
        let historyStateRemoveJiggle = HistoryStateTransformJiggle(jiggleIndex: jiggleIndex,
                                                                   startCenter: data.startCenter,
                                                                   startScale: data.startScale,
                                                                   startRotation: data.startRotation,
                                                                   endCenter: data.endCenter,
                                                                   endScale: data.endScale,
                                                                   endRotation: data.endRotation)
        storeHistoryState(historyState: historyStateRemoveJiggle)
    }
    
    @MainActor func historyRecordCreateControlPoint(jiggleIndex: Int,
                                                    controlPointIndex: Int) {
        if let jiggle = jiggleDocument.getJiggle(jiggleIndex) {
            if let controlPoint = jiggle.getJiggleControlPoint(controlPointIndex) {
                let historyStateCreateControlPoint = HistoryStateCreateControlPoint(jiggleIndex: jiggleIndex,
                                                                                    controlPointIndex: controlPointIndex,
                                                                                    point: controlPoint.point)
                storeHistoryState(historyState: historyStateCreateControlPoint)
            }
        }
    }
    
    @MainActor func historyRecordRemoveControlPoint(jiggleIndex: Int,
                                                    controlPointIndex: Int,
                                                    point: Point) {
        let historyStateRemoveControlPoint = HistoryStateRemoveControlPoint(jiggleIndex: jiggleIndex,
                                                                            controlPointIndex: controlPointIndex,
                                                                            point: point)
        storeHistoryState(historyState: historyStateRemoveControlPoint)
    }
    
    @MainActor func historyRecordMoveControlPoint(jiggleIndex: Int,
                                                  controlPointIndex: Int,
                                                  startPoint: Point,
                                                  endPoint: Point) {
        let historyStateMoveControlPoint = HistoryStateMoveControlPoint(jiggleIndex: jiggleIndex,
                                                                        controlPointIndex: controlPointIndex,
                                                                        startPoint: startPoint,
                                                                        endPoint: endPoint)
        storeHistoryState(historyState: historyStateMoveControlPoint)
    }
    
    @MainActor func historyRecordCreateGuide(jiggleIndex: Int,
                                             fileBuffer: FileBuffer) {
        let historyStateCreateGuide = HistoryStateCreateGuide(jiggleIndex: jiggleIndex,
                                                              fileBuffer: fileBuffer)
        storeHistoryState(historyState: historyStateCreateGuide)
    }
    
    @MainActor func historyRecordDeleteGuide(jiggleIndex: Int,
                                             weightCurveIndex: Int,
                                             fileBuffer: FileBuffer) {
        let historyStateDeleteGuide = HistoryStateDeleteGuide(jiggleIndex: jiggleIndex,
                                                              weightCurveIndex: weightCurveIndex,
                                                              fileBuffer: fileBuffer)
        storeHistoryState(historyState: historyStateDeleteGuide)
    }
    
    @MainActor func historyRecordTransformGuide(jiggleIndex: Int,
                                                weightCurveIndex: Int,
                                                data: JiggleDocumentPublisherLibrary.TransformGuideData) {
        let historyStateRemoveJiggle = HistoryStateTransformGuide(jiggleIndex: jiggleIndex,
                                                                  weightCurveIndex: weightCurveIndex,
                                                                  startCenter: data.startCenter,
                                                                  startScale: data.startScale,
                                                                  startRotation: data.startRotation,
                                                                  endCenter: data.endCenter,
                                                                  endScale: data.endScale,
                                                                  endRotation: data.endRotation)
        storeHistoryState(historyState: historyStateRemoveJiggle)
    }
    
    @MainActor func historyRecordMoveGuideControlPoint(jiggleIndex: Int,
                                                       weightCurveIndex: Int,
                                                       guideControlPointIndex: Int,
                                                       startPoint: Point,
                                                       endPoint: Point) {
        let historyStateMoveGuideControlPoint = HistoryStateMoveGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                                  weightCurveIndex: weightCurveIndex,
                                                                                  guideControlPointIndex: guideControlPointIndex,
                                                                                  startPoint: startPoint,
                                                                                  endPoint: endPoint)
        storeHistoryState(historyState: historyStateMoveGuideControlPoint)
    }
    
    @MainActor func historyRecordCreateGuideControlPoint(jiggleIndex: Int,
                                                         weightCurveIndex: Int,
                                                         guideControlPointIndex: Int,
                                                         point: Point) {
        let historyStateCreateGuideControlPoint = HistoryStateCreateGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                                      weightCurveIndex: weightCurveIndex,
                                                                                      guideControlPointIndex: guideControlPointIndex,
                                                                                      point: point)
        
        storeHistoryState(historyState: historyStateCreateGuideControlPoint)
    }
    
    @MainActor func historyRecordDeleteGuideControlPoint(jiggleIndex: Int,
                                                         weightCurveIndex: Int,
                                                         guideControlPointIndex: Int,
                                                         point: Point) {
        let historyStateDeleteGuideControlPoint = HistoryStateDeleteGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                                      weightCurveIndex: weightCurveIndex,
                                                                                      guideControlPointIndex: guideControlPointIndex,
                                                                                      point: point)
        storeHistoryState(historyState: historyStateDeleteGuideControlPoint)
    }
    
    @MainActor func historyRecordMoveWeightCenter(jiggleIndex: Int,
                                                  startCenter: Point,
                                                  endCenter: Point) {
        let historyStateMoveWeightCenter = HistoryStateMoveWeightCenter(jiggleIndex: jiggleIndex,
                                                                        startCenter: startCenter,
                                                                        endCenter: endCenter)
        storeHistoryState(historyState: historyStateMoveWeightCenter)
    }
    
    @MainActor func historyRecordMoveJiggleCenter(jiggleIndex: Int,
                                                  startCenter: Point,
                                                  endCenter: Point) {
        let historyStateMoveJiggleCenter = HistoryStateMoveJiggleCenter(jiggleIndex: jiggleIndex,
                                                                        startCenter: startCenter,
                                                                        endCenter: endCenter)
        storeHistoryState(historyState: historyStateMoveJiggleCenter)
    }
    
    @MainActor func historyRecordMoveWeightGraphPosition(jiggleIndex: Int,
                                                         isFirstControlPoint: Bool,
                                                         isLastControlPoint: Bool,
                                                         guideIndex: Int,
                                                         startHeightManual: Bool,
                                                         startHeightFactor: Float,
                                                         endHeightFactor: Float) {
        let historyStateMoveWeightGraphPosition = HistoryStateMoveWeightGraphPosition(jiggleIndex: jiggleIndex,
                                                                                      isFirstControlPoint: isFirstControlPoint,
                                                                                      isLastControlPoint: isLastControlPoint,
                                                                                      guideIndex: guideIndex,
                                                                                      startHeightManual: startHeightManual,
                                                                                      startHeightFactor: startHeightFactor,
                                                                                      endHeightFactor: endHeightFactor)
        storeHistoryState(historyState: historyStateMoveWeightGraphPosition)
    }
    
    @MainActor func historyRecordMoveWeightGraphTangent(jiggleIndex: Int,
                                                        isFirstControlPoint: Bool,
                                                        isLastControlPoint: Bool,
                                                        guideIndex: Int,
                                                        tanType: JiggleDocument.TanType,
                                                        startTangentManual: Bool,
                                                        startDirection: Float,
                                                        startMagnitudeIn: Float,
                                                        startMagnitudeOut: Float,
                                                        endDirection: Float,
                                                        endMagnitudeIn: Float,
                                                        endMagnitudeOut: Float) {
        let historyStateMoveWeightGraphTangent = HistoryStateMoveWeightGraphTangent(jiggleIndex: jiggleIndex,
                                                                                    isFirstControlPoint: isFirstControlPoint,
                                                                                    isLastControlPoint: isLastControlPoint,
                                                                                    guideIndex: guideIndex,
                                                                                    tanType: tanType,
                                                                                    startTangentManual: startTangentManual,
                                                                                    startDirection: startDirection,
                                                                                    startMagnitudeIn: startMagnitudeIn,
                                                                                    startMagnitudeOut: startMagnitudeOut,
                                                                                    endDirection: endDirection,
                                                                                    endMagnitudeIn: endMagnitudeIn,
                                                                                    endMagnitudeOut: endMagnitudeOut)
        storeHistoryState(historyState: historyStateMoveWeightGraphTangent)
    }
    
    @MainActor func historyRecordLoopAttributeOne(jiggleIndex: Int,
                                                  startAttribute: LoopAttribute,
                                                  endAttribute: LoopAttribute) {
        
        let historyStateLoopAttributeOne = HistoryStateLoopAttributeOne(jiggleIndex: jiggleIndex,
                                                                        startAttribute: startAttribute,
                                                                        endAttribute: endAttribute)
        storeHistoryState(historyState: historyStateLoopAttributeOne)
    }
    
    @MainActor func historyRecordLoopAttributesAll(jiggleIndex: Int,
                                                   startAttributes: [LoopAttribute],
                                                   endAttributes: [LoopAttribute]) {
        
        let historyStateLoopAttributesAll = HistoryStateLoopAttributesAll(jiggleIndex: jiggleIndex,
                                                                          startAttributes: startAttributes,
                                                                          endAttributes: endAttributes)
        storeHistoryState(historyState: historyStateLoopAttributesAll)
    }
    
    @MainActor func historyRecordContinuousAttributeOne(jiggleIndex: Int,
                                                        startAttribute: ContinuousAttribute,
                                                        endAttribute: ContinuousAttribute) {
        
        let historyStateContinuousAttributeOne = HistoryStateContinuousAttributeOne(jiggleIndex: jiggleIndex,
                                                                                    startAttribute: startAttribute,
                                                                                    endAttribute: endAttribute)
        storeHistoryState(historyState: historyStateContinuousAttributeOne)
    }
    
    @MainActor func historyRecordContinuousAttributesAll(jiggleIndex: Int,
                                                         startAttributes: [ContinuousAttribute],
                                                         endAttributes: [ContinuousAttribute]) {
        
        let historyStateContinuousAttributesAll = HistoryStateContinuousAttributesAll(jiggleIndex: jiggleIndex,
                                                                                      startAttributes: startAttributes,
                                                                                      endAttributes: endAttributes)
        storeHistoryState(historyState: historyStateContinuousAttributesAll)
    }
    
    typealias StorageNode = HistoryStateResetWeightGraph.StorageNode
    @MainActor func historyRecordResetWeightGraph(jiggleIndex: Int,
                                                  storageNodes: [StorageNode]) {
        print("historyRecordResetWeightGraph!!!")
        let historyStateResetWeightGraph = HistoryStateResetWeightGraph(jiggleIndex: jiggleIndex,
                                                                        storageNodes: storageNodes)
        storeHistoryState(historyState: historyStateResetWeightGraph)
    }
    
    @MainActor func storeHistoryState(historyState: HistoryState) {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.historyController.addHistoryState(historyState)
            toolInterfaceViewModel.handleUndoRedoDidChange()
        }
    }
    
}
