//
//  FactTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FactTableViewController: UITableViewController {
    
    let factCellIdentifier = "FactCell"
    
    var planet: Planet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = planet.name
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planet.facts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: factCellIdentifier, for: indexPath) as! FactTableViewCell
        
        if self.planet.name == "Earth" {
            cell.factTextView.text = self.planet.facts[indexPath.row]
        } else {
            cell.factTextView.text = self.planet.facts[indexPath.row]
        }
        
        return cell
    }

    
}
