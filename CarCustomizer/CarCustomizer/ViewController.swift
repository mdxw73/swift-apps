//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Zack Obied on 11/01/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet weak var carStatistics: UILabel!
    @IBOutlet var transmissionPackage: UISwitch!
    @IBOutlet var remainingFundsDisplay: UILabel!
    
    var remainingFunds = 0 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
        }
    }
    var starterCars = StarterCars()
    var currentCarIndex = 0
    var car: Car? {
        didSet {
            carStatistics.text = car?.displayStats()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[currentCarIndex]
        remainingFunds = 1000
    }
    
    @IBAction func nextCar(_ sender: Any) {
        currentCarIndex += 1
        if currentCarIndex >= starterCars.cars.count {
            currentCarIndex = 0
        }
        car = starterCars.cars[currentCarIndex]
        
        engineAndExhaustPackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        transmissionPackage.setOn(false, animated: true)
        remainingFunds = 1000
        checkPurchase()
    }
    
    @IBAction func engineAndExhaustPackageToggle(_ sender: Any) {
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
        checkPurchase()
    }
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 1
            remainingFunds -= 500
        } else {
            car?.handling -= 1
            remainingFunds += 500
        }
        checkPurchase()
    }
    @IBAction func transmissionPackageToggle(_ sender: Any) {
        if transmissionPackage.isOn {
            car?.acceleration -= 2.5
            remainingFunds -= 1000
        } else {
            car?.acceleration += 2.5
            remainingFunds += 1000
        }
        checkPurchase()
    }
    
    func checkPurchase() {
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
    
}

