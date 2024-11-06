//
//  JiggleViewModel+History.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewModel {
    
    func historyRecordJiggleSpeed(selectedJiggleIndex: Int, valueNodes: [HistorySingleJiggleValueNode]) {
        print("historyRecordJiggleSpeed!!!")
        let historyStateJiggleSpeed = HistoryStateJiggleSpeed(selectedJiggleIndex: selectedJiggleIndex, valueNodes: valueNodes)
        storeHistoryState(historyState: historyStateJiggleSpeed)
    }
    
    func historyRecordJigglePower(selectedJiggleIndex: Int, valueNodes: [HistorySingleJiggleValueNode]) {
        print("historyRecordJigglePower!!!")
        let historyStateGyroPower = HistoryStateGyroPower(selectedJiggleIndex: selectedJiggleIndex, valueNodes: valueNodes)
        storeHistoryState(historyState: historyStateGyroPower)
    }
    
    func historyRecordJiggleDampen(selectedJiggleIndex: Int, valueNodes: [HistorySingleJiggleValueNode]) {
        print("historyRecordJiggleDampen!!!")
        let historyStateJiggleDampen = HistoryStateJiggleDampen(selectedJiggleIndex: selectedJiggleIndex, valueNodes: valueNodes)
        storeHistoryState(historyState: historyStateJiggleDampen)
    }
    
    
    func historyRecordRotateOrFlipJiggle(jiggleIndex: Int,
                                         fileBufferBefore: FileBuffer,
                                         fileBufferAfter: FileBuffer) {
        print("historyRecordRotateOrFlipJiggle!!!")
        let historyStateRotateOrFlipJiggle = HistoryStateRotateOrFlipJiggle(jiggleIndex: jiggleIndex, 
                                                                            fileBufferBefore: fileBufferBefore,
                                                                            fileBufferAfter: fileBufferAfter)
        storeHistoryState(historyState: historyStateRotateOrFlipJiggle)
    }
    
    func historyRecordRotateOrFlipGuide(jiggleIndex: Int,
                                        guideIndex: Int,
                                        fileBufferBefore: FileBuffer,
                                        fileBufferAfter: FileBuffer) {
        print("historyRecordRotateOrFlipGuide!!!")
        let historyStateRotateOrFlipGuide = HistoryStateRotateOrFlipGuide(jiggleIndex: jiggleIndex,
                                                                          guideIndex: guideIndex,
                                                                          fileBufferBefore: fileBufferBefore,
                                                                          fileBufferAfter: fileBufferAfter)
        storeHistoryState(historyState: historyStateRotateOrFlipGuide)
    }
    
    func historyRecordCreateJiggle(jiggle: Jiggle) {
        print("historyRecordCreateJiggle!!!")
        let historyStateCreateJiggle = HistoryStateCreateJiggle(jiggle: jiggle)
        storeHistoryState(historyState: historyStateCreateJiggle)
    }
    
    func historyRecordRemoveJiggle(jiggle: Jiggle, jiggleIndex: Int) {
        print("historyRecordRemoveJiggle!!!")
        let historyStateRemoveJiggle = HistoryStateRemoveJiggle(jiggle: jiggle,
                                                                jiggleIndex: jiggleIndex)
        storeHistoryState(historyState: historyStateRemoveJiggle)
    }
    
    func historyRecordTransformJiggle(jiggleIndex: Int,
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
    
    func historyRecordCreateControlPoint(jiggleIndex: Int,
                                         controlPointIndex: Int) {
        print("historyRecordCreateControlPoint!!!")
        if let jiggle = jiggleDocument.getJiggle(jiggleIndex) {
            if let controlPoint = jiggle.getJiggleControlPoint(controlPointIndex) {
                let historyStateCreateControlPoint = HistoryStateCreateControlPoint(jiggleIndex: jiggleIndex,
                                                                                    controlPointIndex: controlPointIndex,
                                                                                    point: controlPoint.point)
                storeHistoryState(historyState: historyStateCreateControlPoint)
            }
        }
    }
    
    func historyRecordRemoveControlPoint(jiggleIndex: Int,
                                         controlPointIndex: Int,
                                         point: Point) {
        print("historyRecordRemoveControlPoint!!!")
        let historyStateRemoveControlPoint = HistoryStateRemoveControlPoint(jiggleIndex: jiggleIndex,
                                                                            controlPointIndex: controlPointIndex,
                                                                            point: point)
        storeHistoryState(historyState: historyStateRemoveControlPoint)
    }
    
    func historyRecordMoveControlPoint(jiggleIndex: Int,
                                       controlPointIndex: Int,
                                       startPoint: Point,
                                       endPoint: Point) {
        let historyStateMoveControlPoint = HistoryStateMoveControlPoint(jiggleIndex: jiggleIndex,
                                                                        controlPointIndex: controlPointIndex,
                                                                        startPoint: startPoint,
                                                                        endPoint: endPoint)
        storeHistoryState(historyState: historyStateMoveControlPoint)
    }
    
    func historyRecordCreateGuide(jiggleIndex: Int,
                                       guide: Guide) {
        print("historyRecordCreateGuide!!!")
        let historyStateCreateGuide = HistoryStateCreateGuide(jiggleIndex: jiggleIndex,
                                                                        guide: guide)
        storeHistoryState(historyState: historyStateCreateGuide)
    }
        
    func historyRecordDeleteGuide(jiggleIndex: Int,
                                       weightCurveIndex: Int,
                                       guide: Guide) {
        print("historyRecordDeleteGuide!!! jiggleIndex: \(jiggleIndex) weightCurveIndex: \(weightCurveIndex)")
        let historyStateDeleteGuide = HistoryStateDeleteGuide(jiggleIndex: jiggleIndex,
                                                                        weightCurveIndex: weightCurveIndex,
                                                                        guide: guide)
        storeHistoryState(historyState: historyStateDeleteGuide)
    }
    
    func historyRecordTransformGuide(jiggleIndex: Int,
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
    
    func historyRecordMoveGuideControlPoint(jiggleIndex: Int,
                                                 weightCurveIndex: Int,
                                                 guideControlPointIndex: Int,
                                                 startPoint: Point,
                                                 endPoint: Point) {
        print("historyRecordMoveGuideControlPoint!!!")
        let historyStateMoveGuideControlPoint = HistoryStateMoveGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                                            weightCurveIndex: weightCurveIndex,
                                                                                            guideControlPointIndex: guideControlPointIndex,
                                                                                            startPoint: startPoint,
                                                                                            endPoint: endPoint)
        storeHistoryState(historyState: historyStateMoveGuideControlPoint)
    }
    
    func historyRecordCreateGuideControlPoint(jiggleIndex: Int,
                                                   weightCurveIndex: Int,
                                                   guideControlPointIndex: Int,
                                                   point: Point) {
        print("historyRecordCreateGuideControlPoint!!!")
        let historyStateCreateGuideControlPoint = HistoryStateCreateGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                                                weightCurveIndex: weightCurveIndex,
                                                                                                guideControlPointIndex: guideControlPointIndex,
                                                                                                point: point)
        
        storeHistoryState(historyState: historyStateCreateGuideControlPoint)
    }
    
    func historyRecordDeleteGuideControlPoint(jiggleIndex: Int,
                                                   weightCurveIndex: Int,
                                                   guideControlPointIndex: Int,
                                                   point: Point) {
        print("historyRecordDeleteGuideControlPoint!!!")
        let historyStateDeleteGuideControlPoint = HistoryStateDeleteGuideControlPoint(jiggleIndex: jiggleIndex,
                                                                                                weightCurveIndex: weightCurveIndex,
                                                                                                guideControlPointIndex: guideControlPointIndex,
                                                                                                point: point)
        storeHistoryState(historyState: historyStateDeleteGuideControlPoint)
    }
    
    func historyRecordMoveWeightCenter(jiggleIndex: Int,
                                       startCenter: Point,
                                       endCenter: Point) {
        print("historyRecordMoveWeightCenter!!!")
        let historyStateMoveWeightCenter = HistoryStateMoveWeightCenter(jiggleIndex: jiggleIndex,
                                                                               startCenter: startCenter,
                                                                               endCenter: endCenter)
        storeHistoryState(historyState: historyStateMoveWeightCenter)
    }
    
    func historyRecordMoveJiggleCenter(jiggleIndex: Int,
                                       startCenter: Point,
                                       endCenter: Point) {
        print("historyRecordMoveJiggleCenter!!!")
        let historyStateMoveJiggleCenter = HistoryStateMoveJiggleCenter(jiggleIndex: jiggleIndex,
                                                                               startCenter: startCenter,
                                                                               endCenter: endCenter)
        storeHistoryState(historyState: historyStateMoveJiggleCenter)
    }
    
    func historyRecordMoveWeightGraphPosition(jiggleIndex: Int,
                                              isFirstControlPoint: Bool,
                                              isLastControlPoint: Bool,
                                              guideIndex: Int,
                                              startHeightManual: Bool,
                                              startHeightFactor: Float,
                                              endHeightFactor: Float) {
        print("historyRecordMoveWeightGraphPosition!!!")
        let historyStateMoveWeightGraphPosition = HistoryStateMoveWeightGraphPosition(jiggleIndex: jiggleIndex,
                                                                                      isFirstControlPoint: isFirstControlPoint,
                                                                                      isLastControlPoint: isLastControlPoint,
                                                                                      guideIndex: guideIndex,
                                                                                      startHeightManual: startHeightManual,
                                                                                      startHeightFactor: startHeightFactor,
                                                                                      endHeightFactor: endHeightFactor)
        storeHistoryState(historyState: historyStateMoveWeightGraphPosition)
    }
    
    func historyRecordMoveWeightGraphTangent(jiggleIndex: Int,
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
        print("historyRecordMoveWeightGraphTangent!!!")
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
    
    func historyRecordLoopAttributeOne(jiggleIndex: Int,
                                         startAttribute: LoopAttribute,
                                         endAttribute: LoopAttribute) {
        
        let historyStateLoopAttributeOne = HistoryStateLoopAttributeOne(jiggleIndex: jiggleIndex,
                                                                            startAttribute: startAttribute,
                                                                            endAttribute: endAttribute)
        storeHistoryState(historyState: historyStateLoopAttributeOne)
    }
    
    func historyRecordLoopAttributesAll(jiggleIndex: Int,
                                         startAttributes: [LoopAttribute],
                                          endAttributes: [LoopAttribute]) {
        
        let historyStateLoopAttributesAll = HistoryStateLoopAttributesAll(jiggleIndex: jiggleIndex,
                                                                              startAttributes: startAttributes,
                                                                              endAttributes: endAttributes)
        storeHistoryState(historyState: historyStateLoopAttributesAll)
    }
    
    func historyRecordContinuousAttributeOne(jiggleIndex: Int,
                                             startAttribute: ContinuousAttribute,
                                             endAttribute: ContinuousAttribute) {
            
            let historyStateContinuousAttributeOne = HistoryStateContinuousAttributeOne(jiggleIndex: jiggleIndex,
                                                                                startAttribute: startAttribute,
                                                                                endAttribute: endAttribute)
            storeHistoryState(historyState: historyStateContinuousAttributeOne)
        }
        
        func historyRecordContinuousAttributesAll(jiggleIndex: Int,
                                             startAttributes: [ContinuousAttribute],
                                              endAttributes: [ContinuousAttribute]) {
            
            let historyStateContinuousAttributesAll = HistoryStateContinuousAttributesAll(jiggleIndex: jiggleIndex,
                                                                                  startAttributes: startAttributes,
                                                                                  endAttributes: endAttributes)
            storeHistoryState(historyState: historyStateContinuousAttributesAll)
        }
    
    typealias StorageNode = HistoryStateResetWeightGraph.StorageNode
    func historyRecordResetWeightGraph(jiggleIndex: Int,
                                       storageNodes: [StorageNode]) {
        print("historyRecordResetWeightGraph!!!")
        let historyStateResetWeightGraph = HistoryStateResetWeightGraph(jiggleIndex: jiggleIndex,
                                                                        storageNodes: storageNodes)
        storeHistoryState(historyState: historyStateResetWeightGraph)
    }
    
    func storeHistoryState(historyState: HistoryState) {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.historyController.addHistoryState(historyState)
            toolInterfaceViewModel.handleUndoRedoDidChange()
        }
    }
    
}
