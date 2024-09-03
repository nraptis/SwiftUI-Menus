//
//  SexyButtonIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

struct SexyButtonIconLibrary {

    static var graph: SexyButtonIconPack {
        let name = "sexy_button_draw_guide"
        let widthPad1Line = 42
        let heightPad1Line = 44
        let widthPhonePortrait1Line = 32
        let heightPhonePortrait1Line = 36
        let widthPhoneLandscape1Line = 27
        let heightPhoneLandscape1Line = 28
        
        let widthPad2Lines = 42
        let heightPad2Lines = 44 / 2
        let widthPhonePortrait2Lines = 32
        let heightPhonePortrait2Lines = 36 / 2
        let widthPhoneLandscape2Lines = 27
        let heightPhoneLandscape2Lines = 28 / 2
        
        return Self.build(name: name, widthPad1Line: widthPad1Line, heightPad1Line: heightPad1Line,
                          widthPhoneLandscape1Line: widthPhoneLandscape1Line, heightPhoneLandscape1Line: heightPhoneLandscape1Line,
                          widthPhonePortrait1Line: widthPhonePortrait1Line, heightPhonePortrait1Line: heightPhonePortrait1Line,
                          widthPad2Lines: widthPad2Lines, heightPad2Lines: heightPad2Lines,
                          widthPhoneLandscape2Lines: widthPhoneLandscape2Lines, heightPhoneLandscape2Lines: heightPhoneLandscape2Lines,
                          widthPhonePortrait2Lines: widthPhonePortrait2Lines, heightPhonePortrait2Lines: heightPhonePortrait2Lines)
    }
    
