//
//  MagicalStepperViewModel+TimelinePointCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation


@Observable class MagicalStepperViewModelTimelinePointCount: MagicalStepperViewModel {
    
    override func handleIncrement() {
        print("MagicalStepperViewModel => handleIncrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimelinePointCountIncrement()
            refresh()
        }
    }
    
    override func handleDecrement() {
        print("MagicalStepperViewModel => handleDecrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimelinePointCountDecrement()
            refresh()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                let selectedSwatch = selectedJiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
                
                refreshEnabled()
                
                if selectedSwatch.selectedChannelIndex > 0 {
                    refreshDecrementEnabled(true)
                } else {
                    refreshDecrementEnabled(false)
                }
                
                if selectedSwatch.selectedChannelIndex < (selectedSwatch.channelCount - 1) {
                    refreshIncrementEnabled(true)
                } else {
                    refreshIncrementEnabled(false)
                }
                
            } else {
                refreshDisabled()
                refreshDecrementEnabled(false)
                refreshIncrementEnabled(false)
            }
            valueString = jiggleViewModel.getTimelinePointCountString()
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelGuidesEnter (Dealloc)")
        }
    }
}
