//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        for division in divisions {
            print(division.code, division.students.count)
            for student in division.students {
                print(student.forename, student.surname)
            }
        }
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        cell.textLabel?.text = divisions[indexPath.row].code
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController") as? DivisionAbsenceViewController else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        vc.division = divisions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "XC-1", of: 5))
        divisions.append(DivisionFactory.createDivision(code: "DV-1", of: 10))
    }

}
