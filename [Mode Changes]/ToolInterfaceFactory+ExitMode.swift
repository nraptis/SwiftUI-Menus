//
//  ToolInterfaceFactory+ExitMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getGuidesExitModeToolNode(orientation: Orientation,
                                          neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGuidesExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGuidesExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelGuidesExit = MagicalExitModeViewModelGuidesExit(orientation: orientation,
                                                                     modeChangeConfiguration: configuration)
        let exitGuidesToolNode = ToolNode(id: getToolNodeID(),
                                          element: .exitModeGuides,
                                          flex: flex,
                                          magicalViewModel: viewModelGuidesExit,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelGuidesExit.refresh()
        return exitGuidesToolNode
    }
    
    static func getGraphExitModeToolNode(orientation: Orientation,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelGraphExit = MagicalExitModeViewModelGraphExit(orientation: orientation,
                                                                   modeChangeConfiguration: configuration)
        let exitGraphToolNode = ToolNode(id: getToolNodeID(),
                                         element: .exitModeGraph,
                                         flex: flex,
                                         magicalViewModel: viewModelGraphExit,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        viewModelGraphExit.refresh()
        return exitGraphToolNode
    }
    
    static func getAnimationLoopsExitModeToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationLoopsExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationLoopsExit = MagicalExitModeViewModelAnimationLoops(orientation: orientation,
                                                                                 modeChangeConfiguration: configuration)
        let exitAnimationLoopsToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .exitModeAnimationLoops,
                                                  flex: flex,
                                                  magicalViewModel: viewModelAnimationLoopsExit,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelAnimationLoopsExit.refresh()
        return exitAnimationLoopsToolNode
    }
    
    static func getAnimationContinuousExitModeToolNode(orientation: Orientation,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationContinuousExit = MagicalExitModeViewModelAnimationContinuous(orientation: orientation,
                                                                                           modeChangeConfiguration: configuration)
        let exitAnimationContinuousToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .exitModeAnimationContinuous,
                                                       flex: flex,
                                                       magicalViewModel: viewModelAnimationContinuousExit,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelAnimationContinuousExit.refresh()
        return exitAnimationContinuousToolNode
    }
    
    static func getTimeLineExitModeToolNode(orientation: Orientation,
                                            neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLineExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineExit = MagicalExitModeViewModelTimeLineExit(orientation: orientation,
                                                                         modeChangeConfiguration: configuration)
        let exitTimeLineToolNode = ToolNode(id: getToolNodeID(),
                                            element: .exitModeTimeLine,
                                            flex: flex,
                                            magicalViewModel: viewModelTimeLineExit,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelTimeLineExit.refresh()
        return exitTimeLineToolNode
    }
    
    static func getTimeLinePage2ExitModeToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage2ExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage2ExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelTimeLinePage2Exit = MagicalExitModeViewModelTimeLinePage2Exit(orientation: orientation,
                                                                                   modeChangeConfiguration: configuration)
        let exitTimeLinePage2ToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .exitModeTimeLinePage2,
                                                 flex: flex,
                                                 magicalViewModel: viewModelTimeLinePage2Exit,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelTimeLinePage2Exit.refresh()
        return exitTimeLinePage2ToolNode
    }
    
    
    static func getGraphPage2ExitModeToolNode(orientation: Orientation,
                                                     neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage2ExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextGraphPage2ExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelGraphPage2Exit = MagicalExitModeViewModelGraphPage2Exit(orientation: orientation,
                                                                             modeChangeConfiguration: configuration)
        let exitGraphPage2ToolNode = ToolNode(id: getToolNodeID(),
                                              element: .exitModeGraphPage2,
                                              flex: flex,
                                              magicalViewModel: viewModelGraphPage2Exit,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelGraphPage2Exit.refresh()
        return exitGraphPage2ToolNode
    }
    
    static func getAnimationContinuousPage2ExitModeToolNode(orientation: Orientation,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousPage2ExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextAnimationContinuousPage2ExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAnimationContinuousPage2Exit = MagicalExitModeViewModelAnimationContinuousPage2Exit(orientation: orientation,
                                                                                                         modeChangeConfiguration: configuration)
        let exitAnimationContinuousPage2ToolNode = ToolNode(id: getToolNodeID(),
                                                            element: .exitModeAnimationContinuousPage2,
                                                            flex: flex,
                                                            magicalViewModel: viewModelAnimationContinuousPage2Exit,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        viewModelAnimationContinuousPage2Exit.refresh()
        return exitAnimationContinuousPage2ToolNode
    }
    
    static func getVideoRecordExitModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoRecordExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsB
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelVideoRecordExit = MagicalExitModeViewModelVideoRecordExit(orientation: orientation,
                                                                               modeChangeConfiguration: configuration)
        let exitVideoRecordToolNode = ToolNode(id: getToolNodeID(),
                                               element: .exitModeVideoRecord,
                                               flex: flex,
                                               magicalViewModel: viewModelVideoRecordExit,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelVideoRecordExit.refresh()
        return exitVideoRecordToolNode
    }
    
    static func getVideoExportExitModeToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextVideoExportExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelVideoExportExit = MagicalExitModeViewModelVideoExportExit(orientation: orientation,
                                                                               modeChangeConfiguration: configuration)
        let exitVideoExportToolNode = ToolNode(id: getToolNodeID(),
                                               element: .exitModeVideoExport,
                                               flex: flex,
                                               magicalViewModel: viewModelVideoExportExit,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelVideoExportExit.refresh()
        return exitVideoExportToolNode
    }
    
    static func getZoomExitModeToolNode(orientation: Orientation,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextZoomExitLine1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextZoomExitLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let accentPack = FramedLongIconLibrary.pointsA
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomExit = MagicalExitModeViewModelZoomExit(orientation: orientation,
                                                                 modeChangeConfiguration: configuration)
        let exitZoomToolNode = ToolNode(id: getToolNodeID(),
                                        element: .exitModeZoom,
                                        flex: flex,
                                        magicalViewModel: viewModelZoomExit,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelZoomExit.refresh()
        return exitZoomToolNode
    }
    
    static func getLoopsPage1ExitModeToolNode(orientation: Orientation,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage3Line2()
        let iconPack = FramedConvertibleIconLibrary.testArrowLeft
        let accentPack = FramedLongIconLibrary.testArrowRight
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage1Exit = MagicalExitModeViewModelLoopsPage1Exit(orientation: orientation,
                                                                             modeChangeConfiguration: configuration)
        let exitLoopsPage2ToolNode = ToolNode(id: getToolNodeID(),
                                              element: .exitModeLoopsPage1,
                                              flex: flex,
                                              magicalViewModel: viewModelLoopsPage1Exit,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage1Exit.refresh()
        return exitLoopsPage2ToolNode
    }
    
    static func getLoopsPage2ExitModeToolNode(orientation: Orientation,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage1Line2()
        let iconPack = FramedConvertibleIconLibrary.testArrowLeft
        let accentPack = FramedLongIconLibrary.testArrowRight
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage2Exit = MagicalExitModeViewModelLoopsPage2Exit(orientation: orientation,
                                                                             modeChangeConfiguration: configuration)
        let exitLoopsPage2ToolNode = ToolNode(id: getToolNodeID(),
                                              element: .exitModeLoopsPage2,
                                              flex: flex,
                                              magicalViewModel: viewModelLoopsPage2Exit,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage2Exit.refresh()
        return exitLoopsPage2ToolNode
    }
    
    static func getLoopsPage3ExitModeToolNode(orientation: Orientation,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextLoopsPage2Line2()
        let iconPack = FramedConvertibleIconLibrary.guides
        let accentPack = FramedLongIconLibrary.guides
        
        let configuration = ToolInterfaceElementChangeModeConfiguration(iconPack: iconPack,
                                                                        accentPack: accentPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        
        let flex = Self.getExitModeFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        
        let viewModelLoopsPage3Exit = MagicalExitModeViewModelLoopsPage3Exit(orientation: orientation,
                                                                             modeChangeConfiguration: configuration)
        let exitLoopsPage3ToolNode = ToolNode(id: getToolNodeID(),
                                              element: .exitModeLoopsPage3,
                                              flex: flex,
                                              magicalViewModel: viewModelLoopsPage3Exit,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelLoopsPage3Exit.refresh()
        return exitLoopsPage3ToolNode
    }
}