    private static func build(name: String,
                              widthPad1Line: Int, heightPad1Line: Int,
                              widthPhoneLandscape1Line: Int, heightPhoneLandscape1Line: Int,
                              widthPhonePortrait1Line: Int, heightPhonePortrait1Line: Int,
                              widthPad2Lines: Int, heightPad2Lines: Int,
                              widthPhoneLandscape2Lines: Int, heightPhoneLandscape2Lines: Int,
                              widthPhonePortrait2Lines: Int, heightPhonePortrait2Lines: Int) -> SexyButtonIconPack {
        
        let slicePadDark1Line = AnyTextIcon(fileName: name + "_pad_1l_dark",
                                            device: .pad,
                                            orientation: .portrait,
                                            
                                            width: widthPad1Line, height: heightPad1Line)
        let slicePadLight1Line = AnyTextIcon(fileName: name + "_pad_1l_light",
                                             device: .pad,
                                             orientation: .portrait,
                                             
                                             width: widthPad1Line, height: heightPad1Line)
        let slicePhoneLandscapeDark1Line = AnyTextIcon(fileName:  name + "_phone_ls_1l_dark",
                                                       device: .phone,
                                                       orientation: .landscape,
                                                       
                                                       width: widthPhoneLandscape1Line, height: heightPhoneLandscape1Line)
        let slicePhoneLandscapeLight1Line = AnyTextIcon(fileName:  name + "_phone_ls_1l_light",
                                                        device: .phone,
                                                        orientation: .landscape,
                                                        
                                                        width: widthPhoneLandscape1Line, height: heightPhoneLandscape1Line)
        let slicePhonePortraitDark1Line = AnyTextIcon(fileName:  name + "_phone_po_1l_dark",
                                                      device: .phone,
                                                      orientation: .portrait,
                                                      
                                                      width: widthPhonePortrait1Line, height: heightPhonePortrait1Line)
        let slicePhonePortraitLight1Line = AnyTextIcon(fileName:  name + "_phone_po_1l_light",
                                                       device: .phone,
                                                       orientation: .portrait,
                                                       
                                                       width: widthPhonePortrait1Line, height: heightPhonePortrait1Line)
        
        let slicePadDark2Lines = AnyTextIcon(fileName: name + "_pad_2l_dark",
                                             device: .pad,
                                             orientation: .portrait,
                                             
                                             width: widthPad2Lines, height: heightPad2Lines)
        let slicePadLight2Lines = AnyTextIcon(fileName: name + "_pad_2l_light",
                                              device: .pad,
                                              orientation: .portrait,
                                              
                                              width: widthPad2Lines, height: heightPad2Lines)
        let slicePhoneLandscapeDark2Lines = AnyTextIcon(fileName:  name + "_phone_ls_2l_dark",
                                                        device: .phone,
                                                        orientation: .landscape,
                                                        
                                                        width: widthPhoneLandscape2Lines, height: heightPhoneLandscape2Lines)
        let slicePhoneLandscapeLight2Lines = AnyTextIcon(fileName:  name + "_phone_ls_2l_light",
                                                         device: .phone,
                                                         orientation: .landscape,
                                                         
                                                         width: widthPhoneLandscape2Lines, height: heightPhoneLandscape2Lines)
        let slicePhonePortraitDark2Lines = AnyTextIcon(fileName:  name + "_phone_po_2l_dark",
                                                       device: .phone,
                                                       orientation: .portrait,
                                                       
                                                       width: widthPhonePortrait2Lines, height: heightPhonePortrait2Lines)
        let slicePhonePortraitLight2Lines = AnyTextIcon(fileName:  name + "_phone_po_2l_light",
                                                        device: .phone,
                                                        orientation: .portrait,
                                                        
                                                        width: widthPhonePortrait2Lines, height: heightPhonePortrait2Lines)
        
        
        let slicePadDarkDisabled1Line = AnyTextIcon(fileName: name + "_pad_1l_dark_disabled",
                                                    device: .pad,
                                                    orientation: .portrait,
                                                    
                                                    width: widthPad1Line, height: heightPad1Line)
        let slicePadLightDisabled1Line = AnyTextIcon(fileName: name + "_pad_1l_light_disabled",
                                                     device: .pad,
                                                     orientation: .portrait,
                                                     
                                                     width: widthPad1Line, height: heightPad1Line)
        let slicePhoneLandscapeDarkDisabled1Line = AnyTextIcon(fileName:  name + "_phone_ls_1l_dark_disabled",
                                                               device: .phone,
                                                               orientation: .landscape,
                                                               
                                                               width: widthPhoneLandscape1Line, height: heightPhoneLandscape1Line)
        let slicePhoneLandscapeLightDisabled1Line = AnyTextIcon(fileName:  name + "_phone_ls_1l_light_disabled",
                                                                device: .phone,
                                                                orientation: .landscape,
                                                                
                                                                width: widthPhoneLandscape1Line, height: heightPhoneLandscape1Line)
        let slicePhonePortraitDarkDisabled1Line = AnyTextIcon(fileName:  name + "_phone_po_1l_dark_disabled",
                                                              device: .phone,
                                                              orientation: .portrait,
                                                              
                                                              width: widthPhonePortrait1Line, height: heightPhonePortrait1Line)
        let slicePhonePortraitLightDisabled1Line = AnyTextIcon(fileName:  name + "_phone_po_1l_light_disabled",
                                                               device: .phone,
                                                               orientation: .portrait,
                                                               
                                                               width: widthPhonePortrait1Line, height: heightPhonePortrait1Line)
        
        
        let slicePadDarkDisabled2Lines = AnyTextIcon(fileName: name + "_pad_2l_dark_disabled",
                                                     device: .pad,
                                                     orientation: .portrait,
                                                     
                                                     width: widthPad2Lines, height: heightPad2Lines)
        let slicePadLightDisabled2Lines = AnyTextIcon(fileName: name + "_pad_2l_light_disabled",
                                                      device: .pad,
                                                      orientation: .portrait,
                                                      
                                                      width: widthPad2Lines, height: heightPad2Lines)
        let slicePhoneLandscapeDarkDisabled2Lines = AnyTextIcon(fileName:  name + "_phone_ls_2l_dark_disabled",
                                                                device: .phone,
                                                                orientation: .landscape,
                                                                
                                                                width: widthPhoneLandscape2Lines, height: heightPhoneLandscape2Lines)
        let slicePhoneLandscapeLightDisabled2Lines = AnyTextIcon(fileName:  name + "_phone_ls_2l_light_disabled",
                                                                 device: .phone,
                                                                 orientation: .landscape,
                                                                 
                                                                 width: widthPhoneLandscape2Lines, height: heightPhoneLandscape2Lines)
        let slicePhonePortraitDarkDisabled2Lines = AnyTextIcon(fileName:  name + "_phone_po_2l_dark_disabled",
                                                               device: .phone,
                                                               orientation: .portrait,
                                                               
                                                               width: widthPhonePortrait2Lines, height: heightPhonePortrait2Lines)
        let slicePhonePortraitLightDisabled2Lines = AnyTextIcon(fileName:  name + "_phone_po_2l_light_disabled",
                                                                device: .phone,
                                                                orientation: .portrait,
                                                                
                                                                width: widthPhonePortrait2Lines, height: heightPhonePortrait2Lines)
        
        return SexyButtonIconPack(slicePadDark1Line: slicePadDark1Line,
                                  slicePadLight1Line: slicePadLight1Line,
                                  slicePhoneLandscapeDark1Line: slicePhoneLandscapeDark1Line,
                                  slicePhoneLandscapeLight1Line: slicePhoneLandscapeLight1Line,
                                  slicePhonePortraitDark1Line: slicePhonePortraitDark1Line,
                                  slicePhonePortraitLight1Line: slicePhonePortraitLight1Line,
                                  slicePadDarkDisabled1Line: slicePadDarkDisabled1Line,
                                  slicePadDark2Lines: slicePadDark2Lines,
                                  slicePadLight2Lines: slicePadLight2Lines,
                                  slicePhoneLandscapeDark2Lines: slicePhoneLandscapeDark2Lines,
                                  slicePhoneLandscapeLight2Lines: slicePhoneLandscapeLight2Lines,
                                  slicePhonePortraitDark2Lines: slicePhonePortraitDark2Lines,
                                  slicePhonePortraitLight2Lines: slicePhonePortraitLight2Lines,
                                  slicePadDarkDisabled2Lines: slicePadDarkDisabled2Lines,
                                  slicePadLightDisabled1Line: slicePadLightDisabled1Line,
                                  slicePhoneLandscapeDarkDisabled1Line: slicePhoneLandscapeDarkDisabled1Line,
                                  slicePhoneLandscapeLightDisabled1Line: slicePhoneLandscapeLightDisabled1Line,
                                  slicePhonePortraitDarkDisabled1Line: slicePhonePortraitDarkDisabled1Line,
                                  slicePhonePortraitLightDisabled1Line: slicePhonePortraitLightDisabled1Line,
                                  slicePadLightDisabled2Lines: slicePadLightDisabled2Lines,
                                  slicePhoneLandscapeDarkDisabled2Lines: slicePhoneLandscapeDarkDisabled2Lines,
                                  slicePhoneLandscapeLightDisabled2Lines: slicePhoneLandscapeLightDisabled2Lines,
                                  slicePhonePortraitDarkDisabled2Lines: slicePhonePortraitDarkDisabled2Lines,
                                  slicePhonePortraitLightDisabled2Lines: slicePhonePortraitLightDisabled2Lines)
    }
}
