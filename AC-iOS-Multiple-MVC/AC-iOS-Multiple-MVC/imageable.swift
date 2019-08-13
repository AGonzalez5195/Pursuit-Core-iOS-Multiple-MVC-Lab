//
//  imageable.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Anthony Gonzalez on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import Foundation
import UIKit

protocol Imageable {
    var imageName: String {get}
    func getImage() -> UIImage
}
