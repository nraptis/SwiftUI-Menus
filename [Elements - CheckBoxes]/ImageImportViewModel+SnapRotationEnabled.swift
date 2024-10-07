//
//  ImageImportViewModel+SnapRotationEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getSnapRotationEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.checkBoxTextSnapRotationsLine1()
        let textLine2 = ImageImportStringLibrary.checkBoxTextSnapRotationsLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: Self.orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyCheckBoxFlex(orientation: Self.orientation,
                                                          configuration: configuration,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        let viewModelSnapRotationEnabled = MagicalCheckBoxViewModelSnapRotationEnabled(orientation: Self.orientation,
                                                                                       sexyCheckBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .sexyCheckBoxImageImporterRotationEnabled,
                              flex: flex,
                              magicalViewModel: viewModelSnapRotationEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelSnapRotationEnabled.refresh()
        
        return result
    }
}
