//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by Zack Obied on 28/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        self.tableView(tableView, didSelectRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        let selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        
        if divisions[indexPath.row].getAbsence(for: currentDate) != nil {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDivision = divisions[indexPath.row]
        var absence = Absence(date: currentDate, present: selectedDivision.students)
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load Division Absence View Controller from Storyboard")
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            if let absence = division.getAbsence(for: self.currentDate) {
                absence.present = division.students
            } else {
                let absence = Absence(date: self.currentDate, present: division.students)
                division.absences.append(absence)
            }
            tableView.reloadData()
            completionHandler(true)
        }
        allPresent.backgroundColor = UIColor.blue
        return UISwipeActionsConfiguration(actions: [allPresent])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "Clear") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            division.removeAbsence(for: self.currentDate)
            tableView.reloadData()
            completionHandler(true)
        }
        allPresent.backgroundColor = UIColor.red
        return UISwipeActionsConfiguration(actions: [allPresent])
    }
    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
        tableView.reloadData()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
        tableView.reloadData()
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
    }
    
    func convertDivisionsToJson() -> String? {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(divisions) else {
            print("Unable to encode divisions into json")
            return nil
        }
        
        guard let json = String(data: encoded, encoding: .utf8) else {
            print("Unable to turn encoded divisions into a string")
            return nil
        }
        
        return json
    }
    
    func convertJsonToDivisions(json: Data) -> [Division]? {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Division].self, from: json) else {
            return nil
        }
        
        return decoded
    }
    
    func saveDataToFile() {
        guard let divisionsJson = convertDivisionsToJson() else {
            return
        }
        
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            try divisionsJson.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Unable to save by writing to a file")
        }
    }
    
    func loadDataFromFile() {
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            let json = try Data(contentsOf: filePath)
            divisions = convertJsonToDivisions(json: json) ?? []
            if divisions.count == 0 {
                loadDummyData()
            }
        } catch {
            print("Failed to read from file")
            loadDummyData()
        }
    }
    
    func loadDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "XC-1", of: 5))
        divisions.append(DivisionFactory.createDivision(code: "DV-1", of: 10))
    }

}
