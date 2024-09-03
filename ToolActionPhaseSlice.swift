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
    case setAutoLoopMode
    case setStereoscopicMode
    
    case setExpandedDraggable
    case setExpandedPhoneTop
    case setExpandedPhoneBottom
    
    case setDocumentMode
    case setEditMode
    case setWeightMode
    case setAnimationMode
    case setViewMode
    
    case setDarkModeEnabled
    
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
    
    case setJiggleCentersEnabled
    case setGuideCentersEnabled
    
    
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

class ToolActionPhaseSliceSetAutoLoopMode: ToolActionPhaseSlice {
    let isAutoLoopMode: Bool
    init(isAutoLoopMode: Bool) {
        self.isAutoLoopMode = isAutoLoopMode
        super.init(toolActionPhaseSliceType: .setAutoLoopMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetAutoLoopMode")
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

class ToolActionPhaseSliceSetJiggleCentersEnabled: ToolActionPhaseSlice {
    let isJiggleCentersEnabled: Bool
    init(isJiggleCentersEnabled: Bool) {
        self.isJiggleCentersEnabled = isJiggleCentersEnabled
        super.init(toolActionPhaseSliceType: .setJiggleCentersEnabled, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetJiggleCentersEnabled")
        }
    }
}

class ToolActionPhaseSliceSetGuideCentersEnabled: ToolActionPhaseSlice {
    let isGuideCentersEnabled: Bool
    init(isGuideCentersEnabled: Bool) {
        self.isGuideCentersEnabled = isGuideCentersEnabled
        super.init(toolActionPhaseSliceType: .setGuideCentersEnabled, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetGuideCentersEnabled")
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

class ToolActionPhaseSliceSetViewMode: ToolActionPhaseSlice {
    let viewMode: ViewMode
    init(viewMode: ViewMode) {
        self.viewMode = viewMode
        super.init(toolActionPhaseSliceType: .setViewMode, sleepTicks: 0)
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ToolActionPhaseSliceSetViewMode")
        }
    }
}

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
    let weightRingCommand: JiggleWeightRingCommand
    init(meshCommand: JiggleMeshCommand,
         weightRingCommand: JiggleWeightRingCommand) {
        self.meshCommand = meshCommand
        self.weightRingCommand = weightRingCommand
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
    let weightRingCommand: JiggleWeightRingCommand
    let jiggle: Jiggle
    init(meshCommand: JiggleMeshCommand,
         weightRingCommand: JiggleWeightRingCommand,
         jiggle: Jiggle) {
        self.meshCommand = meshCommand
        self.weightRingCommand = weightRingCommand
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
