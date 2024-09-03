//
//  InterfaceConfiguration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

struct InterfacePrimaryMenuAction {
    
    enum Pane {
        case standard
        case zoom
        case videoRecord
        case videoExport
    }
    
    enum MainAction {
        enum StandardType {
            case none
            case updateRows
            case graphEnter
            case graphExit // This will update the rows too...
        }
        case none
        case standard(StandardType)
        case transition(Pane, Pane)
        case snap(Pane)
    }
    
    enum StartAction {
        case snapGraphEnter
        case snapGraphExit // This will update the rows too...
        case none
    }
    
    let mainAction: MainAction
    let startAction: StartAction
    
    init(mainAction: MainAction, startAction: StartAction) {
        self.mainAction = mainAction
        self.startAction = startAction
    }
}

struct InterfaceSecondaryMenuAction {
    
    enum Pane {
        case standard
        case zoom
        case videoRecord
        case videoExport
    }
    
    enum MainAction {
        case none
        case standardUpdateRows
        case transition(Pane, Pane)
        case snap(Pane)
    }
    
    enum StartAction {
        case snapUpdateRows
        case none
    }
    
    let mainAction: MainAction
    let startAction: StartAction
    
    init(mainAction: MainAction, startAction: StartAction) {
        self.mainAction = mainAction
        self.startAction = startAction
    }
}

protocol InterfaceConfigurationConforming {
    var isVideoRecordEnabled: Bool { get set }
    var isVideoExportEnabled: Bool { get set }
    var isGraphEnabled: Bool { get set }
    var isZoomEnabled: Bool { get set }
    var isGuidesEnabled: Bool { get set }
    
    var documentMode: DocumentMode { get set }
    var editMode: EditMode { get set }
    
    var weightMode: WeightMode { get set }
    var animationMode: AnimationMode { get set }
    var viewMode: ViewMode { get set }
    
    var isExpanded: Bool { get set }
    var isExpandedTop: Bool { get set }
    var isExpandedBottom: Bool { get set }
    
    mutating func prepare()
    
    mutating func ensureConsistency()
    mutating func calculateHeightCategories()
    
    func isRightOf(_ configuration: any InterfaceConfigurationConforming) -> Bool
}

extension InterfaceConfigurationConforming {
    
    var displayMode: DisplayMode {
        switch documentMode {
        case .__EDIT:
            if isGuidesEnabled {
                if isGraphEnabled {
                    return .swivel
                } else {
                    return .regular
                }
            } else {
                return .regular
            }
        case .__VIEW:
            return .regular
        }
    }
    
    static func getMeshCommandRequired(previousConfiguration: any InterfaceConfigurationConforming,
                                       currentConfiguration: any InterfaceConfigurationConforming) -> Bool {
        
        let previousMeshType = JiggleMeshCommand.getMeshTypeForced(documentMode: previousConfiguration.documentMode,
                                                                   
                                                                   isGuidesEnabled: previousConfiguration.isGuidesEnabled)
        let currentMeshType = JiggleMeshCommand.getMeshTypeForced(documentMode: currentConfiguration.documentMode,
                                                    
                                                                  isGuidesEnabled: currentConfiguration.isGuidesEnabled)
        
        if previousMeshType != currentMeshType {
            return true
        }
        
        let previousWeightCurveType =  JiggleMeshCommand.getWeightCurveTypeForced(documentMode: previousConfiguration.documentMode,
                                                                                  isGuidesEnabled: previousConfiguration.isGuidesEnabled,
                                                                                  isGraphEnabled: previousConfiguration.isGraphEnabled)
        let currentWeightCurveType = JiggleMeshCommand.getWeightCurveTypeForced(documentMode: currentConfiguration.documentMode,
                                                                                isGuidesEnabled: currentConfiguration.isGuidesEnabled,
                                                                                isGraphEnabled: currentConfiguration.isGraphEnabled)
        switch previousWeightCurveType {
        case .forced:
            break
        default:
            switch currentWeightCurveType {
            case .forced:
                return true
            default:
                break
            }
        }
        
        let previousSwivelType = JiggleMeshCommand.getSwivelTypeForced(documentMode: previousConfiguration.documentMode,
                                                                       displayMode: previousConfiguration.displayMode,
                                                                       isGuidesEnabled: previousConfiguration.isGuidesEnabled,
                                                                       isGraphEnabled: previousConfiguration.isGraphEnabled)
        
        let currentSwivelType = JiggleMeshCommand.getSwivelTypeForced(documentMode: currentConfiguration.documentMode,
                                                                      displayMode: currentConfiguration.displayMode,
                                                                      isGuidesEnabled: currentConfiguration.isGuidesEnabled,
                                                                      isGraphEnabled: currentConfiguration.isGraphEnabled)
        
        switch previousSwivelType {
        case .forced:
            break
        default:
            switch currentSwivelType {
            case .forced:
                return true
            default:
                break
            }
        }
        
        return false
    }
    
