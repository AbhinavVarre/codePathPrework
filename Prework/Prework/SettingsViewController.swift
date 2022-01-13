//
//  SettingsViewController.swift
//  Prework
//
//  Created by Abhinav Varre on 1/4/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    @IBOutlet weak var tipControlBarPreferences: UISegmentedControl!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let prevSelectedIndex = tipControlBarPreferences.selectedSegmentIndex;
        tipControlBarPreferences.removeAllSegments()
        tipControlBarPreferences.insertSegment(withTitle: "\(100 * defaults.double(forKey: "tipOneDef"))%", at: 0, animated: true)
        tipControlBarPreferences.insertSegment(withTitle: "\(100 * defaults.double(forKey: "tipTwoDef"))%", at: 1, animated: true)
        tipControlBarPreferences.insertSegment(withTitle: "\(100 * defaults.double(forKey: "tipThreeDef"))%", at: 2, animated: true)
        tipControlBarPreferences.selectedSegmentIndex = defaults.integer(forKey: "selectedIndex")

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDef(_ sender: Any) {
       
        var tipOneDef = (Double(tipOne.text!)) ?? 15
        var tipTwoDef = Double(tipTwo.text!) ?? 18
        var tipThreeDef = Double(tipThree.text!) ?? 20
       


        tipOneDef = tipOneDef / 100
        tipTwoDef = tipTwoDef / 100
        tipThreeDef = tipThreeDef / 100
        
        defaults.set(tipOneDef, forKey: "tipOneDef")
        defaults.set(tipTwoDef, forKey: "tipTwoDef")
        defaults.set(tipThreeDef, forKey: "tipThreeDef")
    

        defaults.synchronize()
        viewDidLoad()


        
        
       // print("Tip one def: " ,String(tipOneDef))
       // print("Tip two def: " ,String(tipTwoDef))
      //  print("Tip three def: " ,String(tipThreeDef))


    }
    
    
    @IBAction func changeDefaultSegment(_ sender: Any) {
        defaults.set(tipControlBarPreferences.selectedSegmentIndex, forKey: "selectedIndex")
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
