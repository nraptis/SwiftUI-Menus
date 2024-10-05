//
//  ToolInterfaceViewModel+CreateSwatch.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getCreateSwatchFlex(orientation: Orientation,
                                    configuration: ToolInterfaceElementCreateSwatchConfiguration,
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
            
            
            let minimumWidthLarge = CreateSwatchLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthLarge,
                                                                                            nameLabelNumberOfLines: numberOfLines,
                                                                                            iconPack: iconPack,
                                                                                            orientation: orientation,
                                                                                            flavor: .stackedLarge,
                                                                                            squeeze: .squeezed)
            let standardWidthLarge = CreateSwatchLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthLarge,
                                                                                             nameLabelNumberOfLines: numberOfLines,
                                                                                             iconPack: iconPack,
                                                                                             orientation: orientation,
                                                                                             flavor: .stackedLarge,
                                                                                             squeeze: .standard)
            
            let minimumWidthMedium = CreateSwatchLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthMedium,
                                                                                             nameLabelNumberOfLines: numberOfLines,
                                                                                             iconPack: iconPack,
                                                                                             orientation: orientation,
                                                                                             flavor: .stackedMedium,
                                                                                             squeeze: .squeezed)
            
            let standardWidthMedium = CreateSwatchLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthMedium,
                                                                                              nameLabelNumberOfLines: numberOfLines,
                                                                                              iconPack: iconPack,
                                                                                              orientation: orientation,
                                                                                              flavor: .stackedMedium,
                                                                                              squeeze: .standard)
            
            let minimumWidthSmall = CreateSwatchLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthSmall,
                                                                                            nameLabelNumberOfLines: numberOfLines,
                                                                                            iconPack: iconPack,
                                                                                            orientation: orientation,
                                                                                            flavor: .stackedSmall,
                                                                                            squeeze: .squeezed)
            let standardWidthSmall = CreateSwatchLayout.getTextIconAndNameLabelWidthLongOnly(nameLabelWidth: buttonConfiguration.nameLabelWidthSmall,
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
        
        let universalPaddingLeftStackedLargeSqueezed = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: .stackedLarge,
                                                                                                  squeeze: .squeezed,
                                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                                  neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedLargeStandard = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: .stackedLarge,
                                                                                                  squeeze: .standard,
                                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                                  neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedLargeSqueezed = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: .stackedLarge,
                                                                                                    squeeze: .squeezed,
                                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedLargeStandard = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: .stackedLarge,
                                                                                                    squeeze: .standard,
                                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                                    neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedLargeSqueezed = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                              flavor: .stackedLarge,
                                                                                                              squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedLargeStandard = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                              flavor: .stackedLarge,
                                                                                                              squeeze: .standard)
        var buttonUniversalPaddingRightStackedLargeSqueezed = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                flavor: .stackedLarge,
                                                                                                                squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedLargeStandard = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                flavor: .stackedLarge,
                                                                                                                squeeze: .standard)
        
        let universalPaddingLeftStackedMediumSqueezed = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                   flavor: .stackedMedium,
                                                                                                   squeeze: .squeezed,
                                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                                   neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedMediumStandard = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                   flavor: .stackedMedium,
                                                                                                   squeeze: .standard,
                                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                                   neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedMediumSqueezed = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                     flavor: .stackedMedium,
                                                                                                     squeeze: .squeezed,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedMediumStandard = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                     flavor: .stackedMedium,
                                                                                                     squeeze: .standard,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedMediumSqueezed = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                               flavor: .stackedMedium,
                                                                                                               squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedMediumStandard = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                               flavor: .stackedMedium,
                                                                                                               squeeze: .standard)
        var buttonUniversalPaddingRightStackedMediumSqueezed = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                 flavor: .stackedMedium,
                                                                                                                 squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedMediumStandard = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                 flavor: .stackedMedium,
                                                                                                                 squeeze: .standard)
        
        let universalPaddingLeftStackedSmallSqueezed = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: .stackedSmall,
                                                                                                  squeeze: .squeezed,
                                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                                  neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedSmallStandard = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: .stackedSmall,
                                                                                                  squeeze: .standard,
                                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                                  neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedSmallSqueezed = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: .stackedSmall,
                                                                                                    squeeze: .squeezed,
                                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedSmallStandard = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: .stackedSmall,
                                                                                                    squeeze: .standard,
                                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                                    neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedSmallSqueezed = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                              flavor: .stackedSmall,
                                                                                                              squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedSmallStandard = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                              flavor: .stackedSmall,
                                                                                                              squeeze: .standard)
        var buttonUniversalPaddingRightStackedSmallSqueezed = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                flavor: .stackedSmall,
                                                                                                                squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedSmallStandard = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
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
        
        let flexCreateSwatchData = FlexCreateSwatchData(minimumWidthLarge: minimumWidthLarge,
                                                        standardWidthLarge: standardWidthLarge,
                                                        relaxedWidthLarge: relaxedWidthLarge,
                                                        
                                                        minimumWidthMedium: minimumWidthMedium,
                                                        standardWidthMedium: standardWidthMedium,
                                                        relaxedWidthMedium: relaxedWidthMedium,
                                                        
                                                        minimumWidthSmall: minimumWidthSmall,
                                                        standardWidthSmall: standardWidthSmall,
                                                        relaxedWidthSmall: relaxedWidthSmall)
        
        return ToolInterfaceElementFlex.createSwatch(flexCreateSwatchData)
    }
}
