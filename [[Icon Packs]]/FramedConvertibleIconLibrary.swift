//
//  SexyLongIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

struct FramedConvertibleIconLibrary {
    
    static var testArrowLeft: FramedConvertibleIconPack {
        Self.build(prefix: "framed",
                  name: "test_arrow_left",
                  widthPad_0: 36, heightPad_0: 42,
                  widthPhoneLandscape_0: 24, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 28, heightPhonePortrait_0: 32,
                  widthPad_1: 31, heightPad_1: 35,
                  widthPhoneLandscape_1: 21, heightPhoneLandscape_1: 24,
                  widthPhonePortrait_1: 26, heightPhonePortrait_1: 30,
                  widthPad_2: 20, heightPad_2: 23,
                  widthPhoneLandscape_2: 14, heightPhoneLandscape_2: 16,
                  widthPhonePortrait_2: 18, heightPhonePortrait_2: 20)
    }


    static var testArrowRight: FramedConvertibleIconPack {
        Self.build(prefix: "framed",
                  name: "test_arrow_right",
                  widthPad_0: 36, heightPad_0: 42,
                  widthPhoneLandscape_0: 24, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 28, heightPhonePortrait_0: 32,
                  widthPad_1: 31, heightPad_1: 35,
                  widthPhoneLandscape_1: 21, heightPhoneLandscape_1: 24,
                  widthPhonePortrait_1: 26, heightPhonePortrait_1: 30,
                  widthPad_2: 20, heightPad_2: 23,
                  widthPhoneLandscape_2: 14, heightPhoneLandscape_2: 16,
                  widthPhonePortrait_2: 18, heightPhonePortrait_2: 20)
    }
    
    static var menuA: FramedConvertibleIconPack {
        Self.build(prefix: "framed",
                  name: "menu_a",
                  widthPad_0: 43, heightPad_0: 42,
                  widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 33, heightPhonePortrait_0: 32,
                  widthPad_1: 36, heightPad_1: 35,
                  widthPhoneLandscape_1: 25, heightPhoneLandscape_1: 24,
                  widthPhonePortrait_1: 31, heightPhonePortrait_1: 30,
                  widthPad_2: 24, heightPad_2: 23,
                  widthPhoneLandscape_2: 17, heightPhoneLandscape_2: 16,
                  widthPhonePortrait_2: 21, heightPhonePortrait_2: 20)
    }


    static var menuB: FramedConvertibleIconPack {
        Self.build(prefix: "framed",
                  name: "menu_b",
                  widthPad_0: 43, heightPad_0: 42,
                  widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 33, heightPhonePortrait_0: 32,
                  widthPad_1: 36, heightPad_1: 35,
                  widthPhoneLandscape_1: 25, heightPhoneLandscape_1: 24,
                  widthPhonePortrait_1: 31, heightPhonePortrait_1: 30,
                  widthPad_2: 24, heightPad_2: 23,
                  widthPhoneLandscape_2: 17, heightPhoneLandscape_2: 16,
                  widthPhonePortrait_2: 21, heightPhonePortrait_2: 20)
    }


    static var menuC: FramedConvertibleIconPack {
        Self.build(prefix: "framed",
                  name: "menu_c",
                  widthPad_0: 43, heightPad_0: 42,
                  widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 33, heightPhonePortrait_0: 32,
                  widthPad_1: 36, heightPad_1: 35,
                  widthPhoneLandscape_1: 25, heightPhoneLandscape_1: 24,
                  widthPhonePortrait_1: 31, heightPhonePortrait_1: 30,
                  widthPad_2: 24, heightPad_2: 23,
                  widthPhoneLandscape_2: 17, heightPhoneLandscape_2: 16,
                  widthPhonePortrait_2: 21, heightPhonePortrait_2: 20)
    }
    
    static var jiggles: FramedConvertibleIconPack {
        Self.build(prefix: "sexy_check",
                  name: "jiggles",
                  widthPad_0: 45, heightPad_0: 42,
                  widthPhoneLandscape_0: 29, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 34, heightPhonePortrait_0: 32,
                  widthPad_1: 36, heightPad_1: 33,
                  widthPhoneLandscape_1: 24, heightPhoneLandscape_1: 22,
                  widthPhonePortrait_1: 30, heightPhonePortrait_1: 28,
                  widthPad_2: 22, heightPad_2: 20,
                  widthPhoneLandscape_2: 15, heightPhoneLandscape_2: 14,
                  widthPhonePortrait_2: 20, heightPhonePortrait_2: 18)
    }
    
