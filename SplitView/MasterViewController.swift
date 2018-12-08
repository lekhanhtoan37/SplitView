//
//  MasterViewController.swift
//  SplitView
//
//  Created by Toan on 12/7/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit
protocol MonsterSelectionDelegate: class {
    func monsterSelected(_ newMonster: Monster)
}
class MasterViewController: UITableViewController {
    weak var delegate: MonsterSelectionDelegate?
    
    
    let monsters = [
    Monster(name: "Cat-Bot", description: "MEE-OW",
            iconName: "meetcatbot", weapon: .sword),
    Monster(name: "Dog-Bot", description: "BOW-WOW",
            iconName: "meetdogbot", weapon: .blowgun),
    Monster(name: "Explode-Bot", description: "BOOM!",
            iconName: "meetexplodebot", weapon: .smoke),
    Monster(name: "Fire-Bot", description: "Will Make You Steamed",
            iconName: "meetfirebot", weapon: .ninjaStar),
    Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
            iconName: "meeticebot", weapon: .fire),
    Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
            iconName: "meetminitomatobot", weapon: .ninjaStar)
    ]
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = monsters[indexPath.row].name
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = monsters[indexPath.row]
        delegate?.monsterSelected(selectedMonster)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
            }
        
    }

   

}
