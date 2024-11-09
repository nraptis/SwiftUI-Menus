//
//  ToolInterfaceFactory+Button+TimeLine.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getTimeLineAmplifyButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineAmplifyLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineAmplifyLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineAmplify = MagicalButtonViewModelTimeLineAmplify(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let timeLineAmplifyToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonTimeLineAmplify,
                                               flex: flex,
                                               magicalViewModel: viewModelTimeLineAmplify,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelTimeLineAmplify.refresh()
        return timeLineAmplifyToolNode
    }
    
    static func getTimeLineDampenButtonToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDampenLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDampenLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDampen = MagicalButtonViewModelTimeLineDampen(orientation: orientation,
                                                                           buttonConfiguration: configuration)
        let timeLineDampenToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonTimeLineDampen,
                                              flex: flex,
                                              magicalViewModel: viewModelTimeLineDampen,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDampen.refresh()
        return timeLineDampenToolNode
    }
    
    static func getTimeLineFlipAllButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipAllLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipAllLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineFlipAll = MagicalButtonViewModelTimeLineFlipAll(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let timeLineFlipAllToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonTimeLineFlipAll,
                                               flex: flex,
                                               magicalViewModel: viewModelTimeLineFlipAll,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelTimeLineFlipAll.refresh()
        return timeLineFlipAllToolNode
    }
    
    static func getTimeLineFlipCurrentChannelHorizontalButtonToolNode(orientation: Orientation,
                                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipCurrentChannelHorizontalLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipCurrentChannelHorizontalLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineFlipCurrentChannelHorizontal = MagicalButtonViewModelTimeLineFlipCurrentChannelHorizontal(orientation: orientation,
                                                                                                                       buttonConfiguration: configuration)
        let timeLineFlipCurrentChannelHorizontalToolNode = ToolNode(id: getToolNodeID(),
                                                                    element: .buttonTimeLineFlipCurrentChannelHorizontal,
                                                                    flex: flex,
                                                                    magicalViewModel: viewModelTimeLineFlipCurrentChannelHorizontal,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineFlipCurrentChannelHorizontal.refresh()
        return timeLineFlipCurrentChannelHorizontalToolNode
    }
    
    static func getTimeLineFlipCurrentChannelVerticalButtonToolNode(orientation: Orientation,
                                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipCurrentChannelVerticalLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipCurrentChannelVerticalLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineFlipCurrentChannelVertical = MagicalButtonViewModelTimeLineFlipCurrentChannelVertical(orientation: orientation,
                                                                                                                   buttonConfiguration: configuration)
        let timeLineFlipCurrentChannelVerticalToolNode = ToolNode(id: getToolNodeID(),
                                                                  element: .buttonTimeLineFlipCurrentChannelVertical,
                                                                  flex: flex,
                                                                  magicalViewModel: viewModelTimeLineFlipCurrentChannelVertical,
                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLineFlipCurrentChannelVertical.refresh()
        return timeLineFlipCurrentChannelVerticalToolNode
    }
    
    static func getTimeLineSyncFramesButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineSyncFramesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineSyncFramesLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineSyncFrames = MagicalButtonViewModelTimeLineSyncFrames(orientation: orientation,
                                                                                   buttonConfiguration: configuration)
        let timeLineSyncFramesToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .buttonTimeLineSyncFrames,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLineSyncFrames,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLineSyncFrames.refresh()
        return timeLineSyncFramesToolNode
    }
    
    static func getTimeLineInvertHorizontalButtonToolNode(orientation: Orientation,
                                                          neighborTypeLeft: ToolInterfaceElementType?,
                                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineInvertHLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineInvertHLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineInvertH = MagicalButtonViewModelTimeLineInvertH(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let timeLineInvertHToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonTimeLineInvertH,
                                               flex: flex,
                                               magicalViewModel: viewModelTimeLineInvertH,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelTimeLineInvertH.refresh()
        return timeLineInvertHToolNode
    }
    
    
    static func getTimeLineInvertVerticalButtonToolNode(orientation: Orientation,
                                                        neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineInvertVLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineInvertVLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineInvertV = MagicalButtonViewModelTimeLineInvertV(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let timeLineInvertVToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonTimeLineInvertV,
                                               flex: flex,
                                               magicalViewModel: viewModelTimeLineInvertV,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelTimeLineInvertV.refresh()
        return timeLineInvertVToolNode
    }
    
    static func getTimeLineResetCurveButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetCurveLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetCurveLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetCurve = MagicalButtonViewModelTimeLineResetCurve(orientation: orientation,
                                                                                   buttonConfiguration: configuration)
        let timeLineResetCurveToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .buttonTimeLineResetCurve,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLineResetCurve,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetCurve.refresh()
        return timeLineResetCurveToolNode
    }
    
    static func getTimeLineResetCurveSmallButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetCurveSmallLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetCurveSmallLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetCurveSmall = MagicalButtonViewModelTimeLineResetCurveSmall(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let timeLineResetCurveSmallToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonTimeLineResetCurveSmall,
                                                       flex: flex,
                                                       magicalViewModel: viewModelTimeLineResetCurveSmall,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetCurveSmall.refresh()
        return timeLineResetCurveSmallToolNode
    }
    
    static func getTimeLineResetDivotButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDivotLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDivotLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetDivot = MagicalButtonViewModelTimeLineResetDivot(orientation: orientation,
                                                                                   buttonConfiguration: configuration)
        let timeLineResetDivotToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .buttonTimeLineResetDivot,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLineResetDivot,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetDivot.refresh()
        return timeLineResetDivotToolNode
    }
    
    static func getTimeLineResetDivotSmallButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDivotSmallLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDivotSmallLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetDivotSmall = MagicalButtonViewModelTimeLineResetDivotSmall(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let timeLineResetDivotSmallToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonTimeLineResetDivotSmall,
                                                       flex: flex,
                                                       magicalViewModel: viewModelTimeLineResetDivotSmall,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetDivotSmall.refresh()
        return timeLineResetDivotSmallToolNode
    }
    
    static func getTimeLineResetFlatButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetFlatLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetFlatLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetFlat = MagicalButtonViewModelTimeLineResetFlat(orientation: orientation,
                                                                                 buttonConfiguration: configuration)
        let timeLineResetFlatToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonTimeLineResetFlat,
                                                 flex: flex,
                                                 magicalViewModel: viewModelTimeLineResetFlat,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetFlat.refresh()
        return timeLineResetFlatToolNode
    }
    
    static func getTimeLineResetSwanButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetSwanLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetSwanLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetSwan = MagicalButtonViewModelTimeLineResetSwan(orientation: orientation,
                                                                                 buttonConfiguration: configuration)
        let timeLineResetSwanToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonTimeLineResetSwan,
                                                 flex: flex,
                                                 magicalViewModel: viewModelTimeLineResetSwan,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetSwan.refresh()
        return timeLineResetSwanToolNode
    }
    
    static func getTimeLineShiftDownButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineShiftDownLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineShiftDownLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineShiftDown = MagicalButtonViewModelTimeLineShiftDown(orientation: orientation,
                                                                                 buttonConfiguration: configuration)
        let timeLineShiftDownToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonTimeLineShiftDown,
                                                 flex: flex,
                                                 magicalViewModel: viewModelTimeLineShiftDown,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelTimeLineShiftDown.refresh()
        return timeLineShiftDownToolNode
    }
    
    static func getTimeLineShiftUpButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineShiftUpLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineShiftUpLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineShiftUp = MagicalButtonViewModelTimeLineShiftUp(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let timeLineShiftUpToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonTimeLineShiftUp,
                                               flex: flex,
                                               magicalViewModel: viewModelTimeLineShiftUp,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelTimeLineShiftUp.refresh()
        return timeLineShiftUpToolNode
    }
    
    static func getTimeLineDupeAllButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeAllLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeAllLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDupeAll = MagicalButtonViewModelTimeLineDupeAll(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let timeLineDupeAllToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonTimeLineDupeAll,
                                               flex: flex,
                                               magicalViewModel: viewModelTimeLineDupeAll,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDupeAll.refresh()
        return timeLineDupeAllToolNode
    }
    
    
    static func getTimeLineDupeCurrentChannelButtonToolNode(orientation: Orientation,
                                                            neighborTypeLeft: ToolInterfaceElementType?,
                                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeCurrentChannelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeCurrentChannelLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDupeCurrentChannel = MagicalButtonViewModelTimeLineDupeCurrentChannel(orientation: orientation,
                                                                                                   buttonConfiguration: configuration)
        let timeLineDupeCurrentToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .buttonTimeLineDupeCurrentChannel,
                                                   flex: flex,
                                                   magicalViewModel: viewModelTimeLineDupeCurrentChannel,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDupeCurrentChannel.refresh()
        return timeLineDupeCurrentToolNode
    }
    
}