    static func getAnimationTime(previousConfiguration: any InterfaceConfigurationConforming,
                                 previousExpanded1: Bool,
                                 previousExpanded2: Bool,
                                 currentConfiguration: any InterfaceConfigurationConforming,
                                 currentExpanded1: Bool,
                                 currentExpanded2: Bool,
                                 orientation: Orientation) -> CGFloat {
        
        var isExpandedCollapsedAnimating = false
        if previousExpanded1 != currentExpanded1 {
            isExpandedCollapsedAnimating = true
        }
        if previousExpanded2 != currentExpanded2 {
            isExpandedCollapsedAnimating = true
        }
        
        var isRowsAnimationActive = false
        if currentExpanded1 || currentExpanded2 {
            if currentConfiguration.isVideoExportEnabled != previousConfiguration.isVideoRecordEnabled {
                isRowsAnimationActive = true
            } else if currentConfiguration.isVideoRecordEnabled != previousConfiguration.isVideoRecordEnabled {
                isRowsAnimationActive = true
            } else if currentConfiguration.isZoomEnabled != previousConfiguration.isZoomEnabled {
                isRowsAnimationActive = true
            } else if currentConfiguration.isGraphEnabled != previousConfiguration.isGraphEnabled {
                isRowsAnimationActive = true
            } else {
                if currentConfiguration.documentMode != previousConfiguration.documentMode {
                    isRowsAnimationActive = true
                }
                if currentConfiguration.editMode != previousConfiguration.editMode {
                    isRowsAnimationActive = true
                }
                if currentConfiguration.displayMode != previousConfiguration.displayMode {
                    isRowsAnimationActive = true
                }
                if currentConfiguration.weightMode != previousConfiguration.weightMode {
                    isRowsAnimationActive = true
                }
                if currentConfiguration.isGuidesEnabled != previousConfiguration.isGuidesEnabled {
                    isRowsAnimationActive = true
                }
            }
        }
        
        var isDisplayAnimationActive = false
        if previousConfiguration.isGuides || currentConfiguration.isGuides {
            if previousConfiguration.displayMode != currentConfiguration.displayMode {
                isDisplayAnimationActive = true
            }
        }
        
        var result = CGFloat(0.0)
        if isExpandedCollapsedAnimating {
            let possibleTime = JiggleViewController.getExpandCollapseAnimationTime(orientation: orientation)
            result = max(result, possibleTime)
        }
        if isRowsAnimationActive {
            let possibleTime = JiggleViewController.getRowsAnimationTime(orientation: orientation)
            result = max(result, possibleTime)
        }
        if isDisplayAnimationActive {
            let possibleTime = JiggleViewController.getDisplayAnimationTime()
            result = max(result, possibleTime)
        }
        return result
    }
    
    static func getPhaseSliceSetRenderingModeTransition(previousConfiguration: any InterfaceConfigurationConforming,
                                                        currentConfiguration: any InterfaceConfigurationConforming) -> ToolActionPhaseSliceSetRenderingMode {
        
        var isRenderingRegularMode = false
        var isRenderingSwivelMode = false
        
        switch previousConfiguration.displayMode {
        case .regular:
            isRenderingRegularMode = true
        case .swivel:
            isRenderingSwivelMode = true
        }
        
        switch currentConfiguration.displayMode {
        case .regular:
            isRenderingRegularMode = true
        case .swivel:
            isRenderingSwivelMode = true
        }
        return ToolActionPhaseSliceSetRenderingMode(isRenderingRegularMode: isRenderingRegularMode,
                                                    isRenderingSwivelMode: isRenderingSwivelMode)
    }
    
