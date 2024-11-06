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
    
    static func getTimeLinePage1ExitModeToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage3Line2()
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
        
        let viewModelTimeLinePage1Exit = MagicalExitModeViewModelTimeLinePage1Exit(orientation: orientation,
                                                                                   modeChangeConfiguration: configuration)
        let exitTimeLinePage2ToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .exitModeTimeLinePage1,
                                                 flex: flex,
                                                 magicalViewModel: viewModelTimeLinePage1Exit,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelTimeLinePage1Exit.refresh()
        return exitTimeLinePage2ToolNode
    }
    
    static func getTimeLinePage2ExitModeToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage1Line2()
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
    
    static func getTimeLinePage3ExitModeToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextTimeLinePage2Line2()
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
        
        let viewModelTimeLinePage3Exit = MagicalExitModeViewModelTimeLinePage3Exit(orientation: orientation,
                                                                                   modeChangeConfiguration: configuration)
        let exitTimeLinePage3ToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .exitModeTimeLinePage3,
                                                 flex: flex,
                                                 magicalViewModel: viewModelTimeLinePage3Exit,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelTimeLinePage3Exit.refresh()
        return exitTimeLinePage3ToolNode
    }
    
    static func getContinuousPage1ExitModeToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage3Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage3Line2()
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
        
        let viewModelContinuousPage1Exit = MagicalExitModeViewModelContinuousPage1Exit(orientation: orientation,
                                                                                       modeChangeConfiguration: configuration)
        let exitContinuousPage2ToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .exitModeContinuousPage1,
                                                   flex: flex,
                                                   magicalViewModel: viewModelContinuousPage1Exit,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelContinuousPage1Exit.refresh()
        return exitContinuousPage2ToolNode
    }
    
    static func getContinuousPage2ExitModeToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage1Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage1Line2()
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
        
        let viewModelContinuousPage2Exit = MagicalExitModeViewModelContinuousPage2Exit(orientation: orientation,
                                                                                       modeChangeConfiguration: configuration)
        let exitContinuousPage2ToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .exitModeContinuousPage2,
                                                   flex: flex,
                                                   magicalViewModel: viewModelContinuousPage2Exit,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelContinuousPage2Exit.refresh()
        return exitContinuousPage2ToolNode
    }
    
    static func getContinuousPage3ExitModeToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage2Line1()
        let textLine2 = ToolInterfaceStringLibraryModeChange.modeTextContinuousPage2Line2()
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
        
        let viewModelContinuousPage3Exit = MagicalExitModeViewModelContinuousPage3Exit(orientation: orientation,
                                                                                       modeChangeConfiguration: configuration)
        let exitContinuousPage3ToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .exitModeContinuousPage3,
                                                   flex: flex,
                                                   magicalViewModel: viewModelContinuousPage3Exit,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelContinuousPage3Exit.refresh()
        return exitContinuousPage3ToolNode
    }
    
}
