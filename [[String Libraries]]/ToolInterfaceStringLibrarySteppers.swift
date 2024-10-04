//
//  ToolInterfaceStringLibrarySteppers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation

struct ToolInterfaceStringLibrarySteppers {
    
    static func swatchTextTimelinePointCountLine1() -> String? {
        GeneralStringLibrary.get(localized: "timeline_point_count_line_1", table: "ToolInterfaceSteppers")
    }
    
    static func swatchTextTimelinePointCountLine2() -> String? {
        GeneralStringLibrary.get(localized: "timeline_point_count_line_2", table: "ToolInterfaceSteppers")
    }
    
}