    static func getPhaseSliceSetRenderingModeTransitionComplete(currentConfiguration: any InterfaceConfigurationConforming) -> ToolActionPhaseSliceSetRenderingMode {
        switch currentConfiguration.displayMode {
        case .regular:
            return ToolActionPhaseSliceSetRenderingMode(isRenderingRegularMode: true, isRenderingSwivelMode: false)
        case .swivel:
            return ToolActionPhaseSliceSetRenderingMode(isRenderingRegularMode: false, isRenderingSwivelMode: true)
        }
    }
    
    static func getMeshCommand(previous: any InterfaceConfigurationConforming,
                               current: any InterfaceConfigurationConforming) -> JiggleMeshCommand {
        let meshType = JiggleMeshCommand.getMeshTypeIfNeeded(documentMode: current.documentMode,
                                                             isGuidesEnabled: current.isGuidesEnabled)
        let swivelType = JiggleMeshCommand.getSwivelTypeIfNeeded(documentMode: current.documentMode,
                                                                 displayMode: current.displayMode,
                                                                 isGuidesEnabled: current.isGuidesEnabled,
                                                                 isGraphEnabled: current.isGraphEnabled)
        let weightCurveType = JiggleMeshCommand.getWeightCurveTypeIfNeeded(documentMode: current.documentMode,
                                                                           isGuidesEnabled: current.isGuidesEnabled,
                                                                           isGraphEnabled: current.isGraphEnabled)
        
        return JiggleMeshCommand(spline: false,
                                 triangulationType: .beautiful,
                                 meshType: meshType,
                                 outlineType: .ifNeeded,
                                 swivelType: swivelType,
                                 weightCurveType: weightCurveType)
    }
    
