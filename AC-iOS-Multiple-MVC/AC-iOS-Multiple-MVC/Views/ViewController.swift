//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Anthony Gonzalez on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalDescription: UITextView!
    
    var zooAnimal: ZooAnimal!
    
    override func viewDidLoad() {
        animalDescription.text = zooAnimal.info
        animalImage.image = zooAnimal.getImage()
        animalName.text = zooAnimal.name
        super.viewDidLoad()
    }
    
    
   
}
