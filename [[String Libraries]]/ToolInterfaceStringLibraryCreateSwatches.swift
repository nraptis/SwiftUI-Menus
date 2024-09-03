//
//  ToolInterfaceStringLibraryCreateSwatches.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

struct ToolInterfaceStringLibraryCreateSwatches {
    
    static func swatchTextMakeJiggleLine1() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "make_jiggle_line_1", table: "ToolInterfaceCreateSwatch"))
    }
    
    static func swatchTextMakeJiggleLine2() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "make_jiggle_line_2", table: "ToolInterfaceCreateSwatch"))
    }
    
    static func swatchTextDrawJiggleLine1() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "draw_jiggle_line_1", table: "ToolInterfaceCreateSwatch"))
    }
    
    static func swatchTextDrawJiggleLine2() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "draw_jiggle_line_2", table: "ToolInterfaceCreateSwatch"))
    }
    
}
