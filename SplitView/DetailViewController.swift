//
//  DetailViewController.swift
//  SplitView
//
//  Created by Toan on 12/7/18.
//  Copyright © 2018 Toan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageLabel: UIImageView!
    @IBOutlet weak var weaponImageView: UIImageView!
    
    var monster: Monster? {
        didSet {
            refreshUI()
        }
    }
    func refreshUI() {
        loadViewIfNeeded()
        //
        nameLabel.text = monster?.name
        descriptionLabel.text = monster?.description
        iconImageLabel.image = monster?.icon
        weaponImageView.image = monster?.weaponImage
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
}
extension DetailViewController: MonsterSelectionDelegate {
    func monsterSelected(_ newMonster: Monster) {
        monster = newMonster
    }
}
