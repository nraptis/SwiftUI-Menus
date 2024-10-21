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
    
    static func getTimeLineBreakPointButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineBreakPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineBreakPointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineBreakPoint = MagicalButtonViewModelTimeLineBreakPoint(orientation: orientation,
                                                                                   buttonConfiguration: configuration)
        let timeLineBreakPointToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .buttonTimeLineBreakPoint,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLineBreakPoint,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLineBreakPoint.refresh()
        return timeLineBreakPointToolNode
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
    
    static func getTimeLineResetCurveCurrentChannelButtonToolNode(orientation: Orientation,
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
    
    static func getTimeLineDupeDurationButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeDurationLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeDurationLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDupeDuration = MagicalButtonViewModelTimeLineDupeDuration(orientation: orientation,
                                                                                       buttonConfiguration: configuration)
        let timeLineDupeDurationToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .buttonTimeLineDupeDuration,
                                                    flex: flex,
                                                    magicalViewModel: viewModelTimeLineDupeDuration,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDupeDuration.refresh()
        return timeLineDupeDurationToolNode
    }
    
    
    static func getTimeLineResetFlatCurrentChannelButtonToolNode(orientation: Orientation,
                                                               neighborTypeLeft: ToolInterfaceElementType?,
                                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetFlatCurrentChannelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetFlatCurrentChannelLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetFlatCurrentChannel = MagicalButtonViewModelTimeLineResetFlatCurrentChannel(orientation: orientation,
                                                                                                         buttonConfiguration: configuration)
        let timeLineResetFlatCurrentChannelToolNode = ToolNode(id: getToolNodeID(),
                                                             element: .buttonTimeLineResetFlatCurrentChannel,
                                                             flex: flex,
                                                             magicalViewModel: viewModelTimeLineResetFlatCurrentChannel,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetFlatCurrentChannel.refresh()
        return timeLineResetFlatCurrentChannelToolNode
    }
    
    static func getTimeLineResetDefaultCurrentChannelButtonToolNode(orientation: Orientation,
                                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDefaultCurrentChannelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDefaultCurrentChannelLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetDefaultCurrentChannel = MagicalButtonViewModelTimeLineResetDefaultCurrentChannel(orientation: orientation,
                                                                                                                   buttonConfiguration: configuration)
        let timeLineResetDefaultCurrentChannelToolNode = ToolNode(id: getToolNodeID(),
                                                                  element: .buttonTimeLineResetDefaultCurrentChannel,
                                                                  flex: flex,
                                                                  magicalViewModel: viewModelTimeLineResetDefaultCurrentChannel,
                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetDefaultCurrentChannel.refresh()
        return timeLineResetDefaultCurrentChannelToolNode
    }
    
}
