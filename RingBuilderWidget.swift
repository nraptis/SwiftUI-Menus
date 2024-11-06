//
//  RingBuilderViewModel.swift
//  Manifold
//
//  Created by Nicky Taylor on 8/3/24.
//

import Foundation
import Combine

class RingBuilderWidget {
    
    var numberOfRingsDidChangePublisher = PassthroughSubject<Void, Never>()
    var angleDidChangePublisher = PassthroughSubject<Void, Never>()
    var magnitudeDidChangePublisher = PassthroughSubject<Void, Never>()
    
    private(set) var numberOfRings = 3
    private(set) var angle = Float(0.0)
    private(set) var magnitude = Float(0.0)
    
    init() {
        load()
    }
    
    func set(numberOfRings: Int) {
        var numberOfRings = numberOfRings
        if numberOfRings > RingBuilder.maximumNumberOfRings { numberOfRings = RingBuilder.maximumNumberOfRings }
        if numberOfRings < RingBuilder.minimumNumberOfRings { numberOfRings = RingBuilder.minimumNumberOfRings }
        if self.numberOfRings != numberOfRings {
            self.numberOfRings = numberOfRings
            numberOfRingsDidChangePublisher.send(())
        }
    }
    
    func set(angle: Float) {
        if self.angle != angle {
            self.angle = angle
            angleDidChangePublisher.send(())
        }
    }
    
    func set(magnitude: Float) {
        var magnitude = magnitude
        if magnitude < 0.0 { magnitude = 0.0 }
        if magnitude > 1.0 { magnitude = 1.0 }
        if self.magnitude != magnitude {
            self.magnitude = magnitude
            magnitudeDidChangePublisher.send(())
        }
    }
    
    private var saveFilePath: String {
        FileUtils.shared.getDocumentPath(fileName: "ring_builder.cfg")
    }
    
    func load() {
        if true {
            let fileBuffer = FileBuffer()
            fileBuffer.load(filePath: saveFilePath)
            load(fileBuffer: fileBuffer)
        }
    }
    
    func save() {
        if true {
            let fileBuffer = FileBuffer()
            save(fileBuffer: fileBuffer)
            _ = fileBuffer.save(filePath: saveFilePath)
        }
    }
    
    func save(fileBuffer: FileBuffer) {
        fileBuffer.writeFloat32(angle)
        fileBuffer.writeFloat32(magnitude)
        fileBuffer.writeUInt8(UInt8(numberOfRings))
    }
    
    func load(fileBuffer: FileBuffer) {
        var didLoad = false
        
        if let _angle = fileBuffer.readFloat32() {
            angle = _angle
            print("loaded angle: \(angle)")
        }
        
        if let _magnitude = fileBuffer.readFloat32() {
            magnitude = _magnitude
            print("loaded magnitude: \(magnitude)")
        }
        
        if let _numberOfRings = fileBuffer.readUInt8() {
            numberOfRings = Int(_numberOfRings)
            print("loaded numberOfRings: \(numberOfRings)")
        }
    }
}
