//
//  MagicalSexyButtonViewModel+TimeLineDupeAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineDupeAllSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeAllLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeAllLine2()
       let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDupeAll = MagicalSexyButtonViewModelTimeLineDupeAll(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineDupeAll,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineDupeAll,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDupeAll.refresh()
        return rotateJiggleLeftToolNode
    }
    
}




