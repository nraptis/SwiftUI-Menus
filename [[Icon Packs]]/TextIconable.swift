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
