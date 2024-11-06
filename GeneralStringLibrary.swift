//
//  GeneralStringLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/26/24.
//

import Foundation
struct GeneralStringLibrary {
    
    static func get(localized: String, table: String) -> String? {
        
        let string = stringOrNull(String(localized: String.LocalizationValue.init(localized), table: table))
        
        if ApplicationController.FORCE_2_LINE_ALL {
            if let string = string {
                if isLine1(localized) {
                    if string.trimmingCharacters(in: .whitespacesAndNewlines).count <= 0 {
                        if ApplicationController.FORCE_CAPS {
                            return "Line 1".uppercased()
                        } else {
                            return "Line 1"
                        }
                        
                    }
                }
            } else {
                if ApplicationController.FORCE_CAPS {
                    return "Line 1".uppercased()
                } else {
                    return "Line 1"
                }
            }
            if let string = string {
                if isLine2(localized) {
                    if string.trimmingCharacters(in: .whitespacesAndNewlines).count <= 0 {
                        if ApplicationController.FORCE_CAPS {
                            return "Line 2".uppercased()
                        } else {
                            return "Line 2"
                        }
                    }
                }
            } else {
                if ApplicationController.FORCE_CAPS {
                    return "Line 2".uppercased()
                } else {
                    return "Line 2"
                }
            }
        } else if ApplicationController.FORCE_1_LINE_ALL {
            if let string = string {
                if isLine1(localized) {
                    if string.trimmingCharacters(in: .whitespacesAndNewlines).count <= 0 {
                        if ApplicationController.FORCE_CAPS {
                            return "Line 1".uppercased()
                        } else {
                            return "Line 1"
                        }
                    }
                    if ApplicationController.FORCE_CAPS {
                        return string.uppercased()
                    } else {
                        return string
                    }
                }
            }
            if isLine2(localized) {
                return nil
            }
        }
        if ApplicationController.FORCE_CAPS {
            return string?.uppercased()
        } else {
            return string
        }
    }
    
    private static func isLine1(_ string: String?) -> Bool {
        if let string = string {
            if string.lowercased().contains("line_1") || string.lowercased().contains("line1") || string.lowercased().contains("l1") {
                return true
            }
        }
        return false
    }
    
    private static func isLine2(_ string: String?) -> Bool {
        if let string = string {
            if string.lowercased().contains("line_2") || string.lowercased().contains("line2") || string.lowercased().contains("l2") {
                return true
            }
        }
        return false
    }
    
    static func stringOrNull(_ string: String?) -> String? {
        
        if let string = string?.trimmingCharacters(in: .whitespacesAndNewlines) {
            if string.count <= 0 {
                return nil
            }
            if string == "NULL" {
                return nil
            }
            return string
        }
        return nil
    }
    
    static func stringOrDefault(_ string: String?, `default`: String) -> String {
        if let string = string?.trimmingCharacters(in: .whitespacesAndNewlines) {
            if string.count <= 0 {
                return `default`
            }
            if string == "NULL" {
                return `default`
            }
            return `default`
        }
        return `default`
    }
    
    static func cropToFrame() -> String? {
        stringOrNull(String(localized: "crop_to_frame", table: "General"))
    }
    
    static func generalTextBackLine1() -> String? {
        stringOrNull(String(localized: "back_line_1", table: "General"))
    }
    
    static func generalTextBackLine2() -> String? {
        stringOrNull(String(localized: "back_line_2", table: "General"))
    }
    
    
    static func generalTextOkay() -> String {
        stringOrDefault(String(localized: "okay", table: "General"),
                        default: "Okay")
    }
    
    static func generalTextCancel() -> String {
        stringOrDefault(String(localized: "cancel", table: "General"),
                        default: "Cancel")
    }
    
    static func generalTextDone() -> String {
        stringOrDefault(String(localized: "done", table: "General"),
                        default: "Done")
    }
    
    static func generalTextReset() -> String {
        stringOrDefault(String(localized: "reset", table: "General"),
                        default: "Reset")
    }
    
    static func generalTextGenerate() -> String {
        stringOrDefault(String(localized: "generate", table: "General"),
                        default: "Generate")
    }
    
    static func generalTextError() -> String {
        stringOrDefault(String(localized: "error", table: "General"),
                        default: "Error")
    }
    
    static func generalTextWarning() -> String {
        stringOrDefault(String(localized: "warning", table: "General"),
                        default: "Warning")
    }
    
    static func generalCouldNotCopyFileLowMemory() -> String {
        stringOrDefault(String(localized: "could_not_copy_file_low_memory", table: "General"),
                        default: "A file could not be copied, please check your device's memory.")
    }
    
    static func generalTextEditGuides() -> String {
        stringOrDefault(String(localized: "edit_guides", table: "General"),
                        default: "Edit Guides")
    }
    
    static func generalTextGeneratingGuides() -> String {
        stringOrDefault(String(localized: "generating_guides", table: "General"),
                        default: "Generating guides, please wait...")
    }
    
    static func generalTextAnUnknownErrorHasOccurred() -> String {
        stringOrDefault(String(localized: "an_unknown_error_has_occurred", table: "General"),
                        default: "An unknown error has occurred...")
    }
    
    static func generalTextCouldNotLoadImage() -> String {
        stringOrDefault(String(localized: "could_not_load_image", table: "General"),
                        default: "Sorry, we could not not load the image...")
    }
    
    static func generalTextCouldNotLoadDocument() -> String {
        stringOrDefault(String(localized: "could_not_load_document", table: "General"),
                        default: "Sorry, we could not not load the document...")
    }
    
    static func generalTextNoJiggleSelected() -> String {
        stringOrDefault(String(localized: "no_jiggle_selected", table: "General"),
                        default: "No Jiggle Selected")
    }
    
    static func generalTextYouMustSelectAJiggleToPerformThisAction() -> String {
        stringOrDefault(String(localized: "you_must_select_a_jiggle_to_perform_this_action", table: "General"),
                        default: "You must select a Jiggle to perform this action...")
    }
    
    static func generalTextNumberOfGuides() -> String {
        stringOrDefault(String(localized: "number_of_guides", table: "General"),
                        default: "Number of guides to create:")
    }
    
    
    static func generalTextPartialSuccess() -> String {
        stringOrDefault(String(localized: "partial_success", table: "General"),
                        default: "Partial Success")
    }
    
    static func generalTextCouldOnlyGenerateMessage(numberOfRingsGenerated: Int,
                                                    numberOfRingsRequested: Int) -> String {
        if let formatted = stringOrNull(String(localized: "could_only_generate_message",
                                               table: "General")) {
            return String(format: formatted, numberOfRingsGenerated, numberOfRingsRequested)
        } else {
            
            var result = "We could only generate "
            result += String(numberOfRingsGenerated)
            result += " of "
            result += String(numberOfRingsRequested)
            result += " guides, please check your size."
            return result
        }
    }
    static func generalTextCouldNotGenerate() -> String {
        stringOrDefault(String(localized: "could_not_generate", table: "General"),
                        default: "We could not generate any guides, please check your size and try again.")
    }
    
    static func generalMaxJiggleCountTitle() -> String? {
        stringOrNull(String(localized: "jiggle_count_overflow_title", table: "General"))
    }
    
    
    
    static func generalMaxJiggleCountMessage(maxJiggleCount: Int) -> String? {
        if let formatted = stringOrNull(String(localized: "jiggle_count_overflow_message", table: "General")) {
            return String(format: formatted, maxJiggleCount)
        }
        return nil
    }
    
}
