//
//  ViewController.swift
//  Prework_2
//
//  Created by Kevin on 1/31/22.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        //set up some default percentages
        UserDefaults.standard.register(defaults: ["tipOne" : 15])
        UserDefaults.standard.register(defaults: ["tipTwo" : 18])
        UserDefaults.standard.register(defaults: ["tipThree" : 20])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        let tip_one = defaults.string(forKey: "tipOne")! + "%"
        let tip_two = defaults.string(forKey: "tipTwo")! + "%"
        let tip_three = defaults.string(forKey: "tipThree")! + "%"
        
        tipControl.setTitle(tip_one, forSegmentAt: 0)
        tipControl.setTitle(tip_two, forSegmentAt: 1)
        tipControl.setTitle(tip_three, forSegmentAt: 2)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        //get the bill amount
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //get the percentages from user defaults
        let tip_one = defaults.double(forKey: "tipOne")/100.0
        let tip_two = defaults.double(forKey: "tipTwo")/100.0
        let tip_three = defaults.double(forKey: "tipThree")/100.0
        
        //Get total tip
        let tipPercentages = [tip_one, tip_two, tip_three]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        //update tip
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

