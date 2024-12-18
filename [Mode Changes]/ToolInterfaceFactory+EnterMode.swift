//
//  ToolInterfaceFactory+EnterMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getGuidesEnterModeToolNode(orientation: Orientation,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGuidesEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGuidesEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.guides
        let accentPack = FramedLongIconLibrary.wolvenStein
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelGuidesEnter = MagicalModeChangeViewModelGuidesEnter(orientation: orientation,
                                                                         modeChangeConfiguration: configuration)
        let enterGuidesToolNode = ToolNode(id: getToolNodeID(),
                                           element: .enterModeGuides,
                                           flex: flex,
                                           magicalViewModel: viewModelGuidesEnter,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelGuidesEnter.refresh()
        return enterGuidesToolNode
    }
    
    static func getGraphEnterModeToolNode(orientation: Orientation,
                                          neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.magGlass
        let accentPack = FramedLongIconLibrary.wolfView
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelGraphEnter = MagicalModeChangeViewModelGraphEnter(orientation: orientation,
                                                                       modeChangeConfiguration: configuration)
        let enterGraphToolNode = ToolNode(id: getToolNodeID(),
                                          element: .enterModeGraph,
                                          flex: flex,
                                          magicalViewModel: viewModelGraphEnter,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelGraphEnter.refresh()
        return enterGraphToolNode
    }
    
    static func getAnimationLoopsEnterModeToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolfView
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationLoopsEnter = MagicalModeChangeViewModelAnimationLoopsEnter(orientation: orientation,
                                                                                         modeChangeConfiguration: configuration)
        let enterAnimationLoopsToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .enterModeAnimationLoops,
                                                   flex: flex,
                                                   magicalViewModel: viewModelAnimationLoopsEnter,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelAnimationLoopsEnter.refresh()
        return enterAnimationLoopsToolNode
    }
    
    static func getAnimationContinuousEnterModeToolNode(orientation: Orientation,
                                                        neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.continuousA
        let accentPack = FramedLongIconLibrary.continuousA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationContinuousEnter = MagicalModeChangeViewModelAnimationContinuousEnter(orientation: orientation,
                                                                                                   modeChangeConfiguration: configuration)
        let enterAnimationContinuousToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .enterModeAnimationContinuous,
                                                        flex: flex,
                                                        magicalViewModel: viewModelAnimationContinuousEnter,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelAnimationContinuousEnter.refresh()
        return enterAnimationContinuousToolNode
    }
    
    static func getTimeLineEnterModeToolNode(orientation: Orientation,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolvenStein
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineEnter = MagicalModeChangeViewModelTimeLineEnter(orientation: orientation,
                                                                             modeChangeConfiguration: configuration)
        let enterTimeLineToolNode = ToolNode(id: getToolNodeID(),
                                             element: .enterModeTimeLine,
                                             flex: flex,
                                             magicalViewModel: viewModelTimeLineEnter,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelTimeLineEnter.refresh()
        return enterTimeLineToolNode
    }
    
    static func getZoomEnterModeToolNode(orientation: Orientation,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextZoomEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextZoomEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.magGlass
        let accentPack = FramedLongIconLibrary.magGlass
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomEnter = MagicalModeChangeViewModelZoomEnter(orientation: orientation,
                                                                     modeChangeConfiguration: configuration)
        let enterZoomToolNode = ToolNode(id: getToolNodeID(),
                                         element: .enterModeZoom,
                                         flex: flex,
                                         magicalViewModel: viewModelZoomEnter,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        viewModelZoomEnter.refresh()
        return enterZoomToolNode
    }
    
    static func getVideoRecordEnterModeToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.wolfView
        let accentPack = FramedLongIconLibrary.makeGuide
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelVideoRecordEnter = MagicalModeChangeViewModelVideoRecordEnter(orientation: orientation,
                                                                                   modeChangeConfiguration: configuration)
        let enterVideoRecordToolNode = ToolNode(id: getToolNodeID(),
                                                element: .enterModeVideoRecord,
                                                flex: flex,
                                                magicalViewModel: viewModelVideoRecordEnter,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelVideoRecordEnter.refresh()
        return enterVideoRecordToolNode
    }
    
    static func getVideoExportEnterModeToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportEnterLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportEnterLine2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolfView
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelVideoExportEnter = MagicalModeChangeViewModelVideoExportEnter(orientation: orientation,
                                                                                   modeChangeConfiguration: configuration)
        let enterVideoExportToolNode = ToolNode(id: getToolNodeID(),
                                                element: .enterModeVideoExport,
                                                flex: flex,
                                                magicalViewModel: viewModelVideoExportEnter,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelVideoExportEnter.refresh()
        return enterVideoExportToolNode
    }
    
    static func getLoopsPage1EnterModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage1Line2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolvenStein
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage1Enter = MagicalModeChangeViewModelLoopsPage1Enter(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterLoopsPage1ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeLoopsPage1,
                                               flex: flex,
                                               magicalViewModel: viewModelLoopsPage1Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage1Enter.refresh()
        return enterLoopsPage1ToolNode
    }
    
    static func getLoopsPage2EnterModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage2Line2()
        let iconPack = FramedConvertibleIconLibrary.pointsA
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage2Enter = MagicalModeChangeViewModelLoopsPage2Enter(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterLoopsPage2ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeLoopsPage2,
                                               flex: flex,
                                               magicalViewModel: viewModelLoopsPage2Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage2Enter.refresh()
        return enterLoopsPage2ToolNode
    }
    
    static func getLoopsPage3EnterModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage3Line2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.menuC
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage3Enter = MagicalModeChangeViewModelLoopsPage3Enter(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterLoopsPage3ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeLoopsPage3,
                                               flex: flex,
                                               magicalViewModel: viewModelLoopsPage3Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage3Enter.refresh()
        return enterLoopsPage3ToolNode
    }
    
    static func getTimeLinePage1EnterModeToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage1Line2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolvenStein
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLinePage1Enter = MagicalModeChangeViewModelTimeLinePage1Enter(orientation: orientation,
                                                                                       modeChangeConfiguration: configuration)
        let enterTimeLinePage1ToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .enterModeTimeLinePage1,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLinePage1Enter,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLinePage1Enter.refresh()
        return enterTimeLinePage1ToolNode
    }
    
    static func getTimeLinePage2EnterModeToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage2Line2()
        let iconPack = FramedConvertibleIconLibrary.pointsA
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLinePage2Enter = MagicalModeChangeViewModelTimeLinePage2Enter(orientation: orientation,
                                                                                       modeChangeConfiguration: configuration)
        let enterTimeLinePage2ToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .enterModeTimeLinePage2,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLinePage2Enter,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLinePage2Enter.refresh()
        return enterTimeLinePage2ToolNode
    }
    
    static func getTimeLinePage3EnterModeToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage3Line2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.menuC
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLinePage3Enter = MagicalModeChangeViewModelTimeLinePage3Enter(orientation: orientation,
                                                                                       modeChangeConfiguration: configuration)
        let enterTimeLinePage3ToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .enterModeTimeLinePage3,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimeLinePage3Enter,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimeLinePage3Enter.refresh()
        return enterTimeLinePage3ToolNode
    }
    
    static func getContinuousPage1EnterModeToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage1Line2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolvenStein
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousPage1Enter = MagicalModeChangeViewModelContinuousPage1Enter(orientation: orientation,
                                                                                           modeChangeConfiguration: configuration)
        let enterContinuousPage1ToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .enterModeContinuousPage1,
                                                    flex: flex,
                                                    magicalViewModel: viewModelContinuousPage1Enter,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelContinuousPage1Enter.refresh()
        return enterContinuousPage1ToolNode
    }
    
    static func getContinuousPage2EnterModeToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage2Line2()
        let iconPack = FramedConvertibleIconLibrary.pointsA
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousPage2Enter = MagicalModeChangeViewModelContinuousPage2Enter(orientation: orientation,
                                                                                           modeChangeConfiguration: configuration)
        let enterContinuousPage2ToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .enterModeContinuousPage2,
                                                    flex: flex,
                                                    magicalViewModel: viewModelContinuousPage2Enter,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelContinuousPage2Enter.refresh()
        return enterContinuousPage2ToolNode
    }
    
    static func getContinuousPage3EnterModeToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage3Line2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.menuC
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelContinuousPage3Enter = MagicalModeChangeViewModelContinuousPage3Enter(orientation: orientation,
                                                                                           modeChangeConfiguration: configuration)
        let enterContinuousPage3ToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .enterModeContinuousPage3,
                                                    flex: flex,
                                                    magicalViewModel: viewModelContinuousPage3Enter,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelContinuousPage3Enter.refresh()
        return enterContinuousPage3ToolNode
    }
    
    static func getGraphPage1EnterModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage1Line2()
        let iconPack = FramedConvertibleIconLibrary.stereoscopic
        let accentPack = FramedLongIconLibrary.wolvenStein
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelGraphPage1Enter = MagicalModeChangeViewModelGraphPage1Enter(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterGraphPage1ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeGraphPage1,
                                               flex: flex,
                                               magicalViewModel: viewModelGraphPage1Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelGraphPage1Enter.refresh()
        return enterGraphPage1ToolNode
    }
    
    static func getGraphPage2EnterModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage2Line2()
        let iconPack = FramedConvertibleIconLibrary.pointsA
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelGraphPage2Enter = MagicalModeChangeViewModelGraphPage2Enter(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterGraphPage2ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeGraphPage2,
                                               flex: flex,
                                               magicalViewModel: viewModelGraphPage2Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelGraphPage2Enter.refresh()
        return enterGraphPage2ToolNode
    }
    
    static func getGraphPage3EnterModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage3Line2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.menuC
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getEnterModeFlex(orientation: orientation,
                                         configuration: configuration,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        
        let viewModelGraphPage3Enter = MagicalModeChangeViewModelGraphPage3Enter(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let enterGraphPage3ToolNode = ToolNode(id: getToolNodeID(),
                                               element: .enterModeGraphPage3,
                                               flex: flex,
                                               magicalViewModel: viewModelGraphPage3Enter,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelGraphPage3Enter.refresh()
        return enterGraphPage3ToolNode
    }
    
}
