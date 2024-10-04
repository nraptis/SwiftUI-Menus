//
//  MagicalSexyStepperViewModel+TimelinePointCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation


@Observable class MagicalSexyStepperViewModelTimelinePointCount: MagicalSexyStepperViewModel {
    
    override func handleIncrement() {
        print("MagicalSexyStepperViewModel => handleIncrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimelinePointCountIncrement()
            Task { @MainActor in
                refresh()
            }
        }
    }
    
    override func handleDecrement() {
        print("MagicalSexyStepperViewModel => handleDecrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimelinePointCountDecrement()
            Task { @MainActor in
                refresh()
            }
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                let selectedSwatch = selectedJiggle.timeLine.selectedSwatch
                
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
            print("[Deinit] MagicalEnterModeViewModelGuidesEnter (Dealloc)")
        }
    }
}
