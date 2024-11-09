//
//  ToolInterfaceLayoutRelay.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation
import Observation
import Combine

@Observable class ToolInterfaceLayoutRelay {
    
    @ObservationIgnored var orientation = Orientation.portrait
    
    @MainActor init() {
        
    }
    
    @MainActor var menuWidthWithSafeArea = 320
    @MainActor var rowHeight = 44
    @MainActor var safeAreaLeft: Int = 0
    @MainActor var safeAreaRight: Int = 0
    @MainActor var safeAreaTop: Int = 0
    @MainActor var safeAreaBottom: Int = 0
}
