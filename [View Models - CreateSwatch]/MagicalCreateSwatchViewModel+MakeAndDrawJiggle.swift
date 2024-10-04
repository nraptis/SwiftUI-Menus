//
//  MagicalCreateSwatchViewModel+MakeAndDrawJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

@Observable class MagicalCreateSwatchViewModelMakeAndDrawJiggle: MagicalCreateSwatchViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            //TODO: Temp
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                //refreshEnabled()
            } else {
                //refreshDisabled()
            }
            
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .makeJiggle:
                setActiveButton(0)
                refreshEnabledAllButtons()
            case .drawJiggle:
                setActiveButton(1)
                refreshEnabledAllButtons()
            case .none:
                activeButtonViewModel = nil
                refreshEnabledAllButtons()
            default:
                activeButtonViewModel = nil
                refreshDisabledAllButtons()
            }
        }
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if index == 0 {
                jiggleViewModel.setCreatorMode(.makeJiggle)
            }
            if index == 1 {
                jiggleViewModel.setCreatorMode(.drawJiggle)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModelMakeAndDrawJiggle - Dealloc")
        }
    }
}
