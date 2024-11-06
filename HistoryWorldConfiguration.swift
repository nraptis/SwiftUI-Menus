//
//  HistoryWorldConfiguration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/15/24.
//

import Foundation

struct HistoryWorldConfiguration {
    
    enum TimeLineType {
        case forceEnter
        case forceLeave
        case dontCare
    }
    
    enum AnimationLoopType {
        case forceEnter
        case forceLeave
        case dontCare
    }
    
    enum AnimationContinuousType {
        case forceEnter
        case forceLeave
        case dontCare
    }
    
    enum TwoPageType {
        case forcePage1
        case forcePage2
        case dontCare
    }
    
    enum ThreePageType {
        case forcePage1
        case forcePage2
        case forcePage3
        case dontCare
    }
    
    enum GraphType {
        case forceEnter
        case forceLeave
        case dontCare
    }
    
    enum GuidesType {
        case forceEnter
        case forceLeave
        case dontCare
    }
    
    enum ExpandedType {
        case forceEnter
        case dontCare
    }
    
    enum EditModeType {
        case forceEnter(EditMode)
        case dontCare
    }
    
    enum DisplayModeType {
        case forceEnter(DisplayMode)
        case dontCare
    }
    
    enum WeightModeType {
        case forceEnter(WeightMode)
        case dontCare
    }
    
    let documentMode: DocumentMode
    let editModeType: EditModeType
    let weightModeType: WeightModeType
    var graphType: GraphType
    var guidesType: GuidesType
    var phoneExpandedTopType: ExpandedType
    var phoneExpandedBottomType: ExpandedType
    var timeLineType: TimeLineType
    var animationLoopType: AnimationLoopType
    var animationContinuousType: AnimationContinuousType
    var animationLoopsPageType: ThreePageType
    var animationTimeLinePageType: ThreePageType
    var animationContinuousPageType: ThreePageType
    
    init(documentMode: DocumentMode,
         editModeType: EditModeType,
         weightModeType: WeightModeType,
         graphType: GraphType,
         guidesType: GuidesType,
         phoneExpandedTopType: ExpandedType,
         phoneExpandedBottomType: ExpandedType,
         timeLineType: TimeLineType,
         animationLoopType: AnimationLoopType,
         animationContinuousType: AnimationContinuousType,
         animationLoopsPageType: ThreePageType,
         animationTimeLinePageType: ThreePageType,
         animationContinuousPageType: ThreePageType) {
        
        self.documentMode = documentMode
        self.editModeType = editModeType
        self.weightModeType = weightModeType
        self.graphType = graphType
        self.guidesType = guidesType
        self.phoneExpandedTopType = phoneExpandedTopType
        self.phoneExpandedBottomType = phoneExpandedBottomType
        self.timeLineType = timeLineType
        self.animationLoopType = animationLoopType
        self.animationContinuousType = animationContinuousType
        self.animationLoopsPageType = animationLoopsPageType
        self.animationTimeLinePageType = animationTimeLinePageType
        self.animationContinuousPageType = animationContinuousPageType
    }
}
