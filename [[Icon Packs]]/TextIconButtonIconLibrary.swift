//
//  TextIconButtonIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

struct TextIconButtonIconLibrary {
    
    static var removePoint: TextIconButtonIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "text_button_remove_point_pad_0l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 42, height: 42)
        let slicePad1Line = AnyTextIcon(fileName: "text_button_remove_point_pad_1l",
                                        device: .pad, orientation: nil,
                                        
                                        width: 40, height: 40)
        let slicePad2Lines = AnyTextIcon(fileName: "text_button_remove_point_pad_2l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 26, height: 26)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "text_button_remove_point_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 26, height: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "text_button_remove_point_phone_ls_1l",
                                                   device: .phone, orientation: .landscape,
                                                   
                                                   width: 26, height: 26)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "text_button_remove_point_phone_ls_2l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 16, height: 16)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "text_button_remove_point_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 32, height: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "text_button_remove_point_phone_po_1l",
                                                  device: .phone, orientation: .portrait,
                                                  
                                                  width: 32, height: 32)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "text_button_remove_point_phone_po_2l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 20, height: 20)
        
        return TextIconButtonIconPack(slicePad0Lines: slicePad0Lines,
                                      slicePad1Line: slicePad1Line,
                                      slicePad2Lines: slicePad2Lines,
                                      
                                      slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                      slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                      slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                      
                                      slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                      slicePhonePortrait1Line: slicePhonePortrait1Line,
                                      slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
    static var undo: TextIconButtonIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "text_button_undo_pad_0l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 38, height: 40)
        let slicePad1Line = AnyTextIcon(fileName: "text_button_undo_pad_1l",
                                        device: .pad, orientation: nil,
                                        
                                        width: 38, height: 40)
        let slicePad2Lines = AnyTextIcon(fileName: "text_button_undo_pad_2l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 25, height: 26)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "text_button_undo_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 24, height: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "text_button_undo_phone_ls_1l",
                                                   device: .phone, orientation: .landscape,
                                                   
                                                   width: 24, height: 26)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "text_button_undo_phone_ls_2l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 16, height: 16)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "text_button_undo_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 30, height: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "text_button_undo_phone_po_1l",
                                                  device: .phone, orientation: .portrait,
                                                  
                                                  width: 29, height: 32)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "text_button_undo_phone_po_2l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 19, height: 20)
        
        return TextIconButtonIconPack(slicePad0Lines: slicePad0Lines,
                                      slicePad1Line: slicePad1Line,
                                      slicePad2Lines: slicePad2Lines,
                                      
                                      slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                      slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                      slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                      
                                      slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                      slicePhonePortrait1Line: slicePhonePortrait1Line,
                                      slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
    static var redo: TextIconButtonIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "text_button_redo_pad_0l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 38, height: 40)
        let slicePad1Line = AnyTextIcon(fileName: "text_button_redo_pad_1l",
                                        device: .pad, orientation: nil,
                                        
                                        width: 38, height: 40)
        let slicePad2Lines = AnyTextIcon(fileName: "text_button_redo_pad_2l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 24, height: 26)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "text_button_redo_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 24, height: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "text_button_redo_phone_ls_1l",
                                                   device: .phone, orientation: .landscape,
                                                   
                                                   width: 24, height: 26)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "text_button_redo_phone_ls_2l",
                                                    device: .phone, orientation: .landscape,
                                                    width: 16, height: 16)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "text_button_redo_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   width: 30, height: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "text_button_redo_phone_po_1l",
                                                  device: .phone, orientation: .portrait,
                                                  width: 30, height: 32)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "text_button_redo_phone_po_2l",
                                                   device: .phone, orientation: .portrait,
                                                   width: 20, height: 20)
        
        return TextIconButtonIconPack(slicePad0Lines: slicePad0Lines,
                                      slicePad1Line: slicePad1Line,
                                      slicePad2Lines: slicePad2Lines,
                                      
                                      slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                      slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                      slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                      
                                      slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                      slicePhonePortrait1Line: slicePhonePortrait1Line,
                                      slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
    static var box: TextIconButtonIconPack = {
        
        let slicePad1Line = AnyTextIcon(fileName: "interface_text_button_box_po_1l",
                                        device: .pad,
                                        orientation: .portrait, 
                                        width: 48, height: 40)
        
        let slicePad2Lines = AnyTextIcon(fileName: "interface_text_button_box_po_2l",
                                         device: .pad,
                                         orientation: .portrait,
                                         width: 34, height: 26)
        let slicePad0Lines = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                         device: .pad,
                                         orientation: .portrait,
                                         width: 42, height: 42)
        
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "interface_text_button_box_ls_1l",
                                                   device: .pad,
                                                   orientation: .portrait,
                                                   width: 34, height: 26)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "interface_text_button_box_ls_2l",
                                                    device: .pad,
                                                    orientation: .portrait,
                                                    width: 24, height: 16)
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "interface_text_button_box_ls_0l",
                                                    device: .pad,
                                                    orientation: .portrait,
                                                    width: 34, height: 26)
        
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "interface_text_button_box_po_1l",
                                                  device: .pad,
                                                  orientation: .portrait,
                                                  width: 40, height: 32)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "interface_text_button_box_po_2l",
                                                   device: .pad,
                                                   orientation: .portrait,
                                                   width: 28, height: 20)
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                                   device: .pad,
                                                   orientation: .portrait,
                                                   width: 32, height: 32)
        return TextIconButtonIconPack(slicePad0Lines: slicePad0Lines,
                                      slicePad1Line: slicePad1Line,
                                      slicePad2Lines: slicePad2Lines,
                                      
                                      slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                      slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                      slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                      
                                      slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                      slicePhonePortrait1Line: slicePhonePortrait1Line,
                                      slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
}
