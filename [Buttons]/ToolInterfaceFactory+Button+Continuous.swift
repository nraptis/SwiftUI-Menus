//
//  ToolInterfaceFactory+Button+Continuous.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/31/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getContinuousSyncFramesButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousSyncFramesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousSyncFramesLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousSyncFrames = MagicalButtonViewModelContinuousSyncFrames(orientation: orientation,
                                                                                       buttonConfiguration: configuration)
        let continuousSyncFramesToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .buttonContinuousSyncFrames,
                                                    flex: flex,
                                                    magicalViewModel: viewModelContinuousSyncFrames,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelContinuousSyncFrames.refresh()
        return continuousSyncFramesToolNode
    }
    
    static func getContinuousResetAngleHorizontalButtonToolNode(orientation: Orientation,
                                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleHorizontalLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleHorizontalLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetAngleHorizontal = MagicalButtonViewModelContinuousResetAngleHorizontal(orientation: orientation,
                                                                                                           buttonConfiguration: configuration)
        let continuousResetAngleHorizontalToolNode = ToolNode(id: getToolNodeID(),
                                                              element: .buttonContinuousResetAngleHorizontal,
                                                              flex: flex,
                                                              magicalViewModel: viewModelContinuousResetAngleHorizontal,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetAngleHorizontal.refresh()
        return continuousResetAngleHorizontalToolNode
    }
    
    static func getContinuousResetAngleVerticalButtonToolNode(orientation: Orientation,
                                                              neighborTypeLeft: ToolInterfaceElementType?,
                                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleVerticalLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleVerticalLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetAngleVertical = MagicalButtonViewModelContinuousResetAngleVertical(orientation: orientation,
                                                                                                       buttonConfiguration: configuration)
        let continuousResetAngleVerticalToolNode = ToolNode(id: getToolNodeID(),
                                                            element: .buttonContinuousResetAngleVertical,
                                                            flex: flex,
                                                            magicalViewModel: viewModelContinuousResetAngleVertical,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetAngleVertical.refresh()
        return continuousResetAngleVerticalToolNode
    }
    
    static func getContinuousResetAngleDiag1ButtonToolNode(orientation: Orientation,
                                                           neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleDiag1Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleDiag1Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetAngleDiag1 = MagicalButtonViewModelContinuousResetAngleDiag1(orientation: orientation,
                                                                                                 buttonConfiguration: configuration)
        let continuousResetAngleDiag1ToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .buttonContinuousResetAngleDiag1,
                                                         flex: flex,
                                                         magicalViewModel: viewModelContinuousResetAngleDiag1,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetAngleDiag1.refresh()
        return continuousResetAngleDiag1ToolNode
    }
    
    static func getContinuousResetAngleDiag2ButtonToolNode(orientation: Orientation,
                                                           neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleDiag2Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetAngleDiag2Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetAngleDiag2 = MagicalButtonViewModelContinuousResetAngleDiag2(orientation: orientation,
                                                                                                 buttonConfiguration: configuration)
        let continuousResetAngleDiag2ToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .buttonContinuousResetAngleDiag2,
                                                         flex: flex,
                                                         magicalViewModel: viewModelContinuousResetAngleDiag2,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetAngleDiag2.refresh()
        return continuousResetAngleDiag2ToolNode
    }
    
    static func getContinuousResetEndRotationButtonToolNode(orientation: Orientation,
                                                            neighborTypeLeft: ToolInterfaceElementType?,
                                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetEndRotationLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetEndRotationLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetEndRotation = MagicalButtonViewModelContinuousResetEndRotation(orientation: orientation,
                                                                                                   buttonConfiguration: configuration)
        let continuousResetEndRotationToolNode = ToolNode(id: getToolNodeID(),
                                                          element: .buttonContinuousResetEndRotation,
                                                          flex: flex,
                                                          magicalViewModel: viewModelContinuousResetEndRotation,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetEndRotation.refresh()
        return continuousResetEndRotationToolNode
    }
    
    static func getContinuousResetEndScaleButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetEndScaleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetEndScaleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetEndScale = MagicalButtonViewModelContinuousResetEndScale(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let continuousResetEndScaleToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonContinuousResetEndScale,
                                                       flex: flex,
                                                       magicalViewModel: viewModelContinuousResetEndScale,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetEndScale.refresh()
        return continuousResetEndScaleToolNode
    }
    
    static func getContinuousResetStartRotationButtonToolNode(orientation: Orientation,
                                                              neighborTypeLeft: ToolInterfaceElementType?,
                                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetStartRotationLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetStartRotationLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetStartRotation = MagicalButtonViewModelContinuousResetStartRotation(orientation: orientation,
                                                                                                       buttonConfiguration: configuration)
        let continuousResetStartRotationToolNode = ToolNode(id: getToolNodeID(),
                                                            element: .buttonContinuousResetStartRotation,
                                                            flex: flex,
                                                            magicalViewModel: viewModelContinuousResetStartRotation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetStartRotation.refresh()
        return continuousResetStartRotationToolNode
    }
    
    static func getContinuousResetStartScaleButtonToolNode(orientation: Orientation,
                                                           neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetStartScaleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetStartScaleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetStartScale = MagicalButtonViewModelContinuousResetStartScale(orientation: orientation,
                                                                                                 buttonConfiguration: configuration)
        let continuousResetStartScaleToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .buttonContinuousResetStartScale,
                                                         flex: flex,
                                                         magicalViewModel: viewModelContinuousResetStartScale,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetStartScale.refresh()
        return continuousResetStartScaleToolNode
    }
    
    static func getContinuousResetSwoopButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetSwoopLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetSwoopLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetSwoop = MagicalButtonViewModelContinuousResetSwoop(orientation: orientation,
                                                                                       buttonConfiguration: configuration)
        let continuousResetSwoopToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .buttonContinuousResetSwoop,
                                                    flex: flex,
                                                    magicalViewModel: viewModelContinuousResetSwoop,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetSwoop.refresh()
        return continuousResetSwoopToolNode
    }
    
}
