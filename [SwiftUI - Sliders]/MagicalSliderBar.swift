//
//  MagicalSliderBar.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import SwiftUI

struct MagicalSliderBar: View {
    
    @Environment(MagicalSliderViewModel.self) var magicalSliderViewModel: MagicalSliderViewModel
    
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
        
        let orientation = magicalSliderViewModel.orientation
        
        let sliderBoxWidth = magicalSliderViewModel.sliderBoxWidth
        
        let thumbDiameterStroke = SliderLayout.getThumbDiameterStroke(orientation: orientation)
        let thumbDiameterFill = SliderLayout.getThumbDiameterFill(orientation: orientation)
        
        let thumbColorStroke: Color
        let thumbColorFill: Color
        let barColorStroke: Color
        let barColorFillOff: Color
        let barColorFillOn: Color
        
        if magicalSliderViewModel.isDarkModeEnabled {
            if magicalSliderViewModel.isEnabled {
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
            if magicalSliderViewModel.isEnabled {
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
        
        let isDarkMode = magicalSliderViewModel.isDarkModeEnabled
        let isEnabled = magicalSliderViewModel.isEnabled
        
        let thumbHitBoxWidth = SliderLayout.getThumbHitBoxWidth(orientation: orientation)
        
        let sizeDifferential = thumbHitBoxWidth - thumbDiameterStroke
        let sizeDifferential2 = sizeDifferential >> 1
        
        let barDiameterFill = SliderLayout.getBarDiameterFill(orientation: orientation)
        let barDiameterStroke = SliderLayout.getBarDiameterStroke(orientation: orientation)
        
        let barInset = (thumbDiameterStroke - barDiameterStroke) >> 1
        let barFillInset = (barDiameterStroke - barDiameterFill) >> 1
        
        let barStrokeWidth = (sliderBoxWidth - (barInset + barInset))
        let barFillWidth = barStrokeWidth - (barFillInset + barFillInset)
        
        let thumbOffsetX = magicalSliderViewModel.thumbOffsetX + dragGestureState.x
        
        var thumbPercent = CGFloat(0.5)
        let thumbRange = (magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
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
                        
                        /*
                        IconBox(icon: textIcon,
                                imageWidth: imageWidth,
                                imageHeight: imageHeight,
                                iconX: iconX,
                                iconY: iconY,
                                iconWidth: iconWidth,
                                iconHeight: iconHeight,
                                iconPaddingLeft: 0,
                                iconPaddingRight: 0,
                                iconPaddingTop: 0,
                                color: iconColor)
                        */
                        
                    }
                    .frame(width: CGFloat(thumbDiameterStroke),
                           height: CGFloat(thumbDiameterStroke))
                    
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 1.0, green: 0.25, blue: 0.35, opacity: 0.65)))
#endif
                }
                .frame(width: CGFloat(thumbHitBoxWidth), 
                       height: CGFloat(magicalSliderViewModel.layoutHeight))
#if INTERFACE_HINTS
                .overlay(Rectangle().stroke().foregroundStyle(Color(red: 1.0, green: 0.65, blue: 0.45, opacity: 0.65)))
#endif
                .offset(x: CGFloat(-sizeDifferential2), y: 0.0)
                .offset(CGSize(width: magicalSliderViewModel.thumbOffsetX + dragGestureState.x, height: 0.0))
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
                   height: CGFloat(magicalSliderViewModel.layoutHeight))
            
        }
        .frame(width: CGFloat(sliderBoxWidth),
               height: CGFloat(magicalSliderViewModel.layoutHeight))
#if INTERFACE_HINTS
        .background(Rectangle().foregroundStyle(Color(red: 1.0, green: 0.25, blue: 0.65, opacity: 0.15)))
#endif
        
    }
    
    private func dragUpdating(dragValue: DragGesture.Value, dragGestureState: inout DragState, transaction: inout Transaction) {
        
        if magicalSliderViewModel.thumbMaximumX <= magicalSliderViewModel.thumbMinimumX { return }
        
        var translation = dragValue.translation.width
        
        let proposedX = magicalSliderViewModel.thumbOffsetX + dragValue.translation.width
        if proposedX > magicalSliderViewModel.thumbMaximumX {
            translation = (magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbOffsetX)
        }
        if proposedX < magicalSliderViewModel.thumbMinimumX {
            translation = magicalSliderViewModel.thumbMinimumX - magicalSliderViewModel.thumbOffsetX
        }
        dragGestureState = .dragging(x: translation)
    }
    
    private func dragChanged(dragValue: DragGesture.Value) {
        
        if magicalSliderViewModel.thumbMaximumX <= magicalSliderViewModel.thumbMinimumX { return }
        
        var position = magicalSliderViewModel.thumbOffsetX + dragValue.translation.width
        
        if position > magicalSliderViewModel.thumbMaximumX {
            position = magicalSliderViewModel.thumbMaximumX
        }
        if position < magicalSliderViewModel.thumbMinimumX {
            position = magicalSliderViewModel.thumbMinimumX
        }
        
        var percent = CGFloat(0.0)
        let range = Float(magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = (position - magicalSliderViewModel.thumbMinimumX) / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if (position >= magicalSliderViewModel.thumbMaximumX) {
            percent = 1.0
        }
        if (position <= magicalSliderViewModel.thumbMinimumX) {
            percent = 0.0
        }
        
        if isDragging == false {
            isDragging = true
            magicalSliderViewModel.handleSlideStarted(percent: magicalSliderViewModel.percent)
        }
        magicalSliderViewModel.handleSlideUpdated(percent: percent)
    }
    
    private func dragEnded(dragValue: DragGesture.Value) {
        isDragging = false
        
        if magicalSliderViewModel.thumbMaximumX <= magicalSliderViewModel.thumbMinimumX { return }
        
        var thumbOffsetX = magicalSliderViewModel.thumbOffsetX
        thumbOffsetX += dragValue.translation.width
        
        if thumbOffsetX > magicalSliderViewModel.thumbMaximumX {
            thumbOffsetX = magicalSliderViewModel.thumbMaximumX
        }
        if thumbOffsetX < magicalSliderViewModel.thumbMinimumX {
            thumbOffsetX = magicalSliderViewModel.thumbMinimumX
        }
        
        var percent = CGFloat(0.0)
        let range = Float(magicalSliderViewModel.thumbMaximumX - magicalSliderViewModel.thumbMinimumX)
        if range > Math.epsilon {
            percent = (thumbOffsetX - magicalSliderViewModel.thumbMinimumX) / CGFloat(range)
        }
        if percent < 0.0 { percent = 0.0 }
        if percent > 1.0 { percent = 1.0 }
        
        if (thumbOffsetX >= magicalSliderViewModel.thumbMaximumX) {
            percent = 1.0
        }
        if (thumbOffsetX <= magicalSliderViewModel.thumbMinimumX) {
            percent = 0.0
        }
        
        magicalSliderViewModel.handleSlideFinished(percent: percent)
        magicalSliderViewModel.thumbOffsetX = thumbOffsetX
    }
}
