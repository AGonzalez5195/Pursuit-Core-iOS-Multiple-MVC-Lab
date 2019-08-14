//
//  ZooTableViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Anthony Gonzalez on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class ZooTableViewController: UITableViewController {
    
    let animals = ZooAnimal.allAnimals
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals[section].count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSectionAnimal = animals[indexPath.section]
        let animal = currentSectionAnimal[indexPath.row]
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? ZooTableViewCell {
            cell.animalNameLabel.text = animal.name
            cell.animalLocationLabel.text = animal.origin
            cell.animalImage.image = animal.getImage()
            return cell
        }
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Mammals"
        case 1:
            return "Reptiles"
        case 2:
            return "Insects"
        case 3:
            return "Birds"
        default:
            return ""
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { return 130}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let segueIdentifer = segue.identifier else {fatalError("No indentifier in segue")}
        
        switch segueIdentifer {
            
        case "segueToDetail":
            guard let destVC = segue.destination as? ViewController else {
                fatalError("Unexpected segue VC")
            }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else {fatalError("No row selected")
            }
            let currentAnimal = animals[selectedIndexPath.section][selectedIndexPath.row]
            destVC.zooAnimal = currentAnimal
            
        default:
            fatalError("unexpected segue identifies")
            
        }
    }
}
