//
//  MagicalCheckBoxContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct MagicalCheckBoxContent: View {
    
    @Environment(MagicalCheckBoxViewModel.self) var magicalCheckBoxViewModel: MagicalCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let isChecked: Bool
    let isEnabled: Bool
    let isDarkMode: Bool
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    var body: some View {
        
        let configuration = magicalCheckBoxViewModel.checkBoxConfiguration
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
        let buttonUniversalPaddingLeft = magicalCheckBoxViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalCheckBoxViewModel.buttonUniversalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let nameLabelFont = CheckBoxLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = CheckBoxLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalCheckBoxViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalCheckBoxViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = CheckBoxLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = configuration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthStackedSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconPaddingLeft = magicalCheckBoxViewModel.iconPaddingLeft
        let iconPaddingRight = magicalCheckBoxViewModel.iconPaddingRight
        let iconPaddingTop = CheckBoxLayout.getIconPaddingTop(orientation: orientation,
                                                              flavor: layoutSchemeFlavor,
                                                              numberOfLines: numberOfLines)
        
        let checkBoxWidth = magicalCheckBoxViewModel.checkBoxWidth
        let checkBoxHeight = magicalCheckBoxViewModel.checkBoxHeight
        
        let checkBoxPaddingLeft = magicalCheckBoxViewModel.checkBoxPaddingLeft
        let checkBoxPaddingRight = magicalCheckBoxViewModel.checkBoxPaddingRight
        
        let contentHeight = magicalCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color: Color
        
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            
            if isDarkMode {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledDark
                } else {
                    color = ToolInterfaceTheme.primaryDisabledDark
                }
            } else {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledLight
                } else {
                    color = ToolInterfaceTheme.primaryDisabledLight
                }
            }
            
            /*
            if isDarkMode {
                if isChecked {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                }
            } else {
                if isChecked {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryDisabledLight
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
                }
            }
            */
        }
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            HStack(spacing: 0.0) {
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingLeft), height: 28.0)
                    .background(Color(red: 0.95, green: 0.65, blue: 0.45, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingLeft))