    static func getPrimaryAction(previousConfiguration: some InterfaceConfigurationConforming,
                                 previousExpanded: Bool,
                                 currentConfiguration: some InterfaceConfigurationConforming,
                                 currentExpanded: Bool) -> InterfacePrimaryMenuAction {
        
        // If we were not expanded and we're
        // still not expanded, we don't need
        // to make any change.
        if (previousExpanded == false) && (currentExpanded == false) {
            return InterfacePrimaryMenuAction(mainAction: .none,  startAction: .none)
        }
        
        // If we were expanded and now we're not,
        // then we do not do any action, keep the
        // menu as it was... We will collapse the
        // menu as it was... And nothing flies in.
        if (previousExpanded == true) && (currentExpanded == false) {
            return InterfacePrimaryMenuAction(mainAction: .none, startAction: .none)
        }
        
        // If we were not expanded and now
        // we are expanded, then we can
        // snap to the appropriate mode
        // before having the menu flying in.
        if (previousExpanded == false) && (currentExpanded == true) {
            if currentConfiguration.isVideoExportEnabled {
                return InterfacePrimaryMenuAction(mainAction: .snap(.videoExport),
                                                  startAction: .none)
            } else if currentConfiguration.isVideoRecordEnabled {
                return InterfacePrimaryMenuAction(mainAction: .snap(.videoRecord),
                                                  startAction: .none)
            } else if currentConfiguration.isZoomEnabled {
                return InterfacePrimaryMenuAction(mainAction: .snap(.zoom),
                                                  startAction: .none)
            } else if currentConfiguration.isGraphEnabled {
                return InterfacePrimaryMenuAction(mainAction: .snap(.standard),
                                                  startAction: .snapGraphEnter)
            } else {
                return InterfacePrimaryMenuAction(mainAction: .snap(.standard),
                                                  startAction: .snapGraphExit)
            }
        }
        
        //
        // In all the remaining cases,
        // we started out expanded, and
        // we are staying expanded...
        //
        
        // // //
        // // //
        // // // //
        // // // // //
        // // // //
        // // //
        // // //
        
        //
        // "Video Export" takes 1st priority...
        //
        if currentConfiguration.isVideoExportEnabled {
            if previousConfiguration.isVideoExportEnabled {
                // From Export to Export
                return InterfacePrimaryMenuAction(mainAction: .none,  startAction: .none)
            } else if previousConfiguration.isVideoRecordEnabled {
                // From Record to Export
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoRecord, .videoExport),
                                                  startAction: .none)
            } else if previousConfiguration.isZoomEnabled {
                // From Zoom to Export
                return InterfacePrimaryMenuAction(mainAction: .transition(.zoom, .videoExport),
                                                  startAction: .none)
            } else  {
                // From Standard to Export
                return InterfacePrimaryMenuAction(mainAction: .transition(.standard, .videoExport),
                                                  startAction: .none)
            }
        } else if previousConfiguration.isVideoExportEnabled {
            if currentConfiguration.isVideoRecordEnabled {
                // From Export to Record
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoExport, .videoRecord),
                                                  startAction: .none)
            } else if currentConfiguration.isZoomEnabled {
                // From Export to Zoom
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoExport, .zoom),
                                                  startAction: .none)
            } else if currentConfiguration.isGraphEnabled {
                // From Export to Graph
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoExport, .standard),
                                                  startAction: .snapGraphEnter)
            } else {
                // From Export to Menu
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoExport, .standard),
                                                  startAction: .snapGraphExit)
            }
        }
        
        // // //
        // // //
        // // // //
        // // // // //
        // // // //
        // // //
        // // //
        
        //
        // "Video Record" takes 2nd priority...
        //
        if currentConfiguration.isVideoRecordEnabled {
            if previousConfiguration.isVideoRecordEnabled {
                // From Record to Record
                return InterfacePrimaryMenuAction(mainAction: .none,  startAction: .none)
            } else if previousConfiguration.isZoomEnabled {
                // From Zoom to Record
                return InterfacePrimaryMenuAction(mainAction: .transition(.zoom, .videoRecord),
                                                  startAction: .none)
            } else  {
                // From Standard to Record
                return InterfacePrimaryMenuAction(mainAction: .transition(.standard, .videoRecord),
                                                  startAction: .none)
            }
        } else if previousConfiguration.isVideoRecordEnabled {
            if currentConfiguration.isZoomEnabled {
                // From Record to Zoom
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoRecord, .zoom),
                                                  startAction: .none)
            } else if currentConfiguration.isGraphEnabled {
                // From Record to Graph
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoRecord, .standard),
                                                  startAction: .snapGraphEnter)
            } else {
                // From Record to Menu
                return InterfacePrimaryMenuAction(mainAction: .transition(.videoRecord, .standard),
                                                  startAction: .snapGraphExit)
            }
        }
        
        // // //
        // // //
        // // // //
        // // // // //
        // // // //
        // // //
        // // //
        
        //
        // "Zoom" takes 3rd priority...
        //
        if currentConfiguration.isZoomEnabled {
            if previousConfiguration.isZoomEnabled {
                // From Zoom to Zoom
                return InterfacePrimaryMenuAction(mainAction: .none,  startAction: .none)
            } else  {
                // From Standard to Zoom
                return InterfacePrimaryMenuAction(mainAction: .transition(.standard, .zoom),
                                                  startAction: .none)
            }
        } else if previousConfiguration.isZoomEnabled {
            if currentConfiguration.isGraphEnabled {
                // From Zoom to Graph
                return InterfacePrimaryMenuAction(mainAction: .transition(.zoom, .standard),
                                                  startAction: .snapGraphEnter)
            } else {
                // From Zoom to Menu
                return InterfacePrimaryMenuAction(mainAction: .transition(.zoom, .standard),
                                                  startAction: .snapGraphExit)
            }
        }
        
        //
        // "Graph" takes 4th priority...
        //
        if currentConfiguration.isGraphEnabled {
            if previousConfiguration.isGraphEnabled {
                // From Graph to Graph
                return InterfacePrimaryMenuAction(mainAction: .none,  startAction: .none)
            } else  {
                // From Menu to Graph
                return InterfacePrimaryMenuAction(mainAction: .standard(.graphEnter),
                                                  startAction: .none)
            }
        } else if previousConfiguration.isGraphEnabled {
            // From Graph to Menu
            return InterfacePrimaryMenuAction(mainAction: .standard(.graphExit),
                                              startAction: .none)
        }
        
        return InterfacePrimaryMenuAction(mainAction: .standard(.updateRows),
                                          startAction: .none)
    }
    
    static func getSecondaryAction(previousConfiguration: some InterfaceConfigurationConforming,
                                   previousExpanded: Bool,
                                   currentConfiguration: some InterfaceConfigurationConforming,
                                   currentExpanded: Bool) -> InterfaceSecondaryMenuAction {
        
        // If we were not expanded and we're
        // still not expanded, we don't need
        // to make any change.
        if (previousExpanded == false) && (currentExpanded == false) {
            return InterfaceSecondaryMenuAction(mainAction: .none,  startAction: .none)
        }
        
        // If we were expanded and now we're not,
        // then we do not do any action, keep the
        // menu as it was... We will collapse the
        // menu as it was... And nothing flies in.
        if (previousExpanded == true) && (currentExpanded == false) {
            return InterfaceSecondaryMenuAction(mainAction: .none, startAction: .none)
        }
        
        // If we were not expanded and now
        // we are expanded, then we can
        // snap to the appropriate mode
        // before having the menu flying in.
        if (previousExpanded == false) && (currentExpanded == true) {
            if currentConfiguration.isVideoExportEnabled {
                return InterfaceSecondaryMenuAction(mainAction: .snap(.videoExport),
                                                    startAction: .none)
            } else if currentConfiguration.isVideoRecordEnabled {
                return InterfaceSecondaryMenuAction(mainAction: .snap(.videoRecord),
                                                    startAction: .none)
            } else if currentConfiguration.isZoomEnabled {
                return InterfaceSecondaryMenuAction(mainAction: .snap(.zoom),
                                                    startAction: .none)
            } else {
                return InterfaceSecondaryMenuAction(mainAction: .snap(.standard),
                                                    startAction: .snapUpdateRows)
            }
        }
        
        //
        // In all the remaining cases,
        // we started out expanded, and
        // we are staying expanded...
        //
        
        // // //
        // // //
        // // // //
        // // // // //
        // // // //
        // // //
        // // //
        
        //
        // "Video Export" takes 1st priority...
        //
        if currentConfiguration.isVideoExportEnabled {
            if previousConfiguration.isVideoExportEnabled {
                // From Export to Export
                return InterfaceSecondaryMenuAction(mainAction: .none,  startAction: .none)
            } else if previousConfiguration.isVideoRecordEnabled {
                // From Record to Export
                return InterfaceSecondaryMenuAction(mainAction: .transition(.videoRecord, .videoExport),
                                                    startAction: .none)
            } else if previousConfiguration.isZoomEnabled {
                // From Zoom to Export
                return InterfaceSecondaryMenuAction(mainAction: .transition(.zoom, .videoExport),
                                                    startAction: .none)
            } else  {
                // From Standard to Export
                return InterfaceSecondaryMenuAction(mainAction: .transition(.standard, .videoExport),
                                                    startAction: .none)
            }
        } else if previousConfiguration.isVideoExportEnabled {
            if currentConfiguration.isVideoRecordEnabled {
                // From Export to Record
                return InterfaceSecondaryMenuAction(mainAction: .transition(.videoExport, .videoRecord),
                                                    startAction: .none)
            } else if currentConfiguration.isZoomEnabled {
                // From Export to Zoom
                return InterfaceSecondaryMenuAction(mainAction: .transition(.videoExport, .zoom),
                                                    startAction: .none)
            } else {
                // From Export to Menu
                return InterfaceSecondaryMenuAction(mainAction: .transition(.videoExport, .standard),
                                                    startAction: .snapUpdateRows)
            }
        }
        
        // // //
        // // //
        // // // //
        // // // // //
        // // // //
        // // //
        // // //
        
        //
        // "Video Record" takes 2nd priority...
        //
        if currentConfiguration.isVideoRecordEnabled {
            if previousConfiguration.isVideoRecordEnabled {
                // From Record to Record
                return InterfaceSecondaryMenuAction(mainAction: .none,  startAction: .none)
            } else if previousConfiguration.isZoomEnabled {
                // From Zoom to Record
                return InterfaceSecondaryMenuAction(mainAction: .transition(.zoom, .videoRecord),
                                                    startAction: .none)
            } else  {
                // From Standard to Record
                return InterfaceSecondaryMenuAction(mainAction: .transition(.standard, .videoRecord),
                                                    startAction: .none)
            }
        } else if previousConfiguration.isVideoRecordEnabled {
            if currentConfiguration.isZoomEnabled {
                // From Record to Zoom
                return InterfaceSecondaryMenuAction(mainAction: .transition(.videoRecord, .zoom),
                                                    startAction: .none)
            } else {
                // From Record to Menu
                return InterfaceSecondaryMenuAction(mainAction: .transition(.videoRecord, .standard),
                                                    startAction: .snapUpdateRows)
            }
        }
        
        // // //
        // // //
        // // // //
        // // // // //
        // // // //
        // // //
        // // //
        
        //
        // "Zoom" takes 3rd priority...
        //
        if currentConfiguration.isZoomEnabled {
            if previousConfiguration.isZoomEnabled {
                // From Zoom to Zoom
                return InterfaceSecondaryMenuAction(mainAction: .none,  startAction: .none)
            } else  {
                // From Standard to Zoom
                return InterfaceSecondaryMenuAction(mainAction: .transition(.standard, .zoom),
                                                  startAction: .none)
            }
        } else if previousConfiguration.isZoomEnabled {
            return InterfaceSecondaryMenuAction(mainAction: .transition(.zoom, .standard),
                                                startAction: .snapUpdateRows)
        }
        
        return InterfaceSecondaryMenuAction(mainAction: .standardUpdateRows,
                                            startAction: .none)
    }
    
    mutating func prepare() {
        ensureConsistency()
        calculateHeightCategories()
    }
    
    mutating func ensureConsistency() {
        
        if isVideoExportEnabled {
            isGraphEnabled = false
        }
        
        if isVideoRecordEnabled {
            isGraphEnabled = false
            isGuidesEnabled = false
        }
        
        switch documentMode {
        case .__VIEW:
            isGraphEnabled = false
        case .__EDIT:
            if isGuidesEnabled == false {
                isGraphEnabled = false
            }
        }
    }
    
    func isRightOf(_ configuration: any InterfaceConfigurationConforming) -> Bool {
        
        if isVideoExportEnabled {
            if configuration.isVideoExportEnabled {
                return false
            } else {
                return true
            }
        }
        
        if configuration.isVideoExportEnabled {
            return false
        }
        
        if isVideoRecordEnabled {
            if configuration.isVideoRecordEnabled {
                return false
            } else {
                return true
            }
        } else if configuration.isVideoRecordEnabled {
            return false
        }
        
        if isZoomEnabled {
            if configuration.isZoomEnabled {
                return false
            } else {
                return true
            }
        } else if configuration.isZoomEnabled {
            return false
        }
        
        if documentMode.isRightOf(documentMode: configuration.documentMode) {
            return true
        }
        
        if isGraphEnabled {
            if configuration.isGraphEnabled {
                return false
            } else {
                return true
            }
        } else if configuration.isGraphEnabled {
            return false
        }
        
        if isGuidesEnabled {
            if configuration.isGuidesEnabled {
                return false
            } else {
                return true
            }
        } else if configuration.isGuidesEnabled {
            return false
        }
        
        if editMode.isRightOf(editMode: configuration.editMode) {
            return true
        }
        
        return false
    }
}



