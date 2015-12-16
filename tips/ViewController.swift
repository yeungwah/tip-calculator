//
//  ViewController.swift
//  tips
//
//  Created by yeung wah tsui on 12/13/15.
//  Copyright © 2015 yeung wah tsui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var perPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder();
        stepper.value = 1;
        stepper.autorepeat = true;
        stepper.minimumValue = 1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults();
        let position = defaults.integerForKey("defaultTip");
        print("selected position \(position)");
        tipControl.selectedSegmentIndex = position;
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        calculateResult();
        
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
    @IBAction func onStepperValueChanged(sender: UIStepper) {
        peopleLabel.text = Int(sender.value).description;
        calculateResult();
    }
    func calculateResult(){
        let formatter = NSNumberFormatter();
        let tipPercentages = [0.18,0.2,0.25];
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex];
        let billAmount = NSString(string:billField.text!).doubleValue;
        let tip = billAmount * tipPercentage;
        let total = billAmount + tip;
        let people =  Double(peopleLabel.text!);
        let perPerson = total / people!;
        formatter.numberStyle = .CurrencyStyle;
        
        perPersonLabel.text = formatter.stringFromNumber(perPerson);
        totalLabel.text = formatter.stringFromNumber(total);
        tipLabel.text = formatter.stringFromNumber(tip);
    }

}

