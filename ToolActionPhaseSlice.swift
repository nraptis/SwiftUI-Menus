//
//  ToolActionPhaseSlice.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

enum ToolActionPhaseSliceType {
    
    case wait
    
    case applyHistoryUndo
    case applyHistoryRedo
    
    case setGraphMode
    case setGuidesMode
    case setVideoRecordMode
    case setVideoExportMode
    case setZoomMode
    case setAnimationLoopsMode
    case setAnimationContinuousMode
    case setLoopsPage
    case setTimeLinePage
    case setContinuousPage
    
    case setGraphPage2Mode
    //case setAnimationContinuousPage2Mode
    
    case setTimeLineMode
    case setStereoscopicMode
    
    case setExpandedDraggable
    case setExpandedPhoneTop
    case setExpandedPhoneBottom
    
    case setDocumentMode
    case setEditMode
    case setWeightMode
    //case setAnimationMode
    
    case setDarkModeEnabled
    case setPurchasedEnabled
    
    //JiggleViewController+ToolActionPhaseSliceSetVideoRecordMode
    case setRenderingMode
    
    case jiggleMeshCommandAllJiggles
    case jiggleMeshCommandOneJiggles
    
    case prepareInterfaceConfigurationPad
    case prepareInterfaceConfigurationPhone
    
    case updateInterfaceConfigurationPad
    case updateInterfaceConfigurationPhone
    
    case lockShowingState
    case unlockShowingState
    
    case disableAllCreateModes
    
    case anyClosure
    
    case setCreatorMode
    
}

class ToolActionPhaseSlice {
    
    let toolActionPhaseSliceType: ToolActionPhaseSliceType
    var time: CGFloat = 0.0
    var sleepTicks: Int
    init(toolActionPhaseSliceType: ToolActionPhaseSliceType, sleepTicks: Int) {
        self.toolActionPhaseSliceType = toolActionPhaseSliceType
        self.sleepTicks = sleepTicks
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSlice")
        }
    }
    
    // A phase with only 1 slice...
    func phase(time: CGFloat) -> ToolActionPhase {
        return ToolActionPhase(slice: self, time: time)
    }
    
    // A phase with only 1 slice...
    func phase() -> ToolActionPhase {
        return ToolActionPhase(slice: self, time: .zero)
    }
    
}

class ToolActionPhaseSliceWait: ToolActionPhaseSlice {
    init() {
        super.init(toolActionPhaseSliceType: .wait, sleepTicks: 0)
    }
}

class ToolActionPhaseSliceApplyHistoryUndo: ToolActionPhaseSlice {
    let historyState: HistoryState
    init(historyState: HistoryState) {
        self.historyState = historyState
        super.init(toolActionPhaseSliceType: .applyHistoryUndo, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceApplyHistoryUndo")
        }
    }
}

class ToolActionPhaseSliceApplyHistoryRedo: ToolActionPhaseSlice {
    let historyState: HistoryState
    init(historyState: HistoryState) {
        self.historyState = historyState
        super.init(toolActionPhaseSliceType: .applyHistoryRedo, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceApplyHistoryUndo")
        }
    }
}


class ToolActionPhaseSliceSetGraphMode: ToolActionPhaseSlice {
    let isGraphMode: Bool
    init(isGraphMode: Bool) {
        self.isGraphMode = isGraphMode
        super.init(toolActionPhaseSliceType: .setGraphMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceUpdateInterfaceConfigurationPad")
        }
    }
}

class ToolActionPhaseSliceSetVideoRecordMode: ToolActionPhaseSlice {
    let isVideoRecordEnabled: Bool
    init(isVideoRecordEnabled: Bool) {
        self.isVideoRecordEnabled = isVideoRecordEnabled
        super.init(toolActionPhaseSliceType: .setVideoRecordMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetVideoRecordMode")
        }
    }
}

class ToolActionPhaseSliceSetGuidesMode: ToolActionPhaseSlice {
    let isGuideMode: Bool
    init(isGuideMode: Bool) {
        self.isGuideMode = isGuideMode
        super.init(toolActionPhaseSliceType: .setGuidesMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceUpdateInterfaceConfigurationPad")
        }
    }
}

