//
//  ToolInterfaceFactory+Button+WeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/22/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getBreakTangentWeightGraphButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextBreakTangentWeightGraphLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextBreakTangentWeightGraphLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelBreakTangentWeightGraph = MagicalButtonViewModelBreakTangentWeightGraph(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let breakTangentWeightGraphToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonBreakTangentWeightGraph,
                                                       flex: flex,
                                                       magicalViewModel: viewModelBreakTangentWeightGraph,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelBreakTangentWeightGraph.refresh()
        return breakTangentWeightGraphToolNode
    }
    
    static func getResetWeightGraphStandardButtonToolNode(orientation: Orientation,
                                                          neighborTypeLeft: ToolInterfaceElementType?,
                                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphStandard = MagicalButtonViewModelResetWeightGraphStandard(orientation: orientation,
                                                                                               buttonConfiguration: configuration)
        let resetWeightGraphStandardToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .buttonResetWeightGraphStandard,
                                                        flex: flex,
                                                        magicalViewModel: viewModelResetWeightGraphStandard,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphStandard.refresh()
        return resetWeightGraphStandardToolNode
    }
    
    static func getResetWeightGraphStandardDampenedButtonToolNode(orientation: Orientation,
                                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphStandardDampened = MagicalButtonViewModelResetWeightGraphStandardDampened(orientation: orientation,
                                                                                                               buttonConfiguration: configuration)
        let resetWeightGraphStandardDampenedToolNode = ToolNode(id: getToolNodeID(),
                                                                element: .buttonResetWeightGraphStandardDampened,
                                                                flex: flex,
                                                                magicalViewModel: viewModelResetWeightGraphStandardDampened,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphStandardDampened.refresh()
        return resetWeightGraphStandardDampenedToolNode
    }
    
    static func getResetWeightGraphLinearButtonToolNode(orientation: Orientation,
                                                        neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphLinear = MagicalButtonViewModelResetWeightGraphLinear(orientation: orientation,
                                                                                           buttonConfiguration: configuration)
        let resetWeightGraphLinearToolNode = ToolNode(id: getToolNodeID(),
                                                      element: .buttonResetWeightGraphLinear,
                                                      flex: flex,
                                                      magicalViewModel: viewModelResetWeightGraphLinear,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphLinear.refresh()
        return resetWeightGraphLinearToolNode
    }
    
    static func getResetWeightGraphLinearDampenedButtonToolNode(orientation: Orientation,
                                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphLinearDampened = MagicalButtonViewModelResetWeightGraphLinearDampened(orientation: orientation,
                                                                                                           buttonConfiguration: configuration)
        let resetWeightGraphLinearDampenedToolNode = ToolNode(id: getToolNodeID(),
                                                              element: .buttonResetWeightGraphLinearDampened,
                                                              flex: flex,
                                                              magicalViewModel: viewModelResetWeightGraphLinearDampened,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphLinearDampened.refresh()
        return resetWeightGraphLinearDampenedToolNode
    }
    
    static func getResetWeightGraphInverseButtonToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphInverse = MagicalButtonViewModelResetWeightGraphInverse(orientation: orientation,
                                                                                             buttonConfiguration: configuration)
        let resetWeightGraphInverseToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonResetWeightGraphInverse,
                                                       flex: flex,
                                                       magicalViewModel: viewModelResetWeightGraphInverse,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphInverse.refresh()
        return resetWeightGraphInverseToolNode
    }
    
    static func getResetWeightGraphInverseDampenedButtonToolNode(orientation: Orientation,
                                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphInverseDampened = MagicalButtonViewModelResetWeightGraphInverseDampened(orientation: orientation,
                                                                                                             buttonConfiguration: configuration)
        let resetWeightGraphInverseDampenedToolNode = ToolNode(id: getToolNodeID(),
                                                               element: .buttonResetWeightGraphInverseDampened,
                                                               flex: flex,
                                                               magicalViewModel: viewModelResetWeightGraphInverseDampened,
                                                               neighborTypeLeft: neighborTypeLeft,
                                                               neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphInverseDampened.refresh()
        return resetWeightGraphInverseDampenedToolNode
    }
}
