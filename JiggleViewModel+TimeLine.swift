//
//  JiggleViewModel+TimeLine.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/4/24.
//

import Foundation

extension JiggleViewModel {
    
    
    @MainActor func timeLineDupeAll(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLine,
                                                       selectedJiggleIndex: jiggleIndex,
                                                       timeLineSelectedSwatch: timeLineSelectedSwatch)
            let startAttributes = jiggleDocument.snapShotLoopAttributesAll
            
            jiggleDocument.timeLineDupeAll(selectedJiggle,
                                           currentSwatch: timeLineSelectedSwatch)
            refreshAllTimeLines()
            
            jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLine,
                                                       selectedJiggleIndex: jiggleIndex,
                                                       timeLineSelectedSwatch: timeLineSelectedSwatch)
            let endAttributes = jiggleDocument.snapShotLoopAttributesAll
            
            
            historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                             startAttributes: startAttributes,
                                             endAttributes: endAttributes)
        }
    }
    
    @MainActor func timeLineSyncFrames() {
        print("JVM: timeLineSyncFrames")
        jiggleDocument.timeLineSyncFrames()
        
    }
    
    @MainActor func timeLineFlipAll(_ selectedJiggle: Jiggle?) {
        print("JVM: timeLineFlipAll")
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            func _actionBoth() {
                jiggleDocument.timeLineFlipAll(selectedJiggle,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV)
            }
            
            func _actionAll() {
                timeLineDupeChannel(selectedJiggle, swatch: .x)
                timeLineDupeChannel(selectedJiggle, swatch: .rotation)
            }
            
            func _actionOne() {
                timeLineComputeChannel(selectedJiggle, swatch: .x)
                timeLineComputeChannel(selectedJiggle, swatch: .rotation)
            }
            
            if isAnimationLoopsAppliedToAll {
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLine,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
                let startAttributes = jiggleDocument.snapShotLoopAttributesAll
                
                _actionBoth()
                _actionAll()
                
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLine,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
                let endAttributes = jiggleDocument.snapShotLoopAttributesAll
                
                historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                 startAttributes: startAttributes,
                                                 endAttributes: endAttributes)
                
                
                
            } else {
                jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLine,
                                                          targetJiggleIndex: jiggleIndex,
                                                          timeLineSelectedSwatch: timeLineSelectedSwatch)
                let startAttribute = jiggleDocument.snapShotLoopAttributeOne
                
                if let startAttribute = startAttribute {
                    
                    _actionBoth()
                    _actionOne()
                    
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLine,
                                                              targetJiggleIndex: jiggleIndex,
                                                              timeLineSelectedSwatch: timeLineSelectedSwatch)
                    
                    let endAttribute = jiggleDocument.snapShotLoopAttributeOne
                    if let endAttribute = endAttribute {
                        
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleIndex,
                                                        startAttribute: startAttribute,
                                                        endAttribute: endAttribute)
                    }
                }
            }
            
            if let jiggleViewController = jiggleViewController {
                jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
            }
        }
    }
    
    @MainActor private func _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: () -> Void,
                                                         _actionAll: () -> Void,
                                                         _actionOne: () -> Void,
                                                         selectedJiggle: Jiggle,
                                                         jiggleIndex: Int) {
        
        if isAnimationLoopsAppliedToAll {
            
            switch timeLineSelectedSwatch {
            case .x:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchX,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .y:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchY,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .scale:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchScale,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .rotation:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchRotation,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            }
            
            let startAttributes = jiggleDocument.snapShotLoopAttributesAll
            
            _actionPreBoth()
            _actionAll()
            
            switch timeLineSelectedSwatch {
            case .x:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchX,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .y:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchY,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .scale:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchScale,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .rotation:
                jiggleDocument.snapShotLoopAttributesAll(attributeType: .timeLineSwatchRotation,
                                                           selectedJiggleIndex: jiggleIndex,
                                                           timeLineSelectedSwatch: timeLineSelectedSwatch)
            }
            
            let endAttributes = jiggleDocument.snapShotLoopAttributesAll
            
            if startAttributes.count > 0 {
                if startAttributes.count == endAttributes.count {
                    if startAttributes[0].loopAttributeType == endAttributes[0].loopAttributeType {
                        historyRecordLoopAttributesAll(jiggleIndex: jiggleDocument.snapShotLoopAttributesAllSelectedIndex,
                                                         startAttributes: startAttributes,
                                                         endAttributes: endAttributes)
                    }
                }
            }
            
        } else {
            
            switch timeLineSelectedSwatch {
            case .x:
                jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchX,
                                                          targetJiggleIndex: jiggleIndex,
                                                          timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .y:
                jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchY,
                                                          targetJiggleIndex: jiggleIndex,
                                                          timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .scale:
                jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchScale,
                                                          targetJiggleIndex: jiggleIndex,
                                                          timeLineSelectedSwatch: timeLineSelectedSwatch)
            case .rotation:
                jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchRotation,
                                                          targetJiggleIndex: jiggleIndex,
                                                          timeLineSelectedSwatch: timeLineSelectedSwatch)
            }
            
            let startAttribute = jiggleDocument.snapShotLoopAttributeOne
            
            if let startAttribute = startAttribute {
                
                _actionPreBoth()
                _actionOne()
                
                switch timeLineSelectedSwatch {
                case .x:
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchX,
                                                              targetJiggleIndex: jiggleIndex,
                                                              timeLineSelectedSwatch: timeLineSelectedSwatch)
                case .y:
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchY,
                                                              targetJiggleIndex: jiggleIndex,
                                                              timeLineSelectedSwatch: timeLineSelectedSwatch)
                case .scale:
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchScale,
                                                              targetJiggleIndex: jiggleIndex,
                                                              timeLineSelectedSwatch: timeLineSelectedSwatch)
                case .rotation:
                    jiggleDocument.snapShotLoopAttributeOne(attributeType: .timeLineSwatchRotation,
                                                              targetJiggleIndex: jiggleIndex,
                                                              timeLineSelectedSwatch: timeLineSelectedSwatch)
                }
                
                let endAttribute = jiggleDocument.snapShotLoopAttributeOne
                if let endAttribute = endAttribute {
                    if startAttribute.loopAttributeType == endAttribute.loopAttributeType {
                        historyRecordLoopAttributeOne(jiggleIndex: jiggleIndex,
                                                        startAttribute: startAttribute,
                                                        endAttribute: endAttribute)
                    }
                }
            }
        }
        
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineUpdateRelay(jiggle: selectedJiggle)
        }
        
    }
    
    @MainActor func timeLineFlipCurrentChannelHorizontal(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineFlipCurrentChannelHorizontal(selectedJiggle,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV,
                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineFlipCurrentChannelVertical(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineFlipCurrentChannelVertical(selectedJiggle,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV,
                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineAmplify(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineAmplify(selectedJiggle,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV,
                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineDampen(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineDampen(selectedJiggle,
                                              frameWidth: frameWidth,
                                              frameHeight: frameHeight,
                                              paddingH: paddingH,
                                              paddingV: paddingV,
                                              currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineInvertH(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineInvertH(selectedJiggle,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV,
                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineInvertV(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineInvertV(selectedJiggle,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV,
                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineResetCurveSmall(_ selectedJiggle: Jiggle?) {
        print("JVM: timeLineResetFlatCurrentChannel")
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineResetCurveSmall(selectedJiggle,
                                                       frameWidth: frameWidth,
                                                       frameHeight: frameHeight,
                                                       paddingH: paddingH,
                                                       paddingV: paddingV,
                                                       currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineResetDivot(_ selectedJiggle: Jiggle?) {
        print("JVM: timeLineResetFlatCurrentChannel")
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineResetDivot(selectedJiggle,
                                                               frameWidth: frameWidth,
                                                               frameHeight: frameHeight,
                                                               paddingH: paddingH,
                                                               paddingV: paddingV,
                                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }

    @MainActor func timeLineResetDivotSmall(_ selectedJiggle: Jiggle?) {
        print("JVM: timeLineResetFlatCurrentChannel")
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineResetDivotSmall(selectedJiggle,
                                                               frameWidth: frameWidth,
                                                               frameHeight: frameHeight,
                                                               paddingH: paddingH,
                                                               paddingV: paddingV,
                                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }

    @MainActor func timeLineResetFlat(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineResetFlat(selectedJiggle,
                                                               frameWidth: frameWidth,
                                                               frameHeight: frameHeight,
                                                               paddingH: paddingH,
                                                               paddingV: paddingV,
                                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }

    @MainActor func timeLineResetSwan(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineResetSwan(selectedJiggle,
                                                               frameWidth: frameWidth,
                                                               frameHeight: frameHeight,
                                                               paddingH: paddingH,
                                                               paddingV: paddingV,
                                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }

    @MainActor func timeLineShiftDown(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineShiftDown(selectedJiggle,
                                                               frameWidth: frameWidth,
                                                               frameHeight: frameHeight,
                                                               paddingH: paddingH,
                                                               paddingV: paddingV,
                                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }

    @MainActor func timeLineShiftUp(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineShiftUp(selectedJiggle,
                                                               frameWidth: frameWidth,
                                                               frameHeight: frameHeight,
                                                               paddingH: paddingH,
                                                               paddingV: paddingV,
                                                               currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timeLineResetCurve(_ selectedJiggle: Jiggle?) {
        
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timeLineResetCurve(selectedJiggle,
                                                  frameWidth: frameWidth,
                                                  frameHeight: frameHeight,
                                                  paddingH: paddingH,
                                                  paddingV: paddingV,
                                                  currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timelinePointCountIncrement(_ selectedJiggle: Jiggle?) {
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timelinePointCountIncrement(selectedJiggle,
                                                           currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    @MainActor func timelinePointCountDecrement(_ selectedJiggle: Jiggle?) {
        if let selectedJiggle = selectedJiggle,
           let jiggleIndex = jiggleDocument.getJiggleIndex(selectedJiggle) {
            
            _timeLineCurrentSwatchActionWithHistory(_actionPreBoth: {
                
                jiggleDocument.timelinePointCountDecrement(selectedJiggle,
                                                           currentSwatch: timeLineSelectedSwatch)
                
            }, _actionAll: {
                timeLineDupeCurrentChannel(selectedJiggle)
            }, _actionOne: {
                timeLineComputeCurrentChannel(selectedJiggle)
            }, selectedJiggle: selectedJiggle, jiggleIndex: jiggleIndex)
        }
    }
    
    func getTimelinePointCountString() -> String {
        jiggleDocument.getTimelinePointCountString(currentSwatch: timeLineSelectedSwatch)
    }
    
    @MainActor func timeLineComputeCurrentChannel(_ selectedJiggle: Jiggle?) {
        if let selectedJiggle = selectedJiggle {
            let selectedSwatch = selectedJiggle.timeLine.getSelectedSwatch(swatch: timeLineSelectedSwatch)
            let selectedChannel = selectedSwatch.selectedChannel
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            selectedChannel.buildSplineFromCurve(frameWidth: frameWidth,
                                                 frameHeight: frameHeight,
                                                 paddingH: paddingH,
                                                 paddingV: paddingV)
            selectedChannel.refreshSpline(frameWidth: frameWidth,
                                          frameHeight: frameHeight,
                                          paddingH: paddingH,
                                          paddingV: paddingV)
        }
    }
    
    @MainActor func timeLineComputeAllChannels(_ selectedJiggle: Jiggle?) {
        timeLineComputeChannel(selectedJiggle, swatch: .x)
        timeLineComputeChannel(selectedJiggle, swatch: .y)
        timeLineComputeChannel(selectedJiggle, swatch: .scale)
        timeLineComputeChannel(selectedJiggle, swatch: .rotation)
    }
    
    @MainActor func timeLineComputeChannel(_ selectedJiggle: Jiggle?, swatch: Swatch) {
        if let selectedJiggle = selectedJiggle {
            let chosenSwatch = selectedJiggle.timeLine.getSwatch(swatch: swatch)
            let chosenChannel = chosenSwatch.selectedChannel
            
            let frameWidth = jiggleScene.timeLineWidth
            let frameHeight = jiggleScene.timeLineHeight
            let paddingH = jiggleScene.timeLinePaddingH
            let paddingV = jiggleScene.timeLinePaddingV
            
            chosenChannel.buildSplineFromCurve(frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV)
            chosenChannel.refreshSpline(frameWidth: frameWidth,
                                        frameHeight: frameHeight,
                                        paddingH: paddingH,
                                        paddingV: paddingV)
        }
    }
    
    @MainActor func timeLineDupeCurrentChannel(_ selectedJiggle: Jiggle?) {
        print("JVM: timeLineDupeCurrentChannel")
        if let selectedJiggle = selectedJiggle {
            jiggleDocument.timeLineDupeCurrentChannel(selectedJiggle,
                                                      currentSwatch: timeLineSelectedSwatch)
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                let jiggle = jiggleDocument.jiggles[jiggleIndex]
                timeLineComputeCurrentChannel(jiggle)
            }
        }
    }
    
    @MainActor func timeLineDupeChannel(_ selectedJiggle: Jiggle?, swatch: Swatch) {
        print("JVM: timeLineDupeCurrentChannel")
        if let selectedJiggle = selectedJiggle {
            jiggleDocument.timeLineDupeChannelForSpecifiedSwatch(selectedJiggle, specifiedSwatch: swatch)
            for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                let jiggle = jiggleDocument.jiggles[jiggleIndex]
                timeLineComputeChannel(jiggle, swatch: swatch)
            }
        }
    }
    
    @MainActor func refreshAllTimeLines() {
        let timeLineWidth = jiggleScene.timeLineWidth
        let timeLineHeight = jiggleScene.timeLineHeight
        let timeLinePaddingH = jiggleScene.timeLinePaddingH
        let timeLinePaddingV = jiggleScene.timeLinePaddingV
        
        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
            
            let jiggle = jiggleDocument.jiggles[jiggleIndex]
            
            var swatches = [TimeLineSwatch]()
            swatches.append(jiggle.timeLine.swatchPositionX)
            swatches.append(jiggle.timeLine.swatchPositionY)
            swatches.append(jiggle.timeLine.swatchScale)
            swatches.append(jiggle.timeLine.swatchRotation)
            jiggle.timeLine.refreshFrame(frameWidth: timeLineWidth,
                                         frameHeight: timeLineHeight,
                                         paddingH: timeLinePaddingH,
                                         paddingV: timeLinePaddingV)
            for swatch in swatches {
                swatch.selectedChannel.buildSplineFromCurve(frameWidth: timeLineWidth,
                                                            frameHeight: timeLineHeight,
                                                            paddingH: timeLinePaddingH,
                                                            paddingV: timeLinePaddingV)
                swatch.selectedChannel.refreshSpline(frameWidth: timeLineWidth,
                                                     frameHeight: timeLineHeight,
                                                     paddingH: timeLinePaddingH,
                                                     paddingV: timeLinePaddingV)
            }
        }
    }
}
