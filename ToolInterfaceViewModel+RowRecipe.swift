//
//  ToolInterfaceViewModel+RowBluePrints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/18/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe(slot: ToolRowSlot,
                                 configuration: any InterfaceConfigurationConforming,
                                 orientation: Orientation) -> RowRecipe {
        
        switch slot {
        case .top_Primary:
            return getRowRecipe_Top_Primary(configuration: configuration, orientation: orientation)
        case .top_Secondary1:
            return getRowRecipe_Top_Secondary(configuration: configuration, orientation: orientation)
        case .top_Secondary2:
            return getRowRecipe_Top_Tertiary(configuration: configuration, orientation: orientation)
        case .bottom_Secondary2:
            return getRowRecipe_Bottom_Tertiary(configuration: configuration, orientation: orientation)
        case .bottom_Secondary1:
            return getRowRecipe_Bottom_Secondary(configuration: configuration, orientation: orientation)
            
            
        case .video_record_1:
            return getRowRecipe_Top_VideoRecord_Primary(orientation: orientation)
        case .video_record_2:
            return getRowRecipe_Top_VideoRecord_Secondary(orientation: orientation)
        case .video_record_3:
            return getRowRecipe_Top_VideoRecord_Tertiary(orientation: orientation)
        case .video_record_4:
            return getRowRecipe_Bottom_VideoRecord_Tertiary(orientation: orientation)
        case .video_record_5:
            return getRowRecipe_Bottom_VideoRecord_Secondary(orientation: orientation)
        case .video_record_6:
            return getRowRecipe_Bottom_VideoRecord_Primary(orientation: orientation)
            
        case .video_export_1:
            return getRowRecipe_Top_VideoExport_Primary(orientation: orientation)
        case .video_export_2:
            return getRowRecipe_Top_VideoExport_Secondary(orientation: orientation)
        case .video_export_3:
            return getRowRecipe_Top_VideoExport_Tertiary(orientation: orientation)
        case .video_export_4:
            return getRowRecipe_Bottom_VideoExport_Tertiary(orientation: orientation)
        case .video_export_5:
            return getRowRecipe_Bottom_VideoExport_Secondary(orientation: orientation)
        case .video_export_6:
            return getRowRecipe_Bottom_VideoExport_Primary(orientation: orientation)
            
        case .zoom_1:
            return getRowRecipe_Top_Zoom_Primary(orientation: orientation)
        case .zoom_2:
            return getRowRecipe_Top_Zoom_Secondary(orientation: orientation)
        case .zoom_3:
            return getRowRecipe_Top_Zoom_Tertiary(orientation: orientation)
        case .zoom_4:
            return getRowRecipe_Bottom_Zoom_Tertiary(orientation: orientation)
        case .zoom_5:
            return getRowRecipe_Bottom_Zoom_Secondary(orientation: orientation)
        case .zoom_6:
            return getRowRecipe_Bottom_Zoom_Primary(orientation: orientation)
            
        case .top_Test_1:
            return getRowRecipe_Top_Test1(configuration: configuration, orientation: orientation)
        case .top_Test_2:
            return getRowRecipe_Top_Test2(configuration: configuration, orientation: orientation)
        case .top_Test_3:
            return getRowRecipe_Bottom_Primary(configuration: configuration, orientation: orientation)
        case .bottom_Test_1:
            return getRowRecipe_Bottom_Primary(configuration: configuration, orientation: orientation)
        case .bottom_Test_2:
            return getRowRecipe_Bottom_Primary(configuration: configuration, orientation: orientation)
        case .bottom_Test_3:
            return getRowRecipe_Bottom_Primary(configuration: configuration, orientation: orientation)
        case .bottom_Test_4:
            return getRowRecipe_Bottom_Primary(configuration: configuration, orientation: orientation)
        default:
            return getRowRecipe_Bottom_Primary(configuration: configuration, orientation: orientation)
        }
    }
    
    @MainActor func getRowRecipe_Top_Test1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        let inrs: [INR] = [
            .mainTab(.skainTabTest),
            .spacer,
            .segment(.animationMode)
        ]
        return RowRecipe(inrs: inrs)
    }
    @MainActor func getRowRecipe_Top_Test2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        let inrs: [INR] = [
            .checkBox(.gyroscopeEnabled),
            .mainTab(.documentMode),
            .spacer,
            .mainTab(.jainTabTest)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Top_Primary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Top_Primary(configuration)
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Top_Primary(configuration)
            } else {
                return getRowRecipe_Pad_Top_Primary(configuration)
            }
        }
    }
    
    @MainActor func getRowRecipe_Top_Secondary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Top_Secondary(configuration)
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Top_Secondary(configuration)
            } else {
                return getRowRecipe_Pad_Top_Secondary(configuration)
            }
        }
    }
    
    @MainActor func getRowRecipe_Top_Tertiary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Top_Tertiary(configuration)
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Top_Tertiary(configuration)
            } else {
                return getRowRecipe_Pad_Top_Tertiary(configuration)
            }
        }
    }
    
    @MainActor func getRowRecipe_Bottom_Tertiary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Bottom_Tertiary(configuration)
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Bottom_Tertiary(configuration)
            } else {
                return getRowRecipe_Pad_Bottom_Tertiary(configuration)
            }
        }
    }
    
    @MainActor func getRowRecipe_Bottom_Secondary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Bottom_Secondary(configuration)
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Bottom_Secondary(configuration)
            } else {
                return getRowRecipe_Pad_Bottom_Secondary(configuration)
            }
        }
    }
    
    @MainActor func getRowRecipe_Bottom_Primary(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Bottom_Primary(configuration)
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Bottom_Primary(configuration)
            } else {
                return getRowRecipe_Pad_Bottom_Primary(configuration)
            }
        }
    }
    
    
    
    
    @MainActor func getRowRecipe_Top_Zoom_Primary(orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Zoom_Top_Primary()
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Zoom_Top_Primary()
            } else {
                return getRowRecipe_Pad_Zoom_Top_Primary()
            }
        }
    }
    
    @MainActor func getRowRecipe_Top_Zoom_Secondary(orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Zoom_Top_Secondary()
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Zoom_Top_Secondary()
            } else {
                return getRowRecipe_Pad_Zoom_Top_Secondary()
            }
        }
    }
    
    @MainActor func getRowRecipe_Top_Zoom_Tertiary(orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Zoom_Top_Tertiary()
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Zoom_Top_Tertiary()
            } else {
                return getRowRecipe_Pad_Zoom_Top_Tertiary()
            }
        }
    }
    
    @MainActor func getRowRecipe_Bottom_Zoom_Tertiary(orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Zoom_Bottom_Tertiary()
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Zoom_Bottom_Tertiary()
            } else {
                return getRowRecipe_Pad_Zoom_Bottom_Tertiary()
            }
        }
    }
    
    @MainActor func getRowRecipe_Bottom_Zoom_Secondary(orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Zoom_Bottom_Secondary()
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Zoom_Bottom_Secondary()
            } else {
                return getRowRecipe_Pad_Zoom_Bottom_Secondary()
            }
        }
    }
    
    @MainActor func getRowRecipe_Bottom_Zoom_Primary(orientation: Orientation) -> RowRecipe {
        if Device.isPad {
            return getRowRecipe_Pad_Zoom_Bottom_Primary()
            
        } else {
            if orientation.isPortrait {
                return getRowRecipe_Pad_Zoom_Bottom_Primary()
                
            } else {
                return getRowRecipe_Pad_Zoom_Bottom_Primary()
                
            }
        }
    }
    
    
    
    @MainActor func getRowRecipe_Top_VideoRecord_Primary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoRecord_Top_Primary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoRecord_Top_Primary()
                } else {
                    return getRowRecipe_Pad_VideoRecord_Top_Primary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Top_VideoRecord_Secondary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoRecord_Top_Secondary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoRecord_Top_Secondary()
                } else {
                    return getRowRecipe_Pad_VideoRecord_Top_Secondary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Top_VideoRecord_Tertiary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoRecord_Top_Tertiary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoRecord_Top_Tertiary()
                } else {
                    return getRowRecipe_Pad_VideoRecord_Top_Tertiary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Bottom_VideoRecord_Tertiary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoRecord_Bottom_Tertiary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoRecord_Bottom_Tertiary()
                } else {
                    return getRowRecipe_Pad_VideoRecord_Bottom_Tertiary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Bottom_VideoRecord_Secondary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoRecord_Bottom_Secondary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoRecord_Bottom_Secondary()
                } else {
                    return getRowRecipe_Pad_VideoRecord_Bottom_Secondary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Bottom_VideoRecord_Primary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoRecord_Bottom_Primary()
                
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoRecord_Bottom_Primary()
                    
                } else {
                    return getRowRecipe_Pad_VideoRecord_Bottom_Primary()
                    
                }
            }
        }
    
    
    @MainActor func getRowRecipe_Top_VideoExport_Primary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoExport_Top_Primary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoExport_Top_Primary()
                } else {
                    return getRowRecipe_Pad_VideoExport_Top_Primary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Top_VideoExport_Secondary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoExport_Top_Secondary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoExport_Top_Secondary()
                } else {
                    return getRowRecipe_Pad_VideoExport_Top_Secondary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Top_VideoExport_Tertiary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoExport_Top_Tertiary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoExport_Top_Tertiary()
                } else {
                    return getRowRecipe_Pad_VideoExport_Top_Tertiary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Bottom_VideoExport_Tertiary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoExport_Bottom_Tertiary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoExport_Bottom_Tertiary()
                } else {
                    return getRowRecipe_Pad_VideoExport_Bottom_Tertiary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Bottom_VideoExport_Secondary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoExport_Bottom_Secondary()
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoExport_Bottom_Secondary()
                } else {
                    return getRowRecipe_Pad_VideoExport_Bottom_Secondary()
                }
            }
        }
        
        @MainActor func getRowRecipe_Bottom_VideoExport_Primary(orientation: Orientation) -> RowRecipe {
            if Device.isPad {
                return getRowRecipe_Pad_VideoExport_Bottom_Primary()
                
            } else {
                if orientation.isPortrait {
                    return getRowRecipe_Pad_VideoExport_Bottom_Primary()
                    
                } else {
                    return getRowRecipe_Pad_VideoExport_Bottom_Primary()
                    
                }
            }
        }
    
    
    /*
    @MainActor func getRowBluePrint_Bottom_Primary(orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Primary_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Primary_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Secondary1_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Secondary1_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Bottom_Secondary2_Pad(configuration)
        } else {
            return getRowBluePrint_Bottom_Secondary2_Pad(configuration)
        }
    }
    
    @MainActor func getRowBluePrint_VideoRecord1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoRecord1_Pad()
        } else {
            return getRowBluePrint_VideoRecord1_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoRecord2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoRecord2_Pad()
        } else {
            return getRowBluePrint_VideoRecord2_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport1_Pad()
        } else {
            return getRowBluePrint_VideoExport1_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport2_Pad()
        } else {
            return getRowBluePrint_VideoExport2_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_VideoExport3_Pad()
        } else {
            return getRowBluePrint_VideoExport3_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_VideoExport4(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        return nil
    }
    
    @MainActor func getRowBluePrint_Zoom1(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom1_Pad()
        } else {
            return getRowBluePrint_Zoom1_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_Zoom2(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom2_Pad()
        } else {
            return getRowBluePrint_Zoom2_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_Zoom3(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        if Device.isPad {
            return getRowBluePrint_Zoom3_Pad()
        } else {
            return getRowBluePrint_Zoom3_Pad()
        }
    }
    
    @MainActor func getRowBluePrint_Zoom4(configuration: any InterfaceConfigurationConforming, orientation: Orientation) -> RowBluePrint? {
        return nil
    }
    */
    
    /*
     func adaptAllRows() {
     
     toolConfigurationIdiomPrevious = toolConfigurationIdiomCurrent
     toolConfigurationIdiomCurrent = calculateToolConfigurationIdiom()
     
     let isReversed = getIsReversed(fromIdiom: toolConfigurationIdiomPrevious,
     toIdiom: toolConfigurationIdiomCurrent)
     
     if Device.isPad {
     adaptAllRowsPad(isReversed: isReversed)
     } else {
     adaptAllRowsPhone(isReversed: isReversed)
     }
     }
     
     func getIsReversed(fromIdiom: ToolConfigurationIdiom, toIdiom: ToolConfigurationIdiom) -> Bool {
     return Bool.random()
     }
     
     func adaptAllRowsPad(isReversed: Bool) {
     
     
     //isGraphSupported
     
     
     updateRow(slot: .top_Primary,
     rowBluePrint: getRowBluePrint_Top_Primary_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: false,
     reversed: isReversed)
     updateRow(slot: .top_Secondary1,
     rowBluePrint: getRowBluePrint_Top_Secondary1_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
     reversed: isReversed)
     updateRow(slot: .top_Secondary2,
     rowBluePrint: getRowBluePrint_Top_Secondary2_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
     reversed: isReversed)
     
     updateRow(slot: .bottom_Secondary2,
     rowBluePrint: getRowBluePrint_Bottom_Secondary2_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
     reversed: isReversed)
     updateRow(slot: .bottom_Secondary1,
     rowBluePrint: getRowBluePrint_Bottom_Secondary1_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
     reversed: isReversed)
     updateRow(slot: .bottom_Primary,
     rowBluePrint: getRowBluePrint_Bottom_Primary_Pad(toolConfigurationIdiom: toolConfigurationIdiomCurrent), animated: true,
     reversed: isReversed)
     
     }
     
     func adaptAllRowsPhone(isReversed: Bool) {
     
     }
     */
    
}
