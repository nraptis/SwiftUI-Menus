//
//  MagicalSliderBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import SwiftUI

struct MagicalSliderBar: View {
    
    @Environment(MagicalSliderViewModel.self) var magicalViewModel
    
    enum DragState {
        case idle
        case dragging(x: CGFloat)
        var x: CGFloat {
            switch self {
            case .idle:
                return 0.0
            case .dragging(let x):
                return x
            }
        }
    }
    
    @GestureState var dragGestureState = DragState.idle
    @State var isDragging = false
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        
        let sliderBoxWidth = magicalViewModel.sliderBoxWidth
        
        let thumbDiameterStroke = SliderLayout.getThumbDiameterStroke(orientation: orientation)
        let thumbDiameterFill = SliderLayout.getThumbDiameterFill(orientation: orientation)
        
        let thumbColorStroke: Color
        let thumbColorFill: Color
        let barColorStroke: Color
        let barColorFillOff: Color
        let barColorFillOn: Color
        
        if magicalViewModel.isDarkModeEnabled {
            if magicalViewModel.isEnabled {
                thumbColorStroke = ToolInterfaceTheme.primaryEnabledDark
                thumbColorFill = ToolInterfaceTheme.sliderFillOffEnabledDark
                barColorStroke = ToolInterfaceTheme.primaryEnabledDark
                barColorFillOff = ToolInterfaceTheme.sliderFillOffEnabledDark
                barColorFillOn = ToolInterfaceTheme.sliderFillOnEnabledDark
            } else {
                thumbColorStroke = ToolInterfaceTheme.primaryDisabledDark
                thumbColorFill = ToolInterfaceTheme.sliderFillOffDisabledDark
                barColorStroke = ToolInterfaceTheme.primaryDisabledDark
                barColorFillOff = ToolInterfaceTheme.sliderFillOffDisabledDark
                barColorFillOn = ToolInterfaceTheme.sliderFillOnDisabledDark
            }
        } else {
            if magicalViewModel.isEnabled {
                thumbColorStroke = ToolInterfaceTheme.primaryEnabledLight
                thumbColorFill = ToolInterfaceTheme.sliderFillOffEnabledLight
                barColorStroke = ToolInterfaceTheme.primaryEnabledLight
                barColorFillOff = ToolInterfaceTheme.sliderFillOffEnabledLight
                barColorFillOn = ToolInterfaceTheme.sliderFillOnEnabledLight
            } else {
                thumbColorStroke = ToolInterfaceTheme.primaryDisabledLight
                thumbColorFill = ToolInterfaceTheme.sliderFillOffDisabledLight
                barColorStroke = ToolInterfaceTheme.primaryDisabledLight
                barColorFillOff = ToolInterfaceTheme.sliderFillOffDisabledLight
                barColorFillOn = ToolInterfaceTheme.sliderFillOnDisabledLight
            }
        }
        
        let thumbHitBoxWidth = SliderLayout.getThumbHitBoxWidth(orientation: orientation)
        
        let sizeDifferential = thumbHitBoxWidth - thumbDiameterStroke
        let sizeDifferential2 = sizeDifferential >> 1
        
        let barDiameterFill = SliderLayout.getBarDiameterFill(orientation: orientation)
        let barDiameterStroke = SliderLayout.getBarDiameterStroke(orientation: orientation)
        
        let barInset = (thumbDiameterStroke - barDiameterStroke) >> 1
        let barFillInset = (barDiameterStroke - barDiameterFill) >> 1
        
        let barStrokeWidth = (sliderBoxWidth - (barInset + barInset))
        let barFillWidth = barStrokeWidth - (barFillInset + barFillInset)
        
        let thumbOffsetX = magicalViewModel.thumbOffsetX + dragGestureState.x
        
        var thumbPercent = CGFloat(0.5)
        let thumbRange = (magicalViewModel.thumbMaximumX - magicalViewModel.thumbMinimumX)
        if thumbRange > 1 {
            thumbPercent = CGFloat(thumbOffsetX) / thumbRange
        }
        
        let minimumWidth = (barDiameterFill)
        let relaxedWidth = (barFillWidth - minimumWidth)
        
        var barFillWidthLHS = Int(thumbPercent * CGFloat(barFillWidth) + 0.5)
        if barFillWidthLHS < minimumWidth { barFillWidthLHS = minimumWidth }
        if barFillWidthLHS > relaxedWidth { barFillWidthLHS = relaxedWidth }
        let barFillWidthRHS = barFillWidth - barFillWidthLHS
        
        var sliderBoxWidthMinusBoxWidth = sliderBoxWidth - thumbHitBoxWidth
        if sliderBoxWidthMinusBoxWidth < 0 {
            sliderBoxWidthMinusBoxWidth = 0
        }
        