    static var delete: FramedConvertibleIconPack {
        
        let widthPad_0 = 31; let heightPad_0 = 41
        let widthPhonePortrait_0 = 24; let heightPhonePortrait_0 = 31
        let widthPhoneLandscape_0 = 20; let heightPhoneLandscape_0 = 26
        
        let widthPad_1 = 31; let heightPad_1 = 41
        let widthPhonePortrait_1 = 24; let heightPhonePortrait_1 = 31
        let widthPhoneLandscape_1 = 20; let heightPhoneLandscape_1 = 26
        
        let widthPad_2 = 21; let heightPad_2 = 27
        let widthPhonePortrait_2 = 16; let heightPhonePortrait_2 = 21
        let widthPhoneLandscape_2 = 13; let heightPhoneLandscape_2 = 17
        
        return Self.build(prefix: "sexy_button",
                          name: "delete",
                          widthPad_0: widthPad_0, heightPad_0: heightPad_0,
                          widthPhoneLandscape_0: widthPhoneLandscape_0, heightPhoneLandscape_0: heightPhoneLandscape_0,
                          widthPhonePortrait_0: widthPhonePortrait_0, heightPhonePortrait_0: heightPhonePortrait_0,
                          widthPad_1: widthPad_1, heightPad_1: heightPad_1,
                          widthPhoneLandscape_1: widthPhoneLandscape_1, heightPhoneLandscape_1: heightPhoneLandscape_1,
                          widthPhonePortrait_1: widthPhonePortrait_1, heightPhonePortrait_1: heightPhonePortrait_1,
                          widthPad_2: widthPad_2, heightPad_2: heightPad_2,
                          widthPhoneLandscape_2: widthPhoneLandscape_2, heightPhoneLandscape_2: heightPhoneLandscape_2,
                          widthPhonePortrait_2: widthPhonePortrait_2, heightPhonePortrait_2: heightPhonePortrait_2)
    }
    
    private static func build(prefix: String,
                              name: String,
                              
                              widthPad_0: Int, heightPad_0: Int,
                              widthPhoneLandscape_0: Int, heightPhoneLandscape_0: Int,
                              widthPhonePortrait_0: Int, heightPhonePortrait_0: Int,
                              
                              widthPad_1: Int, heightPad_1: Int,
                              widthPhoneLandscape_1: Int, heightPhoneLandscape_1: Int,
                              widthPhonePortrait_1: Int, heightPhonePortrait_1: Int,
                              
                              widthPad_2: Int, heightPad_2: Int,
                              widthPhoneLandscape_2: Int, heightPhoneLandscape_2: Int,
                              widthPhonePortrait_2: Int, heightPhonePortrait_2: Int) -> FramedConvertibleIconPack {
        
        let planePad_0 = IconPlane(numberOfLines: 0, device: .pad, orientation: .portrait, prefix: prefix, name: name,
                                   width: widthPad_0, height: heightPad_0)
        let planePad_1 = IconPlane(numberOfLines: 1, device: .pad, orientation: .portrait, prefix: prefix, name: name,
                                   width: widthPad_1, height: heightPad_1)
        let planePad_2 = IconPlane(numberOfLines: 2, device: .pad, orientation: .portrait, prefix: prefix, name: name,
                                   width: widthPad_2, height: heightPad_2)
        
        let planePhoneLandscape_0 = IconPlane(numberOfLines: 0, device: .phone, orientation: .landscape, prefix: prefix, name: name,
                                              width: widthPhoneLandscape_0, height: heightPhoneLandscape_0)
        let planePhoneLandscape_1 = IconPlane(numberOfLines: 1, device: .phone, orientation: .landscape, prefix: prefix, name: name,
                                              width: widthPhoneLandscape_1, height: heightPhoneLandscape_1)
        let planePhoneLandscape_2 = IconPlane(numberOfLines: 2, device: .phone, orientation: .landscape, prefix: prefix, name: name,
                                              width: widthPhoneLandscape_2, height: heightPhoneLandscape_2)
        
        let planePhonePortrait_0 = IconPlane(numberOfLines: 0, device: .phone, orientation: .portrait, prefix: prefix, name: name,
                                             width: widthPhonePortrait_0, height: heightPhonePortrait_0)
        let planePhonePortrait_1 = IconPlane(numberOfLines: 1, device: .phone, orientation: .portrait, prefix: prefix, name: name,
                                             width: widthPhonePortrait_1, height: heightPhonePortrait_1)
        let planePhonePortrait_2 = IconPlane(numberOfLines: 2, device: .phone, orientation: .portrait, prefix: prefix, name: name,
                                             width: widthPhonePortrait_2, height: heightPhonePortrait_2)
        
        return FramedConvertibleIconPack(planePad_0: planePad_0,
                                planePhoneLandscape_0: planePhoneLandscape_0,
                                planePhonePortrait_0: planePhonePortrait_0,
                                planePad_1: planePad_1,
                                planePhoneLandscape_1: planePhoneLandscape_1,
                                planePhonePortrait_1: planePhonePortrait_1,
                                planePad_2: planePad_2,
                                planePhoneLandscape_2: planePhoneLandscape_2,
                                planePhonePortrait_2: planePhonePortrait_2)
        
    }
}