struct InterfaceConfigurationPad: InterfaceConfigurationConforming {
    
    var heightCategory = MenuHeightCategoryPad.standard
    var isExpanded = true
    var isExpandedTop = true // *NOT USED*
    var isExpandedBottom = true // *NOT USED*
    var isVideoRecordEnabled = false
    var isVideoExportEnabled = false
    var isGraphEnabled = false
    var isZoomEnabled = false
    var isGuidesEnabled = false
    
    var documentMode = DocumentMode.__EDIT
    var editMode = EditMode.jiggles
    var weightMode = WeightMode.affine
    var animationMode = AnimationMode.bounce
    var viewMode = ViewMode.standard
    
    mutating func calculateHeightCategories() {
        if isVideoExportEnabled {
            heightCategory = .videoExport
        } else if isVideoRecordEnabled {
            heightCategory = .videoRecord
        } else if isZoomEnabled {
            heightCategory = .zoom
        } else {
            heightCategory = .standard
        }
    }
}

extension InterfaceConfigurationPad: CustomStringConvertible {
    var description: String {
        var result = "Pad: {\n"
        result += "\texpanded: \(isExpanded), record: \(isVideoRecordEnabled)\n"
        result += "\texport: \(isVideoExportEnabled), graph: \(isGraphEnabled), zoom: \(isZoomEnabled)\n"
        result += "\tdoc: \(documentMode), weight: \(weightMode), display: \(displayMode)\n"
        result += "\theight: \(heightCategory)\n"
        result += "}"
        return result
    }
}

