//
//  TextIconable.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import UIKit

protocol TextIconable {
    var fileName: String { get }
    var width: Int { get }
    var height: Int { get }
    var device: TextIconDevice { get }
    var orientation: Orientation? { get }
    func getImage() -> UIImage
}

struct BlankTextIcon: TextIconable {
    let fileName = ""
    let width = 0
    let height = 0
    let device = TextIconDevice.phone
    let orientation: Orientation? = nil
    let image = UIImage()
    func getImage() -> UIImage { return image }
}