class ToolActionPhaseSliceSetVideoExportMode: ToolActionPhaseSlice {
    let isVideoExportEnabled: Bool
    init(isVideoExportEnabled: Bool) {
        self.isVideoExportEnabled = isVideoExportEnabled
        super.init(toolActionPhaseSliceType: .setVideoExportMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetVideoExportMode")
        }
    }
}

class ToolActionPhaseSliceSetZoomMode: ToolActionPhaseSlice {
    let isZoomMode: Bool
    init(isZoomMode: Bool) {
        self.isZoomMode = isZoomMode
        super.init(toolActionPhaseSliceType: .setZoomMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetVideoExportMode")
        }
    }
}

class ToolActionPhaseSliceSetGraphPage2Mode: ToolActionPhaseSlice {
    let isGraphPage2Mode: Bool
    init(isGraphPage2Mode: Bool) {
        self.isGraphPage2Mode = isGraphPage2Mode
        super.init(toolActionPhaseSliceType: .setGraphPage2Mode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetGraphPage2Mode")
        }
    }
}

class ToolActionPhaseSliceSetAnimationLoopsMode: ToolActionPhaseSlice {
    let isAnimationLoopsMode: Bool
    init(isAnimationLoopsMode: Bool) {
        self.isAnimationLoopsMode = isAnimationLoopsMode
        super.init(toolActionPhaseSliceType: .setAnimationLoopsMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetAnimationLoopsMode")
        }
    }
}

class ToolActionPhaseSliceSetAnimationContinuousMode: ToolActionPhaseSlice {
    let isAnimationContinuousMode: Bool
    init(isAnimationContinuousMode: Bool) {
        self.isAnimationContinuousMode = isAnimationContinuousMode
        super.init(toolActionPhaseSliceType: .setAnimationContinuousMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetAnimationContinuousMode")
        }
    }
}

class ToolActionPhaseSliceSetLoopsPage: ToolActionPhaseSlice {
    let animationLoopsPage: Int
    init(animationLoopsPage: Int) {
        self.animationLoopsPage = animationLoopsPage
        super.init(toolActionPhaseSliceType: .setLoopsPage, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetLoopsPage")
        }
    }
}

class ToolActionPhaseSliceSetContinuousPage: ToolActionPhaseSlice {
    let animationContinuousPage: Int
    init(animationContinuousPage: Int) {
        self.animationContinuousPage = animationContinuousPage
        super.init(toolActionPhaseSliceType: .setContinuousPage, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetContinuousPage")
        }
    }
}

class ToolActionPhaseSliceSetTimeLinePage: ToolActionPhaseSlice {
    let animationTimeLinePage: Int
    init(animationTimeLinePage: Int) {
        self.animationTimeLinePage = animationTimeLinePage
        super.init(toolActionPhaseSliceType: .setTimeLinePage, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetTimeLinePage")
        }
    }
}

class ToolActionPhaseSliceSetTimeLineMode: ToolActionPhaseSlice {
    let isTimeLineMode: Bool
    init(isTimeLineMode: Bool) {
        self.isTimeLineMode = isTimeLineMode
        super.init(toolActionPhaseSliceType: .setTimeLineMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetTimeLineMode")
        }
    }
}



class ToolActionPhaseSliceSetStereoscopicMode: ToolActionPhaseSlice {
    let isStereoscopicMode: Bool
    init(isStereoscopicMode: Bool) {
        self.isStereoscopicMode = isStereoscopicMode
        super.init(toolActionPhaseSliceType: .setStereoscopicMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetStereoscopicMode")
        }
    }
}

class ToolActionPhaseSliceSetCreatorMode: ToolActionPhaseSlice {
    let creatorMode: CreatorMode
    init(creatorMode: CreatorMode) {
        self.creatorMode = creatorMode
        super.init(toolActionPhaseSliceType: .setCreatorMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetCreatorMode")
        }
    }
}

class ToolActionPhaseSliceSetExpandedDraggable: ToolActionPhaseSlice {
    let isExpanded: Bool
    init(isExpanded: Bool) {
        self.isExpanded = isExpanded
        super.init(toolActionPhaseSliceType: .setExpandedDraggable, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetExpandedDraggable")
        }
    }
}

