//
//  ZooTableViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Anthony Gonzalez on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class ZooTableViewController: UITableViewController {
    
    let zooAnimals = ZooAnimal.zooAnimals
    
    let mammals = ZooAnimal.Mammal
    let insects = ZooAnimal.Insect
    let birds = ZooAnimal.Bird
    let reptiles = ZooAnimal.Reptile
    let amphibians = ZooAnimal.Amphibian
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0: return mammals.count
        case 1: return insects.count
        case 2: return birds.count
        case 3: return reptiles.count
        case 4: return amphibians.count
        default: return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? ZooTableViewCell {
            switch indexPath.section {
            case 0:
                cell.animalNameLabel.text = mammals[indexPath.row].name
                cell.animalLocationLabel.text = mammals[indexPath.row].origin
                cell.animalImage.image = mammals[indexPath.row].getImage()
            case 1:
                cell.animalNameLabel.text = insects[indexPath.row].name
                cell.animalLocationLabel.text = insects[indexPath.row].origin
                cell.animalImage.image = insects[indexPath.row].getImage()
            case 2:
                cell.animalNameLabel.text = birds[indexPath.row].name
                cell.animalLocationLabel.text = birds[indexPath.row].origin
                cell.animalImage.image = birds[indexPath.row].getImage()
            case 3:
                cell.animalNameLabel.text = reptiles[indexPath.row].name
                cell.animalLocationLabel.text = reptiles[indexPath.row].origin
                cell.animalImage.image = reptiles[indexPath.row].getImage()
            case 4:
                cell.animalNameLabel.text = amphibians[indexPath.row].name
                cell.animalLocationLabel.text = amphibians[indexPath.row].origin
                cell.animalImage.image = amphibians[indexPath.row].getImage()
                
            default: break
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "Mammals"
        case 1:
            return "Insects"
        case 2:
            return "Birds"
        case 3:
            return "Reptiles"
        case 4:
            return "Amphibians"
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
            
            switch selectedIndexPath.section {
            case 0: destVC.zooAnimal = mammals[selectedIndexPath.row]
            case 1: destVC.zooAnimal = insects[selectedIndexPath.row]
            case 2: destVC.zooAnimal = birds[selectedIndexPath.row]
            case 3: destVC.zooAnimal = reptiles[selectedIndexPath.row]
            case 4: destVC.zooAnimal = amphibians[selectedIndexPath.row]
            default:()
                
            }
            
        default:
            fatalError("unexpected segue identifies")
            
        }
    }
}
