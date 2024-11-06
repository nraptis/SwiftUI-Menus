//
//  ToolInterfaceFactory+CheckBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getDarkModeEnabledCheckBoxToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextDarkModeEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextDarkModeEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.darkModeA
        
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelDarkMode = MagicalCheckBoxViewModelDarkModeEnabled(orientation: orientation,
                                                                        checkBoxConfiguration: configuration)
        let darkModeToolNode = ToolNode(id: getToolNodeID(),
                                        element: .checkBoxDarkMode,
                                        flex: flex,
                                        magicalViewModel: viewModelDarkMode,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelDarkMode.refresh()
        return darkModeToolNode
    }
    
    static func getStereoscopicEnabledCheckBoxToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStereoscopicEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStereoscopicEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelStereoscopicEnabled = MagicalCheckBoxViewModelStereoscopicEnabled(orientation: orientation,
                                                                                       checkBoxConfiguration: configuration)
        let stereoscopicEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .checkBoxStereoscopicEnabled,
                                                   flex: flex,
                                                   magicalViewModel: viewModelStereoscopicEnabled,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelStereoscopicEnabled.refresh()
        return stereoscopicEnabledToolNode
    }
    
    static func getPurchasedEnabledCheckBoxToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = "IZ"
        let textLine2 = "BUY"
        let iconPack = FramedConvertibleIconLibrary.weightRingD
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelPurchasedEnabled = MagicalCheckBoxViewModelPurchasedEnabled(orientation: orientation,
                                                                                 checkBoxConfiguration: configuration)
        let stereoscopicEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .checkBoxPurchasedEnabled,
                                                   flex: flex,
                                                   magicalViewModel: viewModelPurchasedEnabled,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelPurchasedEnabled.refresh()
        return stereoscopicEnabledToolNode
    }
    
    static func getAnimationLoopApplyToAllCheckBoxToolNode(orientation: Orientation,
                                                           neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationLoopApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationLoopApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationLoopApplyToAll = MagicalCheckBoxViewModelAnimationLoopApplyToAll(orientation: orientation,
                                                                                               checkBoxConfiguration: configuration)
        let animationBounceApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .checkBoxAnimationLoopApplyToAll,
                                                         flex: flex,
                                                         magicalViewModel: viewModelAnimationLoopApplyToAll,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelAnimationLoopApplyToAll.refresh()
        return animationBounceApplyToAllToolNode
    }
    
    static func getAnimationGrabApplyToAllCheckBoxToolNode(orientation: Orientation,
                                                           neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationGrabApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationGrabApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.weightRingC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationGrabApplyToAll = MagicalCheckBoxViewModelAnimationGrabApplyToAll(orientation: orientation,
                                                                                               checkBoxConfiguration: configuration)
        let animationJiggleApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .checkBoxAnimationGrabApplyToAll,
                                                         flex: flex,
                                                         magicalViewModel: viewModelAnimationGrabApplyToAll,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelAnimationGrabApplyToAll.refresh()
        return animationJiggleApplyToAllToolNode
    }
    
    static func getAnimationContinuousApplyToAllCheckBoxToolNode(orientation: Orientation,
                                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationContinuousApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationContinuousApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationContinuousApplyToAll = MagicalCheckBoxViewModelAnimationContinuousApplyToAll(orientation: orientation,
                                                                                                           checkBoxConfiguration: configuration)
        let animationBounceApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .checkBoxAnimationContinuousApplyToAll,
                                                         flex: flex,
                                                         magicalViewModel: viewModelAnimationContinuousApplyToAll,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelAnimationContinuousApplyToAll.refresh()
        return animationBounceApplyToAllToolNode
    }
    
    static func getContinuousDisableGrabEnabledCheckBoxToolNode(orientation: Orientation,
                                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextContinuousDisableGrabLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextContinuousDisableGrabLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousDisableGrab = MagicalCheckBoxViewModelContinuousDisableGrab(orientation: orientation,
                                                                                           checkBoxConfiguration: configuration)
        let animationBounceApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .checkBoxContinuousDisableGrab,
                                                         flex: flex,
                                                         magicalViewModel: viewModelContinuousDisableGrab,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelContinuousDisableGrab.refresh()
        return animationBounceApplyToAllToolNode
    }
    
    static func getGyroscopeEnabledCheckBoxToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGyroscopeEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextGyroscopeEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelGyroscopeEnabled = MagicalCheckBoxViewModelGyroscopeEnabled(orientation: orientation,
                                                                                 checkBoxConfiguration: configuration)
        let gyroscopeEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                element: .checkBoxGyroscopeEnabled,
                                                flex: flex,
                                                magicalViewModel: viewModelGyroscopeEnabled,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelGyroscopeEnabled.refresh()
        return gyroscopeEnabledToolNode
    }
    
    static func getRecordAudioEnabledCheckBoxToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextRecordAudioEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextRecordAudioEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelRecordAudioEnabled = MagicalCheckBoxViewModelRecordAudioEnabled(orientation: orientation,
                                                                                     checkBoxConfiguration: configuration)
        let recordAudioEnabledToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .checkBoxRecordAudioEnabled,
                                                  flex: flex,
                                                  magicalViewModel: viewModelRecordAudioEnabled,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelRecordAudioEnabled.refresh()
        return recordAudioEnabledToolNode
    }
}
