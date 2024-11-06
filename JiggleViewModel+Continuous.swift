//
//  JiggleViewModel+Continuous.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/5/24.
//

import Foundation

extension JiggleViewModel {
    
    func continuousResetAngleDiag1() {
        print("JVM - ContinuousResetAngleDiag1")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleDiag1(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    func continuousResetAngleDiag2() {
        print("JVM - ContinuousResetAngleDiag2")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleDiag2(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    func continuousResetAngleHorizontal() {
        print("JVM - ContinuousResetAngleHorizontal")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleHorizontal(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    func continuousResetAngleVertical() {
        print("JVM - ContinuousResetAngleVertical")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleVertical(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }

    func continuousResetEndRotation() {
        print("JVM - ContinuousResetEndRotation")
        continuousSliderHistoryStarted(attributeType: .continuousEndRotation)
        jiggleDocument.continuousResetEndRotation(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousEndRotation)
        toolInterfaceViewModel.handleContinuousEndRotationDidChange()
    }
    
    func continuousResetEndScale() {
        print("JVM - ContinuousResetEndScale")
        continuousSliderHistoryStarted(attributeType: .continuousEndScale)
        jiggleDocument.continuousResetEndScale(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousEndScale)
        toolInterfaceViewModel.handleContinuousEndScaleDidChange()
    }
    
    func continuousResetStartRotation() {
        print("JVM - ContinuousResetStartRotation")
        continuousSliderHistoryStarted(attributeType: .continuousStartRotation)
        jiggleDocument.continuousResetStartRotation(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousStartRotation)
        toolInterfaceViewModel.handleContinuousStartRotationDidChange()
    }
    
    func continuousResetStartScale() {
        print("JVM - ContinuousResetStartScale")
        continuousSliderHistoryStarted(attributeType: .continuousStartScale)
        jiggleDocument.continuousResetStartScale(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousStartScale)
        toolInterfaceViewModel.handleContinuousStartScaleDidChange()
    }
    
    func continuousResetSwoop() {
        print("JVM - ContinuousResetSwoop")
        continuousSliderHistoryStarted(attributeType: .continuousSwoop)
        jiggleDocument.continuousResetSwoop(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousSwoop)
        toolInterfaceViewModel.handleContinuousSwoopDidChange()
    }
    
    func continuousSyncFrames() {
        print("JVM - ContinuousSyncFrames")
        jiggleDocument.continuousSyncFrames()
        
    }
    
}
