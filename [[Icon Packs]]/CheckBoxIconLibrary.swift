//
//  CheckBoxIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/10/24.
//

import Foundation

struct CheckBoxIconLibrary {
    
    static var sample: CheckBoxIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "check_box_sample_pad_0l",
                                         device: .pad, orientation: nil,
                                         width: 50, height: 42)
        let slicePad1Line = AnyTextIcon(fileName: "check_box_sample_pad_1l",
                                        device: .pad, orientation: nil,
                                        width: 40, height: 32)
        let slicePad2Lines = AnyTextIcon(fileName: "check_box_sample_pad_2l",
                                         device: .pad, orientation: nil,
                                         width: 28, height: 20)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "check_box_sample_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    width: 34, height: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "check_box_sample_phone_ls_1l",
                                                   device: .phone, orientation: .landscape,
                                                   width: 30, height: 22)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "check_box_sample_phone_ls_2l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 22, height: 14)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "check_box_sample_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 40, height: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "check_box_sample_phone_po_1l",
                                                  device: .phone, orientation: .portrait,
                                                  
                                                  width: 36, height: 28)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "check_box_sample_phone_po_2l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 26, height: 18)
        
        return CheckBoxIconPack(slicePad0Lines: slicePad0Lines,
                                slicePad1Line: slicePad1Line,
                                slicePad2Lines: slicePad2Lines,
                                
                                slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                
                                slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                slicePhonePortrait1Line: slicePhonePortrait1Line,
                                slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
    static var removePoints: CheckBoxIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "check_box_remove_points_pad_0l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 42, height: 42)
        let slicePad1Line = AnyTextIcon(fileName: "check_box_remove_points_pad_1l",
                                        device: .pad, orientation: nil,
                                        
                                        width: 32, height: 32)
        let slicePad2Lines = AnyTextIcon(fileName: "check_box_remove_points_pad_2l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 20, height: 20)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 26, height: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "check_box_remove_points_phone_ls_1l",
                                                   device: .phone, orientation: .landscape,
                                                   
                                                   width: 22, height: 22)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_ls_2l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 14, height: 14)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 32, height: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "check_box_remove_points_phone_po_1l",
                                                  device: .phone, orientation: .portrait,
                                                  
                                                  width: 28, height: 28)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_po_2l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 18, height: 18)
        
        return CheckBoxIconPack(slicePad0Lines: slicePad0Lines,
                                slicePad1Line: slicePad1Line,
                                slicePad2Lines: slicePad2Lines,
                                
                                slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                
                                slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                slicePhonePortrait1Line: slicePhonePortrait1Line,
                                slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
    static var addPoints: CheckBoxIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "check_box_add_points_pad_0l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 42, height: 42)
        let slicePad1Line = AnyTextIcon(fileName: "check_box_add_points_pad_1l",
                                        device: .pad, orientation: nil,
                                        
                                        width: 32, height: 32)
        let slicePad2Lines = AnyTextIcon(fileName: "check_box_add_points_pad_2l",
                                         device: .pad, orientation: nil,
                                         
                                         width: 20, height: 20)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "check_box_add_points_phone_ls_0l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 26, height: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "check_box_add_points_phone_ls_1l",
                                                   device: .phone, orientation: .landscape,
                                                   
                                                   width: 22, height: 22)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "check_box_add_points_phone_ls_2l",
                                                    device: .phone, orientation: .landscape,
                                                    
                                                    width: 14, height: 14)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "check_box_add_points_phone_po_0l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 32, height: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "check_box_add_points_phone_po_1l",
                                                  device: .phone, orientation: .portrait,
                                                  
                                                  width: 28, height: 28)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "check_box_add_points_phone_po_2l",
                                                   device: .phone, orientation: .portrait,
                                                   
                                                   width: 18, height: 18)
        
        return CheckBoxIconPack(slicePad0Lines: slicePad0Lines,
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
