//
//  JiggleViewModel+Continuous.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/5/24.
//

import Foundation

extension JiggleViewModel {
    
    @MainActor func continuousInvertAngles() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousInvertAngles")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousInvertAngles(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    @MainActor func continuousInvertRotation() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousInvertRotation")
        continuousSliderHistoryStarted(attributeType: .continuousRotationGroup)
        jiggleDocument.continuousInvertRotation(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousRotationGroup)
        toolInterfaceViewModel.handleContinuousStartRotationDidChange()
        toolInterfaceViewModel.handleContinuousEndRotationDidChange()
    }


    @MainActor func continuousInvertSwoop() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousInvertSwoop")
        continuousSliderHistoryStarted(attributeType: .continuousSwoop)
        jiggleDocument.continuousInvertSwoop(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousSwoop)
        toolInterfaceViewModel.handleContinuousSwoopDidChange()
    }


    @MainActor func continuousResetFrameOffset() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousResetFrameOffset")
        continuousSliderHistoryStarted(attributeType: .continuousFrameOffset)
        jiggleDocument.continuousResetFrameOffset(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousFrameOffset)
        toolInterfaceViewModel.handleContinuousFrameOffsetDidChange()
    }
    
    @MainActor func continuousShuffleGroup1() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousShuffleGroup1")
        continuousSliderHistoryStarted(attributeType: .continuousDurationGroup)
        jiggleDocument.continuousShuffleGroup1(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousDurationGroup)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
        toolInterfaceViewModel.handleContinuousPowerDidChange()
        toolInterfaceViewModel.handleContinuousDurationDidChange()
    }


    @MainActor func continuousShuffleGroup2() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousShuffleGroup2")
        continuousSliderHistoryStarted(attributeType: .continuousScaleGroup)
        jiggleDocument.continuousShuffleGroup2(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousScaleGroup)
        toolInterfaceViewModel.handleContinuousStartScaleDidChange()
        toolInterfaceViewModel.handleContinuousEndScaleDidChange()
    }


    @MainActor func continuousShuffleGroup3() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousShuffleGroup3")
        continuousSliderHistoryStarted(attributeType: .continuousRotationGroup)
        jiggleDocument.continuousShuffleGroup3(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousRotationGroup)
        toolInterfaceViewModel.handleContinuousStartRotationDidChange()
        toolInterfaceViewModel.handleContinuousEndRotationDidChange()
        toolInterfaceViewModel.handleContinuousSwoopDidChange()
    }
    
    @MainActor func continuousResetGroup1() {
            //TODO: History Categories...
            print("JVM - ContinuousContinuousResetGroup1")
            continuousSliderHistoryStarted(attributeType: .continuousDurationGroup)
            jiggleDocument.continuousResetGroup1(isAppliedToAll: isAnimationContinuousAppliedToAll)
            continuousSliderHistoryinished(attributeType: .continuousDurationGroup)
            toolInterfaceViewModel.handleContinuousAngleDidChange()
            toolInterfaceViewModel.handleContinuousPowerDidChange()
            toolInterfaceViewModel.handleContinuousDurationDidChange()
        }


        @MainActor func continuousResetGroup2() {
            //TODO: History Categories...
            print("JVM - ContinuousContinuousResetGroup2")
            continuousSliderHistoryStarted(attributeType: .continuousScaleGroup)
            jiggleDocument.continuousResetGroup2(isAppliedToAll: isAnimationContinuousAppliedToAll)
            continuousSliderHistoryinished(attributeType: .continuousScaleGroup)
            toolInterfaceViewModel.handleContinuousStartScaleDidChange()
            toolInterfaceViewModel.handleContinuousEndScaleDidChange()
        }


        @MainActor func continuousResetGroup3() {
            //TODO: History Categories...
            print("JVM - ContinuousContinuousResetGroup3")
            continuousSliderHistoryStarted(attributeType: .continuousRotationGroup)
            jiggleDocument.continuousResetGroup3(isAppliedToAll: isAnimationContinuousAppliedToAll)
            continuousSliderHistoryinished(attributeType: .continuousRotationGroup)
            toolInterfaceViewModel.handleContinuousStartRotationDidChange()
            toolInterfaceViewModel.handleContinuousEndRotationDidChange()
            toolInterfaceViewModel.handleContinuousSwoopDidChange()
        }
    
    @MainActor func continuousSwapRotation() {
        //TODO: History Categories...
        print("JVM - ContinuousContinuousSwapRotation")
        continuousSliderHistoryStarted(attributeType: .continuousRotationGroup)
        jiggleDocument.continuousSwapRotation(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousRotationGroup)
        toolInterfaceViewModel.handleContinuousStartRotationDidChange()
        toolInterfaceViewModel.handleContinuousEndRotationDidChange()
    }

    @MainActor func continuousResetAngleDiag1() {
        print("JVM - ContinuousResetAngleDiag1")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleDiag1(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    @MainActor func continuousResetAngleDiag2() {
        print("JVM - ContinuousResetAngleDiag2")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleDiag2(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    @MainActor func continuousResetAngleHorizontal() {
        print("JVM - ContinuousResetAngleHorizontal")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleHorizontal(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }
    
    @MainActor func continuousResetAngleVertical() {
        print("JVM - ContinuousResetAngleVertical")
        continuousSliderHistoryStarted(attributeType: .continuousAngle)
        jiggleDocument.continuousResetAngleVertical(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousAngle)
        toolInterfaceViewModel.handleContinuousAngleDidChange()
    }

    @MainActor func continuousResetEndRotation() {
        print("JVM - ContinuousResetEndRotation")
        continuousSliderHistoryStarted(attributeType: .continuousEndRotation)
        jiggleDocument.continuousResetEndRotation(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousEndRotation)
        toolInterfaceViewModel.handleContinuousEndRotationDidChange()
    }
    
    @MainActor func continuousResetEndScale() {
        print("JVM - ContinuousResetEndScale")
        continuousSliderHistoryStarted(attributeType: .continuousEndScale)
        jiggleDocument.continuousResetEndScale(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousEndScale)
        toolInterfaceViewModel.handleContinuousEndScaleDidChange()
    }
    
    @MainActor func continuousResetStartRotation() {
        print("JVM - ContinuousResetStartRotation")
        continuousSliderHistoryStarted(attributeType: .continuousStartRotation)
        jiggleDocument.continuousResetStartRotation(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousStartRotation)
        toolInterfaceViewModel.handleContinuousStartRotationDidChange()
    }
    
    @MainActor func continuousResetStartScale() {
        print("JVM - ContinuousResetStartScale")
        continuousSliderHistoryStarted(attributeType: .continuousStartScale)
        jiggleDocument.continuousResetStartScale(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousStartScale)
        toolInterfaceViewModel.handleContinuousStartScaleDidChange()
    }
    
    @MainActor func continuousResetSwoop() {
        print("JVM - ContinuousResetSwoop")
        continuousSliderHistoryStarted(attributeType: .continuousSwoop)
        jiggleDocument.continuousResetSwoop(isAppliedToAll: isAnimationContinuousAppliedToAll)
        continuousSliderHistoryinished(attributeType: .continuousSwoop)
        toolInterfaceViewModel.handleContinuousSwoopDidChange()
    }
    
    @MainActor func continuousSyncFrames() {
        print("JVM - ContinuousSyncFrames")
        jiggleDocument.continuousSyncFrames()
        
    }
    
}