        return ZStack {
            if barStrokeWidth > 0 {
                HStack(spacing: 0.0) {
                    
                    Spacer()
                        .frame(width: CGFloat(barInset))
                    
                    ZStack {
                        Capsule()
                            .frame(width: CGFloat(barStrokeWidth), height: CGFloat(barDiameterStroke))
                            .foregroundStyle(barColorStroke)
                        
                        HStack(spacing: 0.0) {
                            Spacer()
                                .frame(width: CGFloat(barFillInset))
                            ZStack {
                                HStack(spacing: 0.0) {
                                    Capsule()
                                        .frame(width: CGFloat(barFillWidthLHS), height: CGFloat(barDiameterFill))
                                        .foregroundStyle(barColorFillOn)
                                    Capsule()
                                        .frame(width: CGFloat(barFillWidthRHS), height: CGFloat(barDiameterFill))
                                        .foregroundStyle(barColorFillOff)
                                }
                            }
                            Spacer()
                                .frame(width: CGFloat(barFillInset))
                        }
                    }
                    Spacer()
                        .frame(width: CGFloat(barInset))
                }
                .frame(width: CGFloat(sliderBoxWidth), height: CGFloat(barDiameterStroke))
#if INTERFACE_HINTS
                .overlay(RoundedRectangle(cornerRadius: 2.0).stroke().foregroundStyle(Color.blue.opacity(0.75)))
#endif
            }
            
            HStack(spacing: 0.0) {
                
                ZStack {
                    ZStack {
                        
                        Circle()
                            .frame(width: CGFloat(thumbDiameterStroke), height: CGFloat(thumbDiameterStroke))
                            .foregroundStyle(thumbColorStroke)
                        
                        Circle()
                            .frame(width: CGFloat(thumbDiameterFill), height: CGFloat(thumbDiameterFill))
                            .foregroundStyle(thumbColorFill)
                    }
                    .frame(width: CGFloat(thumbDiameterStroke),
                           height: CGFloat(thumbDiameterStroke))
                    
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 1.0, green: 0.25, blue: 0.35, opacity: 0.65)))
#endif
                }
                .frame(width: CGFloat(thumbHitBoxWidth), 
                       height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
                .overlay(Rectangle().stroke().foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.45, opacity: 0.65)))
#endif
                .offset(x: CGFloat(-sizeDifferential2), y: 0.0)
                .offset(CGSize(width: magicalViewModel.thumbOffsetX + dragGestureState.x, height: 0.0))
                .gesture(
                    DragGesture(minimumDistance: 2.0, coordinateSpace: .local)
                        .updating($dragGestureState, body: dragUpdating)
                        .onChanged(dragChanged(dragValue:))
                        .onEnded(dragEnded(dragValue:)))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(sliderBoxWidthMinusBoxWidth), height: 20.0)
                    //.background(Color(red: 0.75, green: 1.0, blue: 1.0, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(sliderBoxWidthMinusBoxWidth))
#endif
            }
            .frame(width: CGFloat(sliderBoxWidth),
                   height: CGFloat(magicalViewModel.layoutHeight))
            
        }
        .frame(width: CGFloat(sliderBoxWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .background(Rectangle().foregroundStyle(Color(red: 1.0, green: 0.25, blue: 0.65, opacity: 0.15)))
#endif
        
    }
    
    private func dragUpdating(dragValue: DragGesture.Value, dragGestureState: inout DragState, transaction: inout Transaction) {
        
        if magicalViewModel.thumbMaximumX <= magicalViewModel.thumbMinimumX { return }
        
        var translation = dragValue.translation.width
        
        let proposedX = magicalViewModel.thumbOffsetX + dragValue.translation.width
        if proposedX > magicalViewModel.thumbMaximumX {
            translation = (magicalViewModel.thumbMaximumX - magicalViewModel.thumbOffsetX)
        }
        if proposedX < magicalViewModel.thumbMinimumX {
            translation = magicalViewModel.thumbMinimumX - magicalViewModel.thumbOffsetX
        }
        dragGestureState = .dragging(x: translation)
    }
    
    private func dragChanged(dragValue: DragGesture.Value) {
        
        if magicalViewModel.thumbMaximumX <= magicalViewModel.thumbMinimumX { return }
        
        var position = magicalViewModel.thumbOffsetX + dragValue.translation.width
        
        if position > magicalViewModel.thumbMaximumX {
            position = magicalViewModel.thumbMaximumX
        }
        if position < magicalViewModel.thumbMinimumX {
            position = magicalViewModel.thumbMinimumX
        }
        
        var percent = CGFloat(0.0)
        let range = Float(magicalViewModel.thumbMaximumX - magicalViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = (position - magicalViewModel.thumbMinimumX) / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if (position >= magicalViewModel.thumbMaximumX) {
            percent = 1.0
        }
        if (position <= magicalViewModel.thumbMinimumX) {
            percent = 0.0
        }
        
        if isDragging == false {
            isDragging = true
            magicalViewModel.handleSlideStarted(percent: magicalViewModel.percent)
        }
        magicalViewModel.handleSlideUpdated(percent: percent)
    }
    
    private func dragEnded(dragValue: DragGesture.Value) {
        isDragging = false
        
        if magicalViewModel.thumbMaximumX <= magicalViewModel.thumbMinimumX { return }
        
        var thumbOffsetX = magicalViewModel.thumbOffsetX
        thumbOffsetX += dragValue.translation.width
        
        if thumbOffsetX > magicalViewModel.thumbMaximumX {
            thumbOffsetX = magicalViewModel.thumbMaximumX
        }
        if thumbOffsetX < magicalViewModel.thumbMinimumX {
            thumbOffsetX = magicalViewModel.thumbMinimumX
        }
        
        var percent = CGFloat(0.0)
        let range = Float(magicalViewModel.thumbMaximumX - magicalViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = (thumbOffsetX - magicalViewModel.thumbMinimumX) / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if (thumbOffsetX >= magicalViewModel.thumbMaximumX) {
            percent = 1.0
        }
        if (thumbOffsetX <= magicalViewModel.thumbMinimumX) {
            percent = 0.0
        }
        
        magicalViewModel.handleSlideFinished(percent: percent)
        magicalViewModel.thumbOffsetX = thumbOffsetX
    }
}
