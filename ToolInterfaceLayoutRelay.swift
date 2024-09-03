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
    
    var menuWidthWithSafeArea = 320
    var rowHeight = 44
    var safeAreaLeft: Int = 0
    var safeAreaRight: Int = 0
    var safeAreaTop: Int = 0
    var safeAreaBottom: Int = 0
}