struct InterfaceConfigurationPhone: InterfaceConfigurationConforming {
    var heightCategoryTop = MenuHeightCategoryPhoneTop.standard
    var heightCategoryBottom = MenuHeightCategoryPhoneBottom.standard
    var isExpanded = true // *NOT USED*
    var isExpandedTop = true
    var isExpandedBottom = true
    var isVideoRecordEnabled = false
    var isVideoExportEnabled = false
    var isGraphEnabled = false
    var isZoomEnabled = false
    var isGuidesEnabled = false
    
    
    var documentMode = DocumentMode.__EDIT
    var editMode = EditMode.jiggles
    var weightMode = WeightMode.affine
    var animationMode = AnimationMode.bounce
    var viewMode = ViewMode.standard
    
    mutating func calculateHeightCategories() {
        if isVideoExportEnabled {
            heightCategoryTop = .videoExport
            heightCategoryBottom = .videoExport
        } else if isVideoRecordEnabled {
            heightCategoryTop = .videoRecord
            heightCategoryBottom = .videoRecord
        } else if isZoomEnabled {
            heightCategoryTop = .zoom
            heightCategoryBottom = .zoom
        } else if isGraphEnabled {
            heightCategoryTop = .graph
            heightCategoryBottom = .standard
        } else {
            heightCategoryTop = .standard
            heightCategoryBottom = .standard
        }
    }
}

