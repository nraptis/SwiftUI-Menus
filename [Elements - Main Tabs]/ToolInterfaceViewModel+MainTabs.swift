//
//  ToolInterfaceViewModel+MainTabs.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//


import Foundation

extension ToolInterfaceViewModel {
    
    static func getMainTabFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementMainTabConfiguration,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let numberOfButtons = configuration.buttonConfigurations.count
        
        var greatestStandardWidthLarge = 0
        var greatestStandardWidthMedium = 0
        var greatestStandardWidthSmall = 0
        
        var sumMinimumWidthLarge = 0
        var sumStandardWidthLarge = 0
        
        var sumMinimumWidthMedium = 0
        var sumStandardWidthMedium = 0
        
        var sumMinimumWidthSmall = 0
        var sumStandardWidthSmall = 0
        
        for buttonConfiguration in configuration.buttonConfigurations {
            
            let iconPack = buttonConfiguration.iconPack
            
            let numberOfLines = buttonConfiguration.nameLabelNumberOfLines
            
            
            let minimumWidthLarge = MainTabLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthLarge,
                                                                                       nameLabelNumberOfLines: numberOfLines,
                                                                                       iconPack: iconPack,
                                                                                       orientation: orientation,
                                                                                       flavor: .stackedLarge,
                                                                                       squeeze: .squeezed)
            let standardWidthLarge = MainTabLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthLarge,
                                                                                        nameLabelNumberOfLines: numberOfLines,
                                                                                        iconPack: iconPack,
                                                                                        orientation: orientation,
                                                                                        flavor: .stackedLarge,
                                                                                        squeeze: .standard)
            
            let minimumWidthMedium = MainTabLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthMedium,
                                                                                        nameLabelNumberOfLines: numberOfLines,
                                                                                        iconPack: iconPack,
                                                                                        orientation: orientation,
                                                                                        flavor: .stackedMedium,
                                                                                        squeeze: .squeezed)
            
            let standardWidthMedium = MainTabLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthMedium,
                                                                                         nameLabelNumberOfLines: numberOfLines,
                                                                                         iconPack: iconPack,
                                                                                         orientation: orientation,
                                                                                         flavor: .stackedMedium,
                                                                                         squeeze: .standard)
            
            let minimumWidthSmall = MainTabLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthSmall,
                                                                                       nameLabelNumberOfLines: numberOfLines,
                                                                                       iconPack: iconPack,
                                                                                       orientation: orientation,
                                                                                       flavor: .stackedSmall,
                                                                                       squeeze: .squeezed)
            let standardWidthSmall = MainTabLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthSmall,
                                                                                        nameLabelNumberOfLines: numberOfLines,
                                                                                        iconPack: iconPack,
                                                                                        orientation: orientation,
                                                                                        flavor: .stackedSmall,
                                                                                        squeeze: .standard)
            
            greatestStandardWidthLarge = max(greatestStandardWidthLarge, standardWidthLarge)
            greatestStandardWidthMedium = max(greatestStandardWidthMedium, standardWidthMedium)
            greatestStandardWidthSmall = max(greatestStandardWidthSmall, standardWidthSmall)
            
            sumMinimumWidthLarge += minimumWidthLarge
            sumStandardWidthLarge += standardWidthLarge
            
            sumMinimumWidthMedium += minimumWidthMedium
            sumStandardWidthMedium += standardWidthMedium
            
            sumMinimumWidthSmall += minimumWidthSmall
            sumStandardWidthSmall += standardWidthSmall
        }
        
        let universalPaddingLeftStackedLargeSqueezed = MainTabLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedLarge,
                                                                                             squeeze: .squeezed,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedLargeStandard = MainTabLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedLarge,
                                                                                             squeeze: .standard,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedLargeSqueezed = MainTabLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedLarge,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedLargeStandard = MainTabLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedLarge,
                                                                                               squeeze: .standard,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedLargeSqueezed = MainTabLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                         flavor: .stackedLarge,
                                                                                                         squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedLargeStandard = MainTabLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                         flavor: .stackedLarge,
                                                                                                         squeeze: .standard)
        var buttonUniversalPaddingRightStackedLargeSqueezed = MainTabLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                           flavor: .stackedLarge,
                                                                                                           squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedLargeStandard = MainTabLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                           flavor: .stackedLarge,
                                                                                                           squeeze: .standard)
        
        let universalPaddingLeftStackedMediumSqueezed = MainTabLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                              flavor: .stackedMedium,
                                                                                              squeeze: .squeezed,
                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                              neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedMediumStandard = MainTabLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                              flavor: .stackedMedium,
                                                                                              squeeze: .standard,
                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                              neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedMediumSqueezed = MainTabLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                flavor: .stackedMedium,
                                                                                                squeeze: .squeezed,
                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedMediumStandard = MainTabLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                flavor: .stackedMedium,
                                                                                                squeeze: .standard,
                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedMediumSqueezed = MainTabLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                          flavor: .stackedMedium,
                                                                                                          squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedMediumStandard = MainTabLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                          flavor: .stackedMedium,
                                                                                                          squeeze: .standard)
        var buttonUniversalPaddingRightStackedMediumSqueezed = MainTabLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                            flavor: .stackedMedium,
                                                                                                            squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedMediumStandard = MainTabLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                            flavor: .stackedMedium,
                                                                                                            squeeze: .standard)
        
        let universalPaddingLeftStackedSmallSqueezed = MainTabLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedSmall,
                                                                                             squeeze: .squeezed,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedSmallStandard = MainTabLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedSmall,
                                                                                             squeeze: .standard,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedSmallSqueezed = MainTabLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedSmall,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedSmallStandard = MainTabLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedSmall,
                                                                                               squeeze: .standard,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedSmallSqueezed = MainTabLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                         flavor: .stackedSmall,
                                                                                                         squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedSmallStandard = MainTabLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                         flavor: .stackedSmall,
                                                                                                         squeeze: .standard)
        var buttonUniversalPaddingRightStackedSmallSqueezed = MainTabLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                           flavor: .stackedSmall,
                                                                                                           squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedSmallStandard = MainTabLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                           flavor: .stackedSmall,
                                                                                                           squeeze: .standard)
        
        buttonUniversalPaddingLeftStackedLargeSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftStackedLargeStandard *= numberOfButtons
        buttonUniversalPaddingRightStackedLargeSqueezed *= numberOfButtons
        buttonUniversalPaddingRightStackedLargeStandard *= numberOfButtons
        
        buttonUniversalPaddingLeftStackedMediumSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftStackedMediumStandard *= numberOfButtons
        buttonUniversalPaddingRightStackedMediumSqueezed *= numberOfButtons
        buttonUniversalPaddingRightStackedMediumStandard *= numberOfButtons
        
        buttonUniversalPaddingLeftStackedSmallSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftStackedSmallStandard *= numberOfButtons
        buttonUniversalPaddingRightStackedSmallSqueezed *= numberOfButtons
        buttonUniversalPaddingRightStackedSmallStandard *= numberOfButtons
        
        let maximumExtraPadding = (Device.isPad ? 5 : 3) * numberOfButtons
        
        let sumAllEqualStackedLargeStandard = greatestStandardWidthLarge * numberOfButtons
        let sumAllEqualStackedMediumStandard = greatestStandardWidthMedium * numberOfButtons
        let sumAllEqualStackedSmallStandard = greatestStandardWidthSmall * numberOfButtons
        
        let minimumWidthLarge = sumMinimumWidthLarge +
        buttonUniversalPaddingLeftStackedLargeSqueezed +
        buttonUniversalPaddingRightStackedLargeSqueezed +
        universalPaddingLeftStackedLargeSqueezed +
        universalPaddingRightStackedLargeSqueezed
        
        let standardWidthLarge = sumStandardWidthLarge +
        buttonUniversalPaddingLeftStackedLargeStandard +
        buttonUniversalPaddingRightStackedLargeStandard +
        universalPaddingLeftStackedLargeStandard +
        universalPaddingRightStackedLargeStandard
        
        let relaxedWidthLarge = sumAllEqualStackedLargeStandard +
        buttonUniversalPaddingLeftStackedLargeStandard +
        buttonUniversalPaddingRightStackedLargeStandard +
        universalPaddingLeftStackedLargeStandard +
        universalPaddingRightStackedLargeStandard +
        maximumExtraPadding
        
        let minimumWidthMedium = sumMinimumWidthMedium +
        buttonUniversalPaddingLeftStackedMediumSqueezed +
        buttonUniversalPaddingRightStackedMediumSqueezed +
        universalPaddingLeftStackedMediumSqueezed +
        universalPaddingRightStackedMediumSqueezed
        
        let standardWidthMedium = sumStandardWidthMedium +
        buttonUniversalPaddingLeftStackedMediumStandard +
        buttonUniversalPaddingRightStackedMediumStandard +
        universalPaddingLeftStackedMediumStandard +
        universalPaddingRightStackedMediumStandard
        
        let relaxedWidthMedium = sumAllEqualStackedMediumStandard +
        buttonUniversalPaddingLeftStackedMediumStandard +
        buttonUniversalPaddingRightStackedMediumStandard +
        universalPaddingLeftStackedMediumStandard +
        universalPaddingRightStackedMediumStandard +
        maximumExtraPadding
        
        let minimumWidthSmall = sumMinimumWidthSmall +
        buttonUniversalPaddingLeftStackedSmallSqueezed +
        buttonUniversalPaddingRightStackedSmallSqueezed +
        universalPaddingLeftStackedSmallSqueezed +
        universalPaddingRightStackedSmallSqueezed
        
        let standardWidthSmall = sumStandardWidthSmall +
        buttonUniversalPaddingLeftStackedSmallStandard +
        buttonUniversalPaddingRightStackedSmallStandard +
        universalPaddingLeftStackedSmallStandard +
        universalPaddingRightStackedSmallStandard
        
        let relaxedWidthSmall = sumAllEqualStackedSmallStandard +
        buttonUniversalPaddingLeftStackedSmallStandard +
        buttonUniversalPaddingRightStackedSmallStandard +
        universalPaddingLeftStackedSmallStandard +
        universalPaddingRightStackedSmallStandard +
        maximumExtraPadding
        
        let flexMainTabData = FlexMainTabData(minimumWidthLarge: minimumWidthLarge,
                                              standardWidthLarge: standardWidthLarge,
                                              relaxedWidthLarge: relaxedWidthLarge,
                                              
                                              minimumWidthMedium: minimumWidthMedium,
                                              standardWidthMedium: standardWidthMedium,
                                              relaxedWidthMedium: relaxedWidthMedium,
                                              
                                              minimumWidthSmall: minimumWidthSmall,
                                              standardWidthSmall: standardWidthSmall,
                                              relaxedWidthSmall: relaxedWidthSmall)
        
        return ToolInterfaceElementFlex.mainTab(flexMainTabData)
    }
}
