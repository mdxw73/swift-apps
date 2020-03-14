//
//  DishesTableViewController.swift
//  MachineLearning
//
//  Created by Zack Obied on 14/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class DishesTableViewController: UITableViewController {
    
    var meals: [String]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Dish", for: indexPath)
        cell.textLabel?.text = meals?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recommended Dishes"
    }

}
