//
//  ImageImportViewModel+SnapEdgesEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getSnapEdgesEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.checkBoxTextSnapEdgesLine1()
        let textLine2 = ImageImportStringLibrary.checkBoxTextSnapEdgesLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: Self.orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyCheckBoxFlex(orientation: Self.orientation,
                                                          configuration: configuration,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        let viewModelSnapEdgesEnabled = MagicalCheckBoxViewModelSnapEdgesEnabled(orientation: Self.orientation,
                                                                                 sexyCheckBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .sexyCheckBoxImageImporterEdgesEnabled,
                              flex: flex,
                              magicalViewModel: viewModelSnapEdgesEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelSnapEdgesEnabled.refresh()
        return result
    }
}
