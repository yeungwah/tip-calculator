//
//  SettingsViewController.swift
//  tips
//
//  Created by yeung wah tsui on 12/13/15.
//  Copyright © 2015 yeung wah tsui. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let defaults = NSUserDefaults.standardUserDefaults();
        let position = defaults.integerForKey("defaultTip");
        print("selected position \(position)");
        tipControl.selectedSegmentIndex = position;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onChange(sender: AnyObject) {
        print(tipControl.selectedSegmentIndex);
        let defaults = NSUserDefaults.standardUserDefaults();
        print("selected index \(tipControl.selectedSegmentIndex)");
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "defaultTip");
        defaults.synchronize();
    }
}