extension InterfaceConfigurationConforming {
    
    var isView: Bool {
        switch documentMode {
        case .__VIEW:
            return true
        case .__EDIT:
            return false
        }
    }
    
    var isJiggles: Bool {
        switch documentMode {
        case .__VIEW:
            return false
        case .__EDIT:
            if isGuidesEnabled {
                return false
            } else {
                switch editMode {
                case .jiggles:
                    return true
                case .points:
                    return false
                }
            }
        }
    }
    
    var isPoints: Bool {
        switch documentMode {
        case .__VIEW:
            return false
        case .__EDIT:
            if isGuidesEnabled {
                return false
            } else {
                switch editMode {
                case .jiggles:
                    return false
                case .points:
                    return true
                }
            }
        }
    }
    
    var isGuides: Bool {
        switch documentMode {
        case .__VIEW:
            return false
        case .__EDIT:
            if isGuidesEnabled {
                return true
            } else {
                return false
            }
        }
    }
    
    var isGuidesAffine: Bool {
        if isGuides {
            switch weightMode {
            case .affine:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
    
    var isGuidesPoints: Bool {
        if isGuides {
            switch weightMode {
            case .points:
                return true
            default:
                return false
            }
        } else {
            return false
        }
    }
}

extension InterfacePrimaryMenuAction: CustomStringConvertible {
    
    var description: String {
        var result = ""
        
        func getPaneString(pane: InterfacePrimaryMenuAction.Pane) -> String {
            switch pane {
            case .standard:
                return "[standard]"
            case .zoom:
                return "[zoom]"
            case .videoRecord:
                return "[record]"
            case .videoExport:
                return "[export]"
            }
        }
        
        func getStartActionString(action: InterfacePrimaryMenuAction.StartAction) -> String {
            switch action {
            case .snapGraphEnter:
                return "snapGraphEnter"
            case .snapGraphExit:
                return "snapGraphExit"
            case .none:
                return "none"
            }
        }
        
        func getMainActionString(action: InterfacePrimaryMenuAction.MainAction) -> String {
            switch action {
            case .none:
                return "none"
            case .standard(let standardType):
                switch standardType {
                case .none:
                    return "standard(.none)"
                case .updateRows:
                    return "standard(.updateRows)"
                case .graphEnter:
                    return "standard(.graphEnter)"
                case .graphExit:
                    return "standard(.graphExit)"
                }
            case .transition(let startPane, let endPane):
                let startString = getPaneString(pane: startPane)
                let endString = getPaneString(pane: endPane)
                return "transition(from: \(startString), to: \(endString))"
            case .snap(let pane):
                let string = getPaneString(pane: pane)
                return "snap(\(string))"
            }
        }
        
        result += "{\n"
        result += "\tstartAction: \(getStartActionString(action: startAction))\n"
        result += "\tmainAction: \(getMainActionString(action: mainAction))\n"
        result += "}\n"
        
        return result
    }
    
}
