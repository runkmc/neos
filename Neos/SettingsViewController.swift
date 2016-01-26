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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
