//
//  ViewController.swift
//  Prework
//
//  Created by Abhinav Varre on 12/30/21.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipDisplayLabel: UILabel!
    @IBOutlet weak var totalDisplayLabel: UILabel!
    let NUM_SECONDS_UNTIL_RESET = 600.0
    let defaults = UserDefaults.standard
    var numAppeared = 0;

    
    
    override func viewDidLoad() {
        print("VIEW DID LOAD METHOD ***********")
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        let prevEndTime = (defaults.object(forKey: "appCloseTime") as? NSDate) ?? NSDate()
        print(prevEndTime)
        let elapsedTime = abs(prevEndTime.timeIntervalSinceNow)
        defaults.set(elapsedTime, forKey: "elapsedTime")
        defaults.synchronize()
        print("This is the elapsed time after closing and opening: \(elapsedTime)")
        print("The time:  \(defaults.double(forKey: "elapsedTime"))")
        if(defaults.double(forKey: "elapsedTime") < NUM_SECONDS_UNTIL_RESET)
        {
            billAmountTextField.text = defaults.string(forKey: "mostRecentUserEntry")
        }
        else
        {
            totalLabel.alpha = 0;
            tipAmountLabel.alpha = 0;
            tipDisplayLabel.alpha = 0;
            totalDisplayLabel.alpha = 0;
        }
        billAmountTextField.becomeFirstResponder()
       
        
        
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        calculate()

    }
    @IBAction func calculateInitial(_ sender: Any) {
        calculate()
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        if(billAmountTextField.text == "")
        {
            finishAnimations()
        }
    }
    @IBAction func animateTotals(_ sender: Any) {
        UIView.animate(withDuration:0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.totalLabel.alpha = 1
            self.tipAmountLabel.alpha = 1
            self.tipDisplayLabel.alpha = 1;
            self.totalDisplayLabel.alpha = 1;
        })
    }
    
   func finishAnimations() {
        UIView.animate(withDuration:0.4, animations: {
            // This causes first view to fade in and second view to fade out
            self.totalLabel.alpha = 0
            self.tipAmountLabel.alpha = 0
            self.tipDisplayLabel.alpha = 0;
            self.totalDisplayLabel.alpha = 0;
        })
        
    }
    func calculate()
    {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercentages = [defaults.double(forKey: "tipOneDef"),defaults.double(forKey: "tipTwoDef"),defaults.double(forKey: "tipThreeDef")];
        print(tipControl.selectedSegmentIndex)
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        let tip = formatter.string(for: bill*tipPercentages[tipControl.selectedSegmentIndex])!
        let total = formatter.string(for: bill*tipPercentages[tipControl.selectedSegmentIndex]+bill )!
        defaults.set(billAmountTextField.text, forKey: "mostRecentUserEntry")
        defaults.set(tipControl.selectedSegmentIndex, forKey: "mostRecentPercentage")
        tipAmountLabel.text = String(format: "\(tip)")
        totalLabel.text = String(format: "\(total)")
    }
    override func viewWillAppear(_ animated: Bool) {
        numAppeared+=1
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        tipControl.removeAllSegments();
        tipControl.insertSegment(withTitle: "\(100 * defaults.double(forKey: "tipOneDef"))%", at: 0, animated: true)
        tipControl.insertSegment(withTitle: "\(100 * defaults.double(forKey: "tipTwoDef"))%", at: 1, animated: true)
        tipControl.insertSegment(withTitle: "\(100 * defaults.double(forKey: "tipThreeDef"))%", at: 2, animated: true)
        print("This is the num of times appeared \(numAppeared)")
        if(defaults.double(forKey: "elapsedTime") > NUM_SECONDS_UNTIL_RESET || numAppeared > 1)
        {
            if(defaults.integer(forKey: "selectedIndex") != -1)
            {
                tipControl.selectedSegmentIndex = defaults.integer(forKey: "selectedIndex")
            }
            else
            {
                tipControl.selectedSegmentIndex = 0;
            }
        }
        else
        {
            print("This should run because the time is less than 60 seconds")
            let selectedIndex = defaults.integer(forKey: "mostRecentPercentage")
            if(selectedIndex == -1)
            {
        
                tipControl.selectedSegmentIndex = defaults.integer(forKey: "selectedIndex")
            }
            else
            {
                tipControl.selectedSegmentIndex = selectedIndex
            }
        }


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
    
    
    
}

