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
    
    static func getContinuousInvertAnglesButtonToolNode(orientation: Orientation,
                                                        neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousInvertAnglesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousInvertAnglesLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousInvertAngles = MagicalButtonViewModelContinuousInvertAngles(orientation: orientation,
                                                                                           buttonConfiguration: configuration)
        let continuousInvertAnglesToolNode = ToolNode(id: getToolNodeID(),
                                                      element: .buttonContinuousInvertAngles,
                                                      flex: flex,
                                                      magicalViewModel: viewModelContinuousInvertAngles,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        viewModelContinuousInvertAngles.refresh()
        return continuousInvertAnglesToolNode
    }
    
    static func getContinuousInvertRotationButtonToolNode(orientation: Orientation,
                                                          neighborTypeLeft: ToolInterfaceElementType?,
                                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousInvertRotationLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousInvertRotationLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousInvertRotation = MagicalButtonViewModelContinuousInvertRotation(orientation: orientation,
                                                                                               buttonConfiguration: configuration)
        let continuousInvertRotationToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .buttonContinuousInvertRotation,
                                                        flex: flex,
                                                        magicalViewModel: viewModelContinuousInvertRotation,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelContinuousInvertRotation.refresh()
        return continuousInvertRotationToolNode
    }
    
    static func getContinuousInvertSwoopButtonToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousInvertSwoopLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousInvertSwoopLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousInvertSwoop = MagicalButtonViewModelContinuousInvertSwoop(orientation: orientation,
                                                                                         buttonConfiguration: configuration)
        let continuousInvertSwoopToolNode = ToolNode(id: getToolNodeID(),
                                                     element: .buttonContinuousInvertSwoop,
                                                     flex: flex,
                                                     magicalViewModel: viewModelContinuousInvertSwoop,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        viewModelContinuousInvertSwoop.refresh()
        return continuousInvertSwoopToolNode
    }
    
    static func getContinuousResetFrameOffsetButtonToolNode(orientation: Orientation,
                                                            neighborTypeLeft: ToolInterfaceElementType?,
                                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetFrameOffsetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetFrameOffsetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetFrameOffset = MagicalButtonViewModelContinuousResetFrameOffset(orientation: orientation,
                                                                                                   buttonConfiguration: configuration)
        let continuousResetFrameOffsetToolNode = ToolNode(id: getToolNodeID(),
                                                          element: .buttonContinuousResetFrameOffset,
                                                          flex: flex,
                                                          magicalViewModel: viewModelContinuousResetFrameOffset,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetFrameOffset.refresh()
        return continuousResetFrameOffsetToolNode
    }
    
    static func getContinuousShuffleGroup1ButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousShuffleGroup1Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousShuffleGroup1Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousShuffleGroup1 = MagicalButtonViewModelContinuousShuffleGroup1(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let continuousShuffleGroup1ToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonContinuousShuffleGroup1,
                                                       flex: flex,
                                                       magicalViewModel: viewModelContinuousShuffleGroup1,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelContinuousShuffleGroup1.refresh()
        return continuousShuffleGroup1ToolNode
    }
    
    static func getContinuousShuffleGroup2ButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousShuffleGroup2Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousShuffleGroup2Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousShuffleGroup2 = MagicalButtonViewModelContinuousShuffleGroup2(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let continuousShuffleGroup2ToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonContinuousShuffleGroup2,
                                                       flex: flex,
                                                       magicalViewModel: viewModelContinuousShuffleGroup2,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelContinuousShuffleGroup2.refresh()
        return continuousShuffleGroup2ToolNode
    }
    
    static func getContinuousShuffleGroup3ButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousShuffleGroup3Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousShuffleGroup3Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousShuffleGroup3 = MagicalButtonViewModelContinuousShuffleGroup3(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let continuousShuffleGroup3ToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonContinuousShuffleGroup3,
                                                       flex: flex,
                                                       magicalViewModel: viewModelContinuousShuffleGroup3,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelContinuousShuffleGroup3.refresh()
        return continuousShuffleGroup3ToolNode
    }
    
    static func getContinuousResetGroup1ButtonToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetGroup1Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetGroup1Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetGroup1 = MagicalButtonViewModelContinuousResetGroup1(orientation: orientation,
                                                                                         buttonConfiguration: configuration)
        let continuousResetGroup1ToolNode = ToolNode(id: getToolNodeID(),
                                                     element: .buttonContinuousResetGroup1,
                                                     flex: flex,
                                                     magicalViewModel: viewModelContinuousResetGroup1,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetGroup1.refresh()
        return continuousResetGroup1ToolNode
    }
    
    static func getContinuousResetGroup2ButtonToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetGroup2Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetGroup2Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetGroup2 = MagicalButtonViewModelContinuousResetGroup2(orientation: orientation,
                                                                                         buttonConfiguration: configuration)
        let continuousResetGroup2ToolNode = ToolNode(id: getToolNodeID(),
                                                     element: .buttonContinuousResetGroup2,
                                                     flex: flex,
                                                     magicalViewModel: viewModelContinuousResetGroup2,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetGroup2.refresh()
        return continuousResetGroup2ToolNode
    }
    
    static func getContinuousResetGroup3ButtonToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetGroup3Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousResetGroup3Line2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousResetGroup3 = MagicalButtonViewModelContinuousResetGroup3(orientation: orientation,
                                                                                         buttonConfiguration: configuration)
        let continuousResetGroup3ToolNode = ToolNode(id: getToolNodeID(),
                                                     element: .buttonContinuousResetGroup3,
                                                     flex: flex,
                                                     magicalViewModel: viewModelContinuousResetGroup3,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        viewModelContinuousResetGroup3.refresh()
        return continuousResetGroup3ToolNode
    }
    
    static func getContinuousSwapRotationButtonToolNode(orientation: Orientation,
                                                        neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextContinuousSwapRotationLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextContinuousSwapRotationLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousSwapRotation = MagicalButtonViewModelContinuousSwapRotation(orientation: orientation,
                                                                                           buttonConfiguration: configuration)
        let continuousSwapRotationToolNode = ToolNode(id: getToolNodeID(),
                                                      element: .buttonContinuousSwapRotation,
                                                      flex: flex,
                                                      magicalViewModel: viewModelContinuousSwapRotation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        viewModelContinuousSwapRotation.refresh()
        return continuousSwapRotationToolNode
    }
    
}
