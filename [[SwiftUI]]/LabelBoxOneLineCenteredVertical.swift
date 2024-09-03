//
//  LabelBoxOneLineCenteredVertical.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

//struct : View {
struct LabelBoxOneLineCenteredVertical: View {
    
    let line: String?
    let width: Int
    let height: Int
    let paddingLeft: Int
    let paddingRight: Int
    let paddingBottom: Int
    let lineHeight: Int
    let font: UIFont
    let color: Color
    
    init(line: String?,
         width: Int,
         paddingLeft: Int,
         paddingRight: Int,
         paddingBottom: Int,
         lineHeight: Int,
         font: UIFont,
         color: Color) {
        self.line = line
        self.width = width
        self.paddingLeft = paddingLeft
        self.paddingRight = paddingRight
        self.paddingBottom = paddingBottom
        self.lineHeight = lineHeight
        self.font = font
        self.color = color
        self.height = lineHeight
    }
    
    var body: some View {
        return ZStack {
            if let line = line {
                getBody(line: line)
            } else {
                getBody()
            }
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
        .padding(.bottom, CGFloat(paddingBottom))
    }
    
    func getBody(line: String) -> some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingLeft), height: 12.0)
                    .background(Color(red: 0.75, green: 0.85, blue: 0.35))
#else
                Spacer()
                    .frame(width: CGFloat(paddingLeft))
#endif
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.95, green: 0.95, blue: 1.0, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
                Text(line)
                    .font(Font(font))
                    .fixedSize(horizontal: true, vertical: false)
                    //.frame(width: CGFloat(width), height: CGFloat(lineHeight))
                    .frame(height: CGFloat(lineHeight))
                    .foregroundColor(color)
#if INTERFACE_HINTS
                    .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.87, green: 0.95, blue: 0.45)))
#endif
#if LABEL_HINTS
                    .overlay(Rectangle().foregroundColor(Color.white.opacity(0.5)).zIndex(3097.0))
#endif
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.95, green: 0.95, blue: 1.0, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(paddingRight), height: 12.0)
                    .background(Color(red: 0.75, green: 0.35, blue: 0.85))
#else
                Spacer()
                    .frame(width: CGFloat(paddingRight))
#endif
                
            }
            .frame(width: CGFloat(width))
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.25, green: 0.95, blue: 0.65)))
#endif
    }
    
    func getBody() -> some View {
        VStack(spacing: 0.0) {
            
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
