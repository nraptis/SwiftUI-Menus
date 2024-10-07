//
//  ToolInterfaceViewModel+SexyRecordAudioEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRecordAudioEnabledSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextRecordAudioEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextRecordAudioEnabledLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelRecordAudioEnabled = MagicalSexyCheckBoxViewModelRecordAudioEnabled(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let recordAudioEnabledToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBoxRecordAudioEnabled,
                                             flex: flex,
                                             magicalViewModel: viewModelRecordAudioEnabled,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelRecordAudioEnabled.refresh()
        return recordAudioEnabledToolNode
    }
}
