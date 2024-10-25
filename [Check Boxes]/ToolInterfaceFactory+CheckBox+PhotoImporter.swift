//
//  ToolInterfaceFactory+CheckBox+PhotoImporter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getImageImportSnapEdgesCheckBoxNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.checkBoxTextSnapEdgesLine1()
        let textLine2 = ImageImportStringLibrary.checkBoxTextSnapEdgesLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getCheckBoxFlex(orientation: orientation,
                                                          configuration: configuration,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        let viewModelSnapEdgesEnabled = MagicalCheckBoxViewModelSnapEdgesEnabled(orientation: orientation,
                                                                                 checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxImageImporterEdgesEnabled,
                              flex: flex,
                              magicalViewModel: viewModelSnapEdgesEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelSnapEdgesEnabled.refresh()
        return result
    }
    
    
    static func getImageImportSnapRotationCheckBoxNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.checkBoxTextSnapRotationsLine1()
        let textLine2 = ImageImportStringLibrary.checkBoxTextSnapRotationsLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getCheckBoxFlex(orientation: orientation,
                                                          configuration: configuration,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        let viewModelSnapRotationEnabled = MagicalCheckBoxViewModelSnapRotationEnabled(orientation: orientation,
                                                                                       checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxImageImporterRotationEnabled,
                              flex: flex,
                              magicalViewModel: viewModelSnapRotationEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelSnapRotationEnabled.refresh()
        
        return result
    }
}
