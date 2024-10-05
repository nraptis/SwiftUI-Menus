//
//  ToolInterfaceViewModel+TimeLineBreakPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/22/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineBreakPointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineBreakPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineBreakPointLine2()
       let iconPack = LooseConvertibleIconLibrary.menuA
        
       
       
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineBreakPoint = MagicalSexyButtonViewModelTimeLineBreakPoint(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineBreakPoint,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineBreakPoint,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineBreakPoint.refresh()
        return rotateJiggleLeftToolNode
    }
    
}




