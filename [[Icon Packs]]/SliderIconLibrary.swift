//
//  SliderIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

struct SliderIconLibrary {
    
    static var boxus: SliderIconPack = {
        let slicePad = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                   device: .pad,
                                   orientation: .portrait,
                                   width: 42,
                                   height: 42)
        let slicePhoneLandscape = AnyTextIcon(fileName: "interface_text_button_box_ls_0l",
                                              device: .pad,
                                              orientation: .portrait,
                                              width: 34, 
                                              height: 26)
        let slicePhonePortrait = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                             device: .pad,
                                             orientation: .portrait,
                                             width: 32, 
                                             height: 32)
        return SliderIconPack(slicePad: slicePad,
                              slicePhoneLandscape: slicePhoneLandscape,
                              slicePhonePortrait: slicePhonePortrait)
    }()
}
