//
//  ImageImportViewModel+ImageImportBack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getImageImportBackSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = GeneralStringLibrary.generalTextBackLine1()
        let textLine2 = GeneralStringLibrary.generalTextBackLine1()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack, orientation: Self.orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getSexyButtonFlex(orientation: Self.orientation,
                                                                configuration: configuration,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        
        let viewModelImageImportBack = MagicalSexyButtonViewModelImageImportBack(orientation: Self.orientation,
                                                                                 sexyButtonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .sexyButtonImageImporterButtonBack,
                                                   flex: flex,
                                                   magicalViewModel: viewModelImageImportBack,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelImageImportBack.refresh()
        return generateGuidesToolNode
    }
}