#endif
                
                ZStack {
                    switch layoutSchemeFlavor {
                    case .long:
                        HStack(spacing: 0.0) {
                            IconBox(icon: textIcon,
                                    iconWidth: iconWidth,
                                    iconHeight: iconHeight,
                                    iconPaddingLeft: iconPaddingLeft,
                                    iconPaddingRight: iconPaddingRight,
                                    iconPaddingTop: iconPaddingTop,
                                    color: color)
                            LabelBox(line1: line1,
                                     line2: line2,
                                     numberOfLines: numberOfLines,
                                     width: nameLabelWidth,
                                     paddingLeft: nameLabelPaddingLeft,
                                     paddingRight: nameLabelPaddingRight,
                                     paddingBottom: 0,
                                     lineHeight: lineHeight,
                                     spacingVertical: nameLabelVerticalSpacing,
                                     font: nameLabelFont,
                                     color: color)
                        }
                    case .stackedLarge, .stackedMedium, .stackedSmall:
                        
                        ZStack {
                            VStack(spacing: 0.0) {
                                IconBox(icon: textIcon,
                                        iconWidth: iconWidth,
                                        iconHeight: iconHeight,
                                        iconPaddingLeft: iconPaddingLeft,
                                        iconPaddingRight: iconPaddingRight,
                                        iconPaddingTop: iconPaddingTop,
                                        color: color)
                                Spacer(minLength: 0.0)
                            }
                            VStack(spacing: 0.0) {
                                Spacer(minLength: 0.0)
                                LabelBox(line1: line1,
                                         line2: line2,
                                         numberOfLines: numberOfLines,
                                         width: nameLabelWidth,
                                         paddingLeft: nameLabelPaddingLeft,
                                         paddingRight: nameLabelPaddingRight,
                                         paddingBottom: nameLabelPaddingBottom,
                                         lineHeight: lineHeight,
                                         spacingVertical: nameLabelVerticalSpacing,
                                         font: nameLabelFont,
                                         color: color)
                            }
                        }
                    }
                }
                .frame(height: CGFloat(contentHeight))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingRight), height: 28.0)
                    .background(Color(red: 0.95, green: 0.65, blue: 0.45, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingRight))
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(checkBoxPaddingLeft), height: 28.0)
                    .background(Color(red: 0.45, green: 0.65, blue: 0.95, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(checkBoxPaddingLeft))
#endif
                
                getCheckBox(width: checkBoxWidth, height: checkBoxHeight)
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(checkBoxPaddingRight), height: 28.0)
                .background(Color(red: 0.45, green: 0.65, blue: 0.95, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(checkBoxPaddingRight))
#endif
            }
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
    }
    
    func getCheckBox(width: Int, height: Int) -> some View {
        
        /*
        static let _checkBoxDisabled = UIColor(named: "tool_check_box_disabled") ?? UIColor()
        static let checkBoxDisabled = Color(uiColor: _checkBoxDisabled)
        
        static let _checkBox = UIColor(named: "tool_check_box") ?? UIColor()
        static let checkBox = Color(uiColor: _checkBox)
        
        static let _checkMarkDisabled = UIColor(named: "tool_check_mark_disabled") ?? UIColor()
        static let checkMarkDisabled = Color(uiColor: _checkMarkDisabled)
            
        static let _checkMark = UIColor(named: "tool_check_mark") ?? UIColor()
        static let checkMark = Color(uiColor: _checkMark)
        */
        
        let color: Color
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            if isDarkMode {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                } else {
                    color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                }
            } else {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                } else {
                    color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                }
            }
            /*
            if isChecked {
                if isDarkMode {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
                }
            } else {
                if isDarkMode {
                    if isEnabled {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedDark
                    } else {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedLight
                    } else {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedDisabledLight
                    }
                }
            }
            */
        }
        
        var scrunch: CGFloat
        if Device.isPad {
            scrunch = 8.0
        } else {
            scrunch = 4.0
        }
        
        return ZStack {
            if isChecked {
                GeometryReader() { geometry in
                    ZStack {
                        ShapeView(width: geometry.size.width - scrunch,
                                  height: geometry.size.height - scrunch,
                                  path: Style.checkMark(width: geometry.size.width - scrunch,
                                                        height: geometry.size.height - scrunch),
                                  color: color)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        
        .background(getCheckBoxStrokeRect(isPressed: isPressed, width: width, height: height))
        .background(getCheckBoxFillRect(isPressed: isPressed, width: width, height: height))
        
    }
    
    func getCheckBoxStrokeRect(isPressed: Bool, width: Int, height: Int) -> some View {
        let cornerRadius = CheckBoxLayout.getCheckBoxCornerRadius(orientation: orientation)
        let lineThickness = CheckBoxLayout.getCheckBoxLineThickness(orientation: orientation)
        
        let color: Color
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            
            if isDarkMode {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                } else {
                    color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                }
            } else {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                } else {
                    color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                }
            }
            /*
            if isChecked {
                if isDarkMode {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
                }
            } else {
                if isDarkMode {
                    if isEnabled {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedDark
                    } else {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedLight
                    } else {
                        color = ToolInterfaceTheme.checkPrimaryUncheckedDisabledLight
                    }
                }
            }
            */
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    func getCheckBoxFillRect(isPressed: Bool, width: Int, height: Int) -> some View {
        
        let cornerRadius = CheckBoxLayout.getCheckBoxCornerRadius(orientation: orientation)
        
        let color: Color
        if isChecked {
            if isEnabled {
                color = ToolInterfaceTheme.checkBox
            } else {
                color = ToolInterfaceTheme.checkBoxDisabled
            }
        } else {
            color = .clear
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    
}

