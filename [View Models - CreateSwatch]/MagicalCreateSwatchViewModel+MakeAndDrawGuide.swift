//
//  MagicalCreateSwatchViewModel+MakeAndDrawGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

@Observable class MagicalCreateSwatchViewModelMakeAndDrawGuide: MagicalCreateSwatchViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .makeGuide:
                setActiveButton(0)
                refreshEnabledAllButtons()
            case .drawGuide:
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
                jiggleViewModel.setCreatorMode(.makeGuide)
            }
            if index == 1 {
                jiggleViewModel.setCreatorMode(.drawGuide)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModelMakeAndDrawGuide - Dealloc")
        }
    }
}
