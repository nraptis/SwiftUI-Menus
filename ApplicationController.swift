//
//  ApplicationController.swift
//  Jiggle III
//
//  Created by Nicky Taylor on 11/8/23.
//

import Foundation
import Metal

final class ApplicationController {
    
    
    static let blankTextIconPack = BlankTextIconPack()
    
    static let FORCE_LONG_ALL = false
    static let FORCE_STACKED_ALL = false
    static let FORCE_1_LINE_ALL = false
    static let FORCE_2_LINE_ALL = false
    
    static let FORCE_CAPS = false
    
    static let DEBUG_REMEMBER_ZOOM_FRAME = false
    
    static let DEBUG_DEALLOCS = false
    
    static let TEST_ROW_TOP_1 = false
    static let TEST_ROW_BOTTOM_1 = false
    
    static let TEST_ROW_TOP_2 = false
    static let TEST_ROW_BOTTOM_2 = false
    
    static let TEST_ROW_TOP_3 = false
    static let TEST_ROW_BOTTOM_3 = false
    
    static let TEST_ROW_BOTTOM_4 = false
    
    //static let mainRingSelectedLineThickness = Float(Device.isPad ? 2.25 : 1.5)
    //static let mainRingSelectedStrokeThickness = Float(Device.isPad ? 2.75 : 2.0)
    //static let mainRingUnselectedLineThickness = Float(Device.isPad ? 2.0 : 1.25)
    //static let mainRingUnselectedStrokeThickness = Float(Device.isPad ? 2.5 : 1.75)
    
    @MainActor static let mainRingSelectedLineThickness = Float(Device.isPad ? 1.5 : 1.5)
    @MainActor static let mainRingSelectedStrokeThickness = Float(Device.isPad ? 2.5 : 2.5)
    @MainActor static let mainRingUnselectedLineThickness = Float(Device.isPad ? 1.25 : 1.25)
    @MainActor static let mainRingUnselectedStrokeThickness = Float(Device.isPad ? 2.25 : 2.25)
    
    
    @MainActor static let drawLineThickness = mainRingSelectedLineThickness
    @MainActor static let drawStrokeLineThickness = mainRingSelectedStrokeThickness
    
    //static let weightTanLineThickness = Float(2.0)
    //static let weightTanStrokeLineThickness = Float(3.0)
    
    weak var jiggleViewModel: JiggleViewModel?
    weak var toolInterfaceViewModel: ToolInterfaceViewModel?
    weak var jiggleViewController: JiggleViewController?
    weak var jiggleDocument: JiggleDocument?
    
    weak var mainMenuViewController: MainMenuViewController?
    
    weak var imageImportViewModel: ImageImportViewModel?
    weak var imageImportViewController: ImageImportViewController?
    
    weak var loadSceneViewModel: LoadSceneViewModel?
    weak var loadSceneViewController: LoadSceneViewController?
    
    
    @MainActor var dialogBoxViews: [DialogBoxView] {
        var result = [DialogBoxView]()
        if let rootViewController = Self.rootViewController {
            if let dialogBoxStackContainerView = rootViewController.dialogBoxStackContainerView {
                for dialogBoxView in dialogBoxStackContainerView.dialogBoxViews {
                    result.append(dialogBoxView)
                }
            }
        }
        return result
    }
    
    
    //nonisolated(unsafe)
    @MainActor static let shared = ApplicationController()
    
    @MainActor private init() {
        
        configLoad()
        ToolInterfaceElementTable.build()
        
    }
    
    //@MainActor
    nonisolated(unsafe) static var isDarkModeEnabled = false
    nonisolated(unsafe) static var isPurchased = false
    
    static let jiggleOpacityMin = Float(0.0)
    static let jiggleOpacityMax = Float(100.0)
    nonisolated(unsafe) static var jiggleOpacity = Float(60.0)
    
    //@MainActor
    @MainActor static var rootViewModel: RootViewModel?
    @MainActor static var rootViewController: RootViewController?
    @MainActor static let device = Device()
    
