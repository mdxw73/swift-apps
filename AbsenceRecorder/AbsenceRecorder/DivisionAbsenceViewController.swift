//
//  DivisionAbsenceViewController.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 02/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {
    
    var division: Division?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = division?.code
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.students.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division?.students[indexPath.row].surname
        return cell
    }

}
