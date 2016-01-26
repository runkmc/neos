//
//  SettingsViewController.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/25/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var measurementControl: UISegmentedControl!
    
    // OVERRIDES
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        let attrs = [NSFontAttributeName: UIFont(name:"FiraMono-Regular", size:14)!]
        measurementControl.setTitleTextAttributes(attrs, forState: .Normal)
        measurementControl.tintColor = UIColor.whiteColor()
        backButton.layer.cornerRadius = 4
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedUnits = defaults.objectForKey("units") as? String ?? "metric"
        if selectedUnits == "metric" {
            measurementControl.selectedSegmentIndex = 0
        } else {
            measurementControl.selectedSegmentIndex = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func changeMeasurement(sender: AnyObject) {
        let sc = sender as! UISegmentedControl
        let defaults = NSUserDefaults.standardUserDefaults()
        if sc.selectedSegmentIndex == 0 {
            defaults.setObject("metric", forKey: "units")
        } else {
            defaults.setObject("imperial", forKey: "units")
        }
    }

}