    @MainActor static var widthPortrait: Float { device.widthPortrait }
    @MainActor static var heightPortrait: Float { device.heightPortrait }
    @MainActor static var widthLandscape: Float { device.widthLandscape }
    @MainActor static var heightLandscape: Float { device.heightLandscape }
    
    @MainActor static var widthPortraitScaled: Float { device.widthPortraitScaled }
    @MainActor static var heightPortraitScaled: Float { device.heightPortraitScaled }
    @MainActor static var widthLandscapeScaled: Float { device.widthLandscapeScaled }
    @MainActor static var heightLandscapeScaled: Float { device.heightLandscapeScaled }
    
    nonisolated(unsafe) static var accelerometerX = Float(0.0)
    nonisolated(unsafe) static var accelerometerY = Float(0.0)
    nonisolated(unsafe) static var accelerometerZ = Float(0.0)
    
    nonisolated(unsafe) static var gyroDirectionX = Float(0.0)
    nonisolated(unsafe) static var gyroDirectionY = Float(0.0)
    
    func wake() {
        print("Awake!")
    }
    
    static let gyroHistorySize: Int = 12
    nonisolated(unsafe) static var gyroHistoryJerkX = [Float](repeating: 0.0, count: gyroHistorySize)
    nonisolated(unsafe) static var gyroHistoryJerkY = [Float](repeating: 0.0, count: gyroHistorySize)
    nonisolated(unsafe) static var gyroHistoryFactor: [Float] = [0.026, 0.029, 0.035, // 0.09
                                             0.042, 0.0430, 0.065, // 0.15
                                             0.075, 0.085, 0.10, // 0.26
                                             0.135, 0.165, 0.2] // 0.5
    nonisolated(unsafe) static var gyroSmoothX = Float(0.0)
    nonisolated(unsafe) static var gyroSmoothY = Float(0.0)
    
    
    static func recordGyroDirectionHistory(jerkX: Float, jerkY: Float) {
        //
        for historyIndex in 1..<gyroHistorySize {
            gyroHistoryJerkX[historyIndex - 1] = gyroHistoryJerkX[historyIndex]
            gyroHistoryJerkY[historyIndex - 1] = gyroHistoryJerkY[historyIndex]
        }
        //
        gyroHistoryJerkX[gyroHistorySize - 1] = jerkX
        gyroHistoryJerkY[gyroHistorySize - 1] = jerkY
        //
        
        var _gyroSmoothX = Float(0.0)
        var _gyroSmoothY = Float(0.0)
        for historyIndex in 0..<gyroHistorySize {
            let factor = gyroHistoryFactor[historyIndex]
            _gyroSmoothX += gyroHistoryJerkX[historyIndex] * factor
            _gyroSmoothY += gyroHistoryJerkY[historyIndex] * factor
        }
        Self.gyroSmoothX = _gyroSmoothX
        Self.gyroSmoothY = _gyroSmoothY
    }
    
    private var configFilePath: String {
        FileUtils.shared.getDocumentPath(fileName: "config.cgf")
    }
    
    @MainActor func configLoad() {
        let fileBuffer = FileBuffer()
        fileBuffer.load(filePath: configFilePath)
        configLoad(fileBuffer: fileBuffer)
    }
    
    @MainActor func configSave() {
        let fileBuffer = FileBuffer()
        configSave(fileBuffer: fileBuffer)
        _ = fileBuffer.save(filePath: configFilePath)
    }
    
    @MainActor func configLoad(fileBuffer: FileBuffer) {
        Self.isDarkModeEnabled = fileBuffer.readBool() ?? false
        Self.isPurchased = fileBuffer.readBool() ?? false
        Self.jiggleOpacity = fileBuffer.readFloat32() ?? Float(60.0)
    }
    
    @MainActor func configSave(fileBuffer: FileBuffer) {
        fileBuffer.writeBool(Self.isDarkModeEnabled)
        fileBuffer.writeBool(Self.isPurchased)
        fileBuffer.writeFloat32(Float(Self.jiggleOpacity))
        
    }
    
}
