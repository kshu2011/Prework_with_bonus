//
//  SettingsViewController.swift
//  Prework_2
//
//  Created by Kevin on 1/31/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    let defaults = UserDefaults.standard

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func textFieldChanged(_ sender: Any) {
        let value = tipOne.text ?? "15"
        defaults.set(Double(value), forKey: "tipOne")
        defaults.synchronize()
    }
    
    @IBAction func textFieldChangedTwo(_ sender: Any) {
        let value = tipTwo.text ?? "18"
        defaults.set(Double(value), forKey: "tipTwo")
        defaults.synchronize()
    }
    
    @IBAction func textFieldChangedThree(_ sender: Any) {
        let value = tipThree.text ?? "20"
        defaults.set(Double(value), forKey: "tipThree")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
