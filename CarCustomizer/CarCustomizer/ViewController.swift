//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Zack Obied on 11/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var submitCar: UIButton!
    @IBOutlet var nextCar: UIButton!
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var transmissionPackage: UISwitch!
    @IBOutlet weak var carStatistics: UILabel!
    @IBOutlet var remainingFundsDisplay: UILabel!
    @IBOutlet var remainingTimeDisplay: UILabel!
    
    var remainingTime = 0 {
        didSet {
            remainingTimeDisplay.text = "\(remainingTime)"
        }
    }
    var remainingFunds = 0 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
            disableUnaffordablePackages()
        }
    }
    var starterCars = StarterCars()
    var currentCarIndex = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[currentCarIndex]
        remainingTime = 30
        resetDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    @IBAction func nextCar(_ sender: Any) {
        currentCarIndex += 1
        if currentCarIndex >= starterCars.cars.count {
            currentCarIndex = 0
        }
        car = starterCars.cars[currentCarIndex]
        resetDisplay()
    }
    
    @IBAction func engineAndExhaustPackageToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
    }
    
    @IBAction func transmissionPackageToggle(_ sender: Any) {
        if transmissionPackage.isOn {
            car?.acceleration -= 2.5
            remainingFunds -= 1000
        } else {
            car?.acceleration += 2.5
            remainingFunds += 1000
        }
    }
    
    func disableUnaffordablePackages() {
        if remainingFunds < 500 && engineAndExhaustPackage.isOn == false {
            engineAndExhaustPackage.isEnabled = false
        } else {
            engineAndExhaustPackage.isEnabled = true
        }
        
        if remainingFunds < 500 && tiresPackage.isOn == false {
            tiresPackage.isEnabled = false
        } else {
            tiresPackage.isEnabled = true
        }
        
        if remainingFunds < 1000 && transmissionPackage.isOn == false {
            transmissionPackage.isEnabled = false
        } else {
            transmissionPackage.isEnabled = true
        }
    }
    
    func resetDisplay() {
        engineAndExhaustPackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        transmissionPackage.setOn(false, animated: true)
        remainingFunds = 1000
    }
    
    @objc func countdown() {
        if remainingTime > 0 {
            remainingTime -= 1
            remainingTimeDisplay.text = "\(remainingTime)"
        } else {
            displayAlert("Display")
        }
    }
    
    @IBAction func displayAlert(_ sender: Any) {
        timer?.invalidate()
        engineAndExhaustPackage.isEnabled = false
        tiresPackage.isEnabled = false
        transmissionPackage.isEnabled = false
        nextCar.isEnabled = false
        submitCar.isEnabled = false
        
        let alertController = UIAlertController(title: "Finished Car", message:
            "\(carStatistics.text!)\n\nFunds Spent: \(1000 - remainingFunds)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Continue", style: .default))

        self.present(alertController, animated: true, completion: nil)
    }
    
}

