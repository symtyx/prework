//
//  ViewController.swift
//  Prework
//
//  Created by Mostafa Atmar on 11/26/21.
//  Copyright © 2021 Mostafa Atmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bill: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var total: UILabel!
    
    //@IBOutlet weak var appName: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
        
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var darkLabel: UILabel!
    @IBOutlet weak var darkSwitch: UISwitch!
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitNumber: UILabel!
    
    @IBOutlet weak var perPerson: UILabel!
    @IBOutlet weak var perPersonAmount: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.becomeFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        //Gets bill from text field imput
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip percentage from multipling with tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        //update total amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func darkModeFunc(_ toggle: UISwitch) {
        if toggle.isOn {
            view.backgroundColor = .darkGray
            billAmountTextField.backgroundColor = .lightGray
            tipControl.selectedSegmentTintColor = .lightGray
            totalLabel.textColor = .white
            billAmountTextField.backgroundColor = .lightGray
            tipAmountLabel.textColor = .white
            tip.textColor = .white
            bill.textColor = .white
            total.textColor = .white
            darkLabel.textColor = .white
            splitLabel.textColor = .white
            splitNumber.textColor = .white
            perPerson.textColor = .white
            perPersonAmount.textColor = .white
            //appName.textColor = .white
        } else {
            view.backgroundColor = .white
            tipControl.selectedSegmentTintColor = .white
            billAmountTextField.backgroundColor = .white
            totalLabel.textColor = .black
            billAmountTextField.backgroundColor = .white
            tipAmountLabel.textColor = .black
            tip.textColor = .black
            bill.textColor = .black
            total.textColor = .black
            darkLabel.textColor = .black
            splitLabel.textColor = .black
            splitNumber.textColor = .black
            perPerson.textColor = .black
            perPersonAmount.textColor = .black
            //appName.textColor = .black
        }
        
    }
    
    @IBAction func stepperFunc(_ sender: UIStepper) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip percentage from multipling with tipPercentage
        let tipPercentages = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = tip + bill
        
        
        
        splitNumber.text = Int(sender.value).description
        let persons = splitNumber.text
        
        
        if Int(splitNumber.text!)! > 0 {
            //creates split per person if splitter is 2 or above
            perPersonAmount.text = String(format: "$%.2f", total / Double(persons!)!)
        }
    }
}

