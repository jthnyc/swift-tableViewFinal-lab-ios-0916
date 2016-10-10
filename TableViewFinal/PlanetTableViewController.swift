//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    let planetCellIdentifier = "PlanetCell"
    
    var planets: [Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    func generatePlanetInfo() {
       let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."])
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."])
        
        planets = [earth, mars]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == planetCellIdentifier {
            let destinationViewController = segue.destination as! FactTableViewController
            
            let selectedPlanet = self.tableView.indexPathForSelectedRow?.row
            
            if let unwrappedRow = selectedPlanet {
                destinationViewController.planet = self.planets[unwrappedRow]
            
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: planetCellIdentifier, for: indexPath) as! PlanetTableViewCell
        
        cell.planetNameLabel.text = self.planets[indexPath.row].name
        if self.planets[indexPath.row].numberOfMoons > 1 {
            cell.numberOfMoonsLabel.text = String(self.planets[indexPath.row].numberOfMoons)+" Moons"
        } else {
            cell.numberOfMoonsLabel.text = String(self.planets[indexPath.row].numberOfMoons)+" Moon"
        }
        
        cell.numberOfDaysFullOrbitLabel.text = String(self.planets[indexPath.row].fullOrbit)+" days"+" (full orbit)"
        cell.numberOfFacts.text = String(self.planets[indexPath.row].facts.count)+" facts"
        
        return cell
        
    }
    
    
}