class ToolActionPhaseSliceSetExpandedPhoneTop: ToolActionPhaseSlice {
    let isExpanded: Bool
    init(isExpanded: Bool) {
        self.isExpanded = isExpanded
        super.init(toolActionPhaseSliceType: .setExpandedPhoneTop, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetExpandedPhoneTop")
        }
    }
}

class ToolActionPhaseSliceSetExpandedPhoneBottom: ToolActionPhaseSlice {
    let isExpanded: Bool
    init(isExpanded: Bool) {
        self.isExpanded = isExpanded
        super.init(toolActionPhaseSliceType: .setExpandedPhoneBottom, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetExpandedPhoneBottom")
        }
    }
}

class ToolActionPhaseSliceSetDocumentMode: ToolActionPhaseSlice {
    let documentMode: DocumentMode
    init(documentMode: DocumentMode) {
        self.documentMode = documentMode
        super.init(toolActionPhaseSliceType: .setDocumentMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetDocumentMode")
        }
    }
}

class ToolActionPhaseSliceSetEditMode: ToolActionPhaseSlice {
    let editMode: EditMode
    init(editMode: EditMode) {
        self.editMode = editMode
        super.init(toolActionPhaseSliceType: .setEditMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetEditMode")
        }
    }
}

class ToolActionPhaseSliceSetWeightMode: ToolActionPhaseSlice {
    let weightMode: WeightMode
    init(weightMode: WeightMode) {
        self.weightMode = weightMode
        super.init(toolActionPhaseSliceType: .setWeightMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetWeightMode")
        }
    }
}

/*
class ToolActionPhaseSliceSetAnimationMode: ToolActionPhaseSlice {
    let animationMode: AnimationMode
    init(animationMode: AnimationMode) {
        self.animationMode = animationMode
        super.init(toolActionPhaseSliceType: .setAnimationMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetAnimationMode")
        }
    }
}
*/

class ToolActionPhaseSliceSetRenderingMode: ToolActionPhaseSlice {
    let isRenderingRegularMode: Bool
    let isRenderingSwivelMode: Bool
    
    init(isRenderingRegularMode: Bool,
         isRenderingSwivelMode: Bool) {
        self.isRenderingRegularMode = isRenderingRegularMode
        self.isRenderingSwivelMode = isRenderingSwivelMode
        super.init(toolActionPhaseSliceType: .setRenderingMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetRenderingMode")
        }
    }
}

class ToolActionPhaseSliceJiggleMeshCommandAllJiggles: ToolActionPhaseSlice {
    let meshCommand: JiggleMeshCommand
    let guideCommand: GuideCommand
    init(meshCommand: JiggleMeshCommand,
         guideCommand: GuideCommand) {
        self.meshCommand = meshCommand
        self.guideCommand = guideCommand
        super.init(toolActionPhaseSliceType: .jiggleMeshCommandAllJiggles, sleepTicks: 2)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceJiggleMeshCommand")
        }
    }
}

class ToolActionPhaseSliceJiggleMeshCommandOneJiggle: ToolActionPhaseSlice {
    let meshCommand: JiggleMeshCommand
    let guideCommand: GuideCommand
    let jiggle: Jiggle
    init(meshCommand: JiggleMeshCommand,
         guideCommand: GuideCommand,
         jiggle: Jiggle) {
        self.meshCommand = meshCommand
        self.guideCommand = guideCommand
        self.jiggle = jiggle
        super.init(toolActionPhaseSliceType: .jiggleMeshCommandOneJiggles, sleepTicks: 2)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceJiggleMeshCommand")
        }
    }
}

class ToolActionPhaseSliceSetDarkModeEnabled: ToolActionPhaseSlice {
    let isDarkModeEnabled: Bool
    init(isDarkModeEnabled: Bool) {
        self.isDarkModeEnabled = isDarkModeEnabled
        super.init(toolActionPhaseSliceType: .setDarkModeEnabled, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetDarkModeEnabled")
        }
    }
}

