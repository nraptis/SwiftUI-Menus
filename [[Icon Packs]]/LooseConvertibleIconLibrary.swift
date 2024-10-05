//
//  LooseConvertibleIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

struct LooseConvertibleIconLibrary {
    
    static var menuA: LooseConvertibleIconPack {
        Self.build(prefix: "loose",
                  name: "menu_a",
                  widthPad_0: 43, heightPad_0: 42,
                  widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 33, heightPhonePortrait_0: 32,
                  widthPad_1: 38, heightPad_1: 37,
                  widthPhoneLandscape_1: 27, heightPhoneLandscape_1: 26,
                  widthPhonePortrait_1: 32, heightPhonePortrait_1: 31,
                  widthPad_2: 26, heightPad_2: 25,
                  widthPhoneLandscape_2: 18, heightPhoneLandscape_2: 17,
                  widthPhonePortrait_2: 22, heightPhonePortrait_2: 21)
    }


    static var menuB: LooseConvertibleIconPack {
        Self.build(prefix: "loose",
                  name: "menu_b",
                  widthPad_0: 43, heightPad_0: 42,
                  widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 33, heightPhonePortrait_0: 32,
                  widthPad_1: 38, heightPad_1: 37,
                  widthPhoneLandscape_1: 27, heightPhoneLandscape_1: 26,
                  widthPhonePortrait_1: 32, heightPhonePortrait_1: 31,
                  widthPad_2: 26, heightPad_2: 25,
                  widthPhoneLandscape_2: 18, heightPhoneLandscape_2: 17,
                  widthPhonePortrait_2: 22, heightPhonePortrait_2: 21)
    }


    static var menuC: LooseConvertibleIconPack {
        Self.build(prefix: "loose",
                  name: "menu_c",
                  widthPad_0: 43, heightPad_0: 42,
                  widthPhoneLandscape_0: 28, heightPhoneLandscape_0: 27,
                  widthPhonePortrait_0: 33, heightPhonePortrait_0: 32,
                  widthPad_1: 38, heightPad_1: 37,
                  widthPhoneLandscape_1: 27, heightPhoneLandscape_1: 26,
                  widthPhonePortrait_1: 32, heightPhonePortrait_1: 31,
                  widthPad_2: 26, heightPad_2: 25,
                  widthPhoneLandscape_2: 18, heightPhoneLandscape_2: 17,
                  widthPhonePortrait_2: 22, heightPhonePortrait_2: 21)
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
                              widthPhonePortrait_2: Int, heightPhonePortrait_2: Int) -> LooseConvertibleIconPack {
        
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
        
        return LooseConvertibleIconPack(planePad_0: planePad_0,
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
