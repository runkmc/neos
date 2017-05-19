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
    
    override func viewWillAppear(_ animated: Bool) {
        let attrs = [NSFontAttributeName: UIFont(name:"FiraMono-Regular", size:14)!]
        measurementControl.setTitleTextAttributes(attrs, for: UIControlState())
        measurementControl.tintColor = UIColor.white
        backButton.layer.cornerRadius = 4
        
        let defaults = UserDefaults.standard
        let selectedUnits = defaults.object(forKey: "units") as? String ?? "metric"
        if selectedUnits == "metric" {
            measurementControl.selectedSegmentIndex = 0
        } else {
            measurementControl.selectedSegmentIndex = 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    @IBAction func changeMeasurement(_ sender: AnyObject) {
        let sc = sender as! UISegmentedControl
        let defaults = UserDefaults.standard
        if sc.selectedSegmentIndex == 0 {
            defaults.set("metric", forKey: "units")
        } else {
            defaults.set("imperial", forKey: "units")
        }
    }

}
