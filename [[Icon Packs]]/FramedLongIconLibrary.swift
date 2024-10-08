//
//  FramedLongIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

struct FramedLongIconLibrary {
    
    static var testArrowLeft: FramedLongIconPack {
        Self.build(prefix: "framed",
                   name: "test_arrow_left",
                   widthPad_0: 36, heightPad_0: 42,
                   widthPhoneLandscape_0: 24, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 28, heightPhonePortrait_0: 32)
    }


    static var testArrowRight: FramedLongIconPack {
        Self.build(prefix: "framed",
                   name: "test_arrow_right",
                   widthPad_0: 36, heightPad_0: 42,
                   widthPhoneLandscape_0: 24, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 28, heightPhonePortrait_0: 32)
    }
    
    static var checkBoxSquare: FramedLongIconPack {
        Self.build(prefix: "framed",
                   name: "check_box_square",
                   widthPad_0: 43, heightPad_0: 42,
                   widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 33, heightPhonePortrait_0: 32)
    }
    
    static var checkBoxCheck: FramedLongIconPack {
        Self.build(prefix: "framed",
                   name: "check_box_check",
                   widthPad_0: 43, heightPad_0: 42,
                   widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 33, heightPhonePortrait_0: 32)
    }
                   
    static var menuA: FramedLongIconPack {
        Self.build(prefix: "framed",
                   name: "menu_a",
                   widthPad_0: 43, heightPad_0: 42,
                   widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 33, heightPhonePortrait_0: 32)
    }
    
    
    static var menuB: FramedLongIconPack {
        Self.build(prefix: "loose",
                   name: "menu_b",
                   widthPad_0: 43, heightPad_0: 42,
                   widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 33, heightPhonePortrait_0: 32)
    }
    
    
    static var menuC: FramedLongIconPack {
        Self.build(prefix: "loose",
                   name: "menu_c",
                   widthPad_0: 43, heightPad_0: 42,
                   widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                   widthPhonePortrait_0: 33, heightPhonePortrait_0: 32)
    }
    
    private static func build(prefix: String,
                              name: String,
                              
                              widthPad_0: Int, heightPad_0: Int,
                              widthPhoneLandscape_0: Int, heightPhoneLandscape_0: Int,
                              widthPhonePortrait_0: Int, heightPhonePortrait_0: Int) -> FramedLongIconPack {
        
        let planePad_0 = IconPlane(numberOfLines: 0, device: .pad, orientation: .portrait, prefix: prefix, name: name,
                                   width: widthPad_0, height: heightPad_0)
        
        let planePhoneLandscape_0 = IconPlane(numberOfLines: 0, device: .phone, orientation: .landscape, prefix: prefix, name: name,
                                              width: widthPhoneLandscape_0, height: heightPhoneLandscape_0)
        
        let planePhonePortrait_0 = IconPlane(numberOfLines: 0, device: .phone, orientation: .portrait, prefix: prefix, name: name,
                                             width: widthPhonePortrait_0, height: heightPhonePortrait_0)
        
        return FramedLongIconPack(planePad_0: planePad_0,
                                  planePhoneLandscape_0: planePhoneLandscape_0,
                                  planePhonePortrait_0: planePhonePortrait_0)
        
    }
    
}
