//
//  JiggleViewModel+SliderNotify.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/4/24.
//

import Foundation

extension JiggleViewModel {
    
    
    func notifySliderStartedJigglePower(value: Float) {
        print("notifySliderStartedJigglePower: \(value)")
        //sliderStartedJigglePowerValue = value
        sliderStartedJigglePowerValueNodes.removeAll(keepingCapacity: true)
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            let node = HistorySingleJiggleValueNode(startValue: jiggle.jigglePowerAmount, jiggleIndex: jiggleIndex)
            sliderStartedJigglePowerValueNodes.append(node)
        }
        
        ANY_sliderActiveNotify(whichSlider: .sliderJigglePower)
    }
    
    func notifySliderFinishedJigglePower(value: Float) {
        print("notifySliderFinishedJigglePower: \(value)")
        var historyStateNodes = [HistorySingleJiggleValueNode]()
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            for valueNodeIndex in 0..<sliderStartedJigglePowerValueNodes.count {
                let valueNode = sliderStartedJigglePowerValueNodes[valueNodeIndex]
                if valueNode.jiggleIndex == jiggleIndex {
                    valueNode.endValue = jiggle.jigglePowerAmount
                    historyStateNodes.append(valueNode)
                }
            }
        }
        if historyStateNodes.count > 0 {
            historyRecordJigglePower(selectedJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                     valueNodes: historyStateNodes)
            sliderStartedJigglePowerValueNodes.removeAll(keepingCapacity: true)
        }
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedJiggleSpeed(value: Float) {
        print("notifySliderStartedJiggleSpeed: \(value)")
        sliderStartedJiggleSpeedValueNodes.removeAll(keepingCapacity: true)
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            let node = HistorySingleJiggleValueNode(startValue: jiggle.jiggleSpeedAmount, jiggleIndex: jiggleIndex)
            sliderStartedJiggleSpeedValueNodes.append(node)
        }
        
        ANY_sliderActiveNotify(whichSlider: .sliderJiggleSpeed)
    }
    
    func notifySliderFinishedJiggleSpeed(value: Float) {
        print("notifySliderFinishedJiggleSpeed: \(value)")
        var historyStateNodes = [HistorySingleJiggleValueNode]()
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            for valueNodeIndex in 0..<sliderStartedJiggleSpeedValueNodes.count {
                let valueNode = sliderStartedJiggleSpeedValueNodes[valueNodeIndex]
                if valueNode.jiggleIndex == jiggleIndex {
                    valueNode.endValue = jiggle.jiggleSpeedAmount
                    historyStateNodes.append(valueNode)
                }
            }
        }
        if historyStateNodes.count > 0 {
            historyRecordJiggleSpeed(selectedJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                     valueNodes: historyStateNodes)
            sliderStartedJiggleSpeedValueNodes.removeAll(keepingCapacity: true)
        }
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedJiggleDampen(value: Float) {
        print("notifySliderStartedJiggleDampen: \(value)")
        sliderStartedJiggleDampenValueNodes.removeAll(keepingCapacity: true)
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            let node = HistorySingleJiggleValueNode(startValue: jiggle.jiggleDampenAmount, jiggleIndex: jiggleIndex)
            sliderStartedJiggleDampenValueNodes.append(node)
        }
        
        ANY_sliderActiveNotify(whichSlider: .sliderJiggleDampen)
    }
    
    func notifySliderFinishedJiggleDampen(value: Float) {
        print("notifySliderFinishedJiggleDampen: \(value)")
        var historyStateNodes = [HistorySingleJiggleValueNode]()
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            for valueNodeIndex in 0..<sliderStartedJiggleDampenValueNodes.count {
                let valueNode = sliderStartedJiggleDampenValueNodes[valueNodeIndex]
                if valueNode.jiggleIndex == jiggleIndex {
                    valueNode.endValue = jiggle.jiggleDampenAmount
                    historyStateNodes.append(valueNode)
                }
            }
        }
        if historyStateNodes.count > 0 {
            historyRecordJiggleDampen(selectedJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                      valueNodes: historyStateNodes)
            sliderStartedJiggleDampenValueNodes.removeAll(keepingCapacity: true)
        }
        
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedTimeLineDuration(value: Float) {
        print("notifySliderStartedTimeLineDuration: \(value)")
        
        if isAnimationLoopsAppliedToAll {
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineDuration,
                                                     selectedJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        } else {
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineDuration,
                                                    targetJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        }
        
        ANY_sliderActiveNotify(whichSlider: .sliderTimeLineDuration)
    }
    
    func notifySliderFinishedTimeLineDuration(value: Float) {
        print("notifySliderFinishedTimeLineDuration: \(value)")
        if jiggleDocument.snapShotLoopAttributeIsAppliedToAll {
            let startAttributes = jiggleDocument.snapShotLoopAttributesAll
            if startAttributes.count > 0 {
                
                switch startAttributes[0].loopAttributeTypeWithData {
                case .timeLineDuration(let timeLineDurationData):
                    jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineDuration,
                                                             selectedJiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                             timeLineSelectedSwatch: timeLineDurationData.selectedSwatch)
                    let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                    if endAttributes.count == startAttributes.count {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                       startAttributes: startAttributes,
                                                       endAttributes: endAttributes)
                    }
                default:
                    break
                }
                
            }
        } else {
            if let startAttribute = jiggleDocument.snapShotLoopAttributeOne {
                switch startAttribute.loopAttributeTypeWithData {
                case .timeLineDuration(let timeLineDurationData):
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineDuration,
                                                            targetJiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                            timeLineSelectedSwatch: timeLineDurationData.selectedSwatch)
                    
                    if let endAttribute = jiggleDocument.snapShotLoopAttributeOne {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                      startAttribute: startAttribute,
                                                      endAttribute: endAttribute)
                    }
                default:
                    break
                }
            }
        }
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedTimeLineFrameOffset(value: Float) {
        print("notifySliderStartedTimeLineFrameOffset: \(value)")
        
        if isAnimationLoopsAppliedToAll {
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineFrameOffset,
                                                     selectedJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                                     timeLineSelectedSwatch: timeLineSelectedSwatch)
        } else {
            jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineFrameOffset,
                                                    targetJiggleIndex: jiggleDocument.selectedJiggleIndex,
                                                    timeLineSelectedSwatch: timeLineSelectedSwatch)
        }
        
        ANY_sliderActiveNotify(whichSlider: .sliderTimeLineFrameOffset)
    }
    
    func notifySliderFinishedTimeLineFrameOffset(value: Float) {
        print("notifySliderFinishedTimeLineFrameOffset: \(value)")
        
        if jiggleDocument.snapShotLoopAttributeIsAppliedToAll {
            
            let startAttributes = jiggleDocument.snapShotLoopAttributesAll
            if startAttributes.count > 0 {
                
                switch startAttributes[0].loopAttributeTypeWithData {
                case .timeLineFrameOffset(let timeLineFrameOffsetData):
                    jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineFrameOffset,
                                                             selectedJiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                             timeLineSelectedSwatch: timeLineFrameOffsetData.selectedSwatch)
                    let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                    if endAttributes.count == startAttributes.count {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                       startAttributes: startAttributes,
                                                       endAttributes: endAttributes)
                    }
                default:
                    break
                }
                
            }
        } else {
            
            if let startAttribute = jiggleDocument.snapShotLoopAttributeOne {
                switch startAttribute.loopAttributeTypeWithData {
                case .timeLineFrameOffset(let timeLineFrameOffsetData):
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineFrameOffset,
                                                            targetJiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                            timeLineSelectedSwatch: timeLineFrameOffsetData.selectedSwatch)
                    
                    if let endAttribute = jiggleDocument.snapShotLoopAttributeOne {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleDocument.snapShotLoopAttributeOneTargetIndex,
                                                      startAttribute: startAttribute,
                                                      endAttribute: endAttribute)
                    }
                default:
                    break
                }
            }
        }
        
        ANY_sliderInactiveNotify()
    }
    
    func continuousSliderHistoryStarted(attributeType: ContinuousAttributeType) {
        if isAnimationContinuousAppliedToAll {
            jiggleDocument.snapShotContinuousAttributesAll(attributeType: attributeType,
                                                           selectedJiggleIndex: jiggleDocument.selectedJiggleIndex)
        } else {
            jiggleDocument.snapShotContinuousAttributeOne(attributeType: attributeType,
                                                          targetJiggleIndex: jiggleDocument.selectedJiggleIndex)
        }
    }
    
    func continuousSliderHistoryinished(attributeType: ContinuousAttributeType) {
        if jiggleDocument.snapShotContinuousAttributeIsAppliedToAll {
            let startAttributes = jiggleDocument.snapShotContinuousAttributesAll
            if startAttributes.count > 0 {
                if startAttributes[0].continuousAttributeType == attributeType {
                    jiggleDocument.snapShotContinuousAttributesAll(attributeType: attributeType,
                                                                   selectedJiggleIndex: jiggleDocument.snapShotContinuousAttributesAllSelectedIndex)
                    let endAttributes = jiggleDocument.snapShotContinuousAttributesAll
                    if endAttributes.count == startAttributes.count {
                        if endAttributes[0].continuousAttributeType == attributeType {
                            historyRecordContinuousAttributesAll(jiggleIndex: jiggleDocument.snapShotContinuousAttributesAllSelectedIndex,
                                                                 startAttributes: startAttributes,
                                                                 endAttributes: endAttributes)
                        }
                    }
                }
            }
        } else {
            if let startAttribute = jiggleDocument.snapShotContinuousAttributeOne {
                if startAttribute.continuousAttributeType == attributeType {
                    jiggleDocument.snapShotContinuousAttributeOne(attributeType: attributeType,
                                                                  targetJiggleIndex: jiggleDocument.snapShotContinuousAttributeOneTargetIndex)
                    if let endAttribute = jiggleDocument.snapShotContinuousAttributeOne {
                        if endAttribute.continuousAttributeType == attributeType {
                            historyRecordContinuousAttributeOne(jiggleIndex: jiggleDocument.snapShotContinuousAttributeOneTargetIndex,
                                                                startAttribute: startAttribute,
                                                                endAttribute: endAttribute)
                        }
                    }
                }
            }
        }
        
    }
    
    func notifySliderStartedContinuousDuration(value: Float) {
        print("notifySliderStartedContinuousDuration: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousDuration)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousDuration)
    }
    
    func notifySliderFinishedContinuousDuration(value: Float) {
        print("notifySliderFinishedContinuousDuration: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousDuration)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousFrameOffset(value: Float) {
        print("notifySliderStartedContinuousFrameOffset: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousFrameOffset)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousFrameOffset)
    }
    
    func notifySliderFinishedContinuousFrameOffset(value: Float) {
        print("notifySliderFinishedContinuousFrameOffset: \(value)")

        continuousSliderHistoryinished(attributeType: .continuousFrameOffset)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousAngle(value: Float) {
        print("notifySliderStartedContinuousAngle: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
       
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousAngle)
    }
    
    func notifySliderFinishedContinuousAngle(value: Float) {
        print("notifySliderFinishedContinuousAngle: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousPower(value: Float) {
        print("notifySliderStartedContinuousPower: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousPower)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousPower)
    }
    
    func notifySliderFinishedContinuousPower(value: Float) {
        print("notifySliderFinishedContinuousPower: \(value)")

        continuousSliderHistoryinished(attributeType: .continuousPower)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousSwoop(value: Float) {
        print("notifySliderStartedContinuousSwoop: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousSwoop)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousSwoop)
    }
    
    func notifySliderFinishedContinuousSwoop(value: Float) {
        print("notifySliderFinishedContinuousSwoop: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousSwoop)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousStartRotation(value: Float) {
        print("notifySliderStartedContinuousStartRotation: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousStartRotation)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousStartRotation)
    }
    
    func notifySliderFinishedContinuousStartRotation(value: Float) {
        print("notifySliderFinishedContinuousStartRotation: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousStartRotation)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousEndRotation(value: Float) {
        print("notifySliderStartedContinuousEndRotation: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousEndRotation)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousEndRotation)
    }
    
    func notifySliderFinishedContinuousEndRotation(value: Float) {
        print("notifySliderFinishedContinuousEndRotation: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousEndRotation)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousStartScale(value: Float) {
        print("notifySliderStartedContinuousStartScale: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousStartScale)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousStartScale)
    }
    
    func notifySliderFinishedContinuousStartScale(value: Float) {
        print("notifySliderFinishedContinuousStartScale: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousStartScale)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedContinuousEndScale(value: Float) {
        print("notifySliderStartedContinuousEndScale: \(value)")
        
        continuousSliderHistoryStarted(attributeType: .continuousEndScale)
        
        ANY_sliderActiveNotify(whichSlider: .sliderContinuousEndScale)
    }
    
    func notifySliderFinishedContinuousEndScale(value: Float) {
        print("notifySliderFinishedContinuousEndScale: \(value)")
        
        continuousSliderHistoryinished(attributeType: .continuousEndScale)
        
        ANY_sliderInactiveNotify()
    }
    
    func notifySliderStartedZoomAmount(value: Float) {
        print("notifySliderStartedZoomAmount: \(value)")

        
    }
    
    func notifySliderFinishedZoomAmount(value: Float) {
        print("notifySliderFinishedZoomAmount: \(value)")
        
        
    }
    
}
