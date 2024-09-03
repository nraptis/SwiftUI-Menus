//
//  ToolInterfaceStringLibraryMainTabs.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

struct ToolInterfaceStringLibraryMainTabs {
    
    static func buttonTextViewLine1() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "view_line_1", table: "ToolInterfaceMainTab"))
    }
    
    static func buttonTextViewLine2() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "view_line_2", table: "ToolInterfaceMainTab"))
    }
    
    static func buttonTextEditLine1() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "edit_line_1", table: "ToolInterfaceMainTab"))
    }
    
    static func buttonTextEditLine2() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "edit_line_2", table: "ToolInterfaceMainTab"))
    }
    
    static func buttonTextGuidesLine1() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "guides_line_1", table: "ToolInterfaceMainTab"))
    }
    
    static func buttonTextGuidesLine2() -> String? {
        GeneralStringLibrary.stringOrNull(String(localized: "guides_line_2", table: "ToolInterfaceMainTab"))
    }
    
}