class ToolActionPhaseSliceSetPurchasedEnabled: ToolActionPhaseSlice {
    let isPurchased: Bool
    init(isPurchased: Bool) {
        self.isPurchased = isPurchased
        super.init(toolActionPhaseSliceType: .setPurchasedEnabled, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetPurchasedEnabled")
        }
    }
}

class ToolActionPhaseSliceLockState: ToolActionPhaseSlice {
    init() {
        super.init(toolActionPhaseSliceType: .lockShowingState, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceLockState")
        }
    }
}

class ToolActionPhaseSliceUnlockState: ToolActionPhaseSlice {
    init() {
        super.init(toolActionPhaseSliceType: .unlockShowingState, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceUnlockState")
        }
    }
}


class ToolActionPhaseSliceDisableAllCreateModes: ToolActionPhaseSlice {
    init() {
        super.init(toolActionPhaseSliceType: .disableAllCreateModes, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceUnlockState")
        }
    }
}



class ToolActionPhaseSliceUpdateInterfaceConfigurationPad: ToolActionPhaseSlice {
    let interfaceConfigurationPrevious: InterfaceConfigurationPad
    let interfaceConfigurationCurrent: InterfaceConfigurationPad
    init(interfaceConfigurationPrevious: InterfaceConfigurationPad,
         interfaceConfigurationCurrent: InterfaceConfigurationPad) {
        self.interfaceConfigurationPrevious = interfaceConfigurationPrevious
        self.interfaceConfigurationCurrent = interfaceConfigurationCurrent
        super.init(toolActionPhaseSliceType: .updateInterfaceConfigurationPad, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceUpdateInterfaceConfigurationPad")
        }
    }
}

class ToolActionPhaseSliceUpdateInterfaceConfigurationPhone: ToolActionPhaseSlice {
    let interfaceConfigurationPrevious: InterfaceConfigurationPhone
    let interfaceConfigurationCurrent: InterfaceConfigurationPhone
    init(interfaceConfigurationPrevious: InterfaceConfigurationPhone,
         interfaceConfigurationCurrent: InterfaceConfigurationPhone) {
        self.interfaceConfigurationPrevious = interfaceConfigurationPrevious
        self.interfaceConfigurationCurrent = interfaceConfigurationCurrent
        super.init(toolActionPhaseSliceType: .updateInterfaceConfigurationPhone, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceUpdateInterfaceConfigurationPhone")
        }
    }
}

class ToolActionPhaseSlicePrepareInterfaceConfigurationPad: ToolActionPhaseSlice {
    let interfaceConfigurationPrevious: InterfaceConfigurationPad
    let interfaceConfigurationCurrent: InterfaceConfigurationPad
    init(interfaceConfigurationPrevious: InterfaceConfigurationPad,
         interfaceConfigurationCurrent: InterfaceConfigurationPad) {
        self.interfaceConfigurationPrevious = interfaceConfigurationPrevious
        self.interfaceConfigurationCurrent = interfaceConfigurationCurrent
        super.init(toolActionPhaseSliceType: .prepareInterfaceConfigurationPad, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSlicePrepareInterfaceConfigurationPad")
        }
    }
}

class ToolActionPhaseSlicePrepareInterfaceConfigurationPhone: ToolActionPhaseSlice {
    let interfaceConfigurationPrevious: InterfaceConfigurationPhone
    let interfaceConfigurationCurrent: InterfaceConfigurationPhone
    init(interfaceConfigurationPrevious: InterfaceConfigurationPhone,
         interfaceConfigurationCurrent: InterfaceConfigurationPhone) {
        self.interfaceConfigurationPrevious = interfaceConfigurationPrevious
        self.interfaceConfigurationCurrent = interfaceConfigurationCurrent
        super.init(toolActionPhaseSliceType: .prepareInterfaceConfigurationPhone, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSlicePrepareInterfaceConfigurationPhone")
        }
    }
}

class ToolActionPhaseSliceAnyClosure: ToolActionPhaseSlice {
    let code: (() -> Void)?
    init(code: (() -> Void)?) {
        self.code = code
        super.init(toolActionPhaseSliceType: .anyClosure, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceAnyClosure")
        }
    }
}
