//
//  GreenButtonIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

struct GreenButtonIconLibrary {
    
    static var removePoint: GreenButtonIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "text_button_remove_point_pad_0l",
                                         device: .pad, orientation: nil,
                                         width: 42, height: 42)
        
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "text_button_remove_point_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    width: 26, height: 26)
        
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "text_button_remove_point_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   width: 32, height: 32)
        
        return GreenButtonIconPack(slicePad0Lines: slicePad0Lines,
                                   slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                   slicePhonePortrait0Lines: slicePhonePortrait0Lines)
    }()
    
}
