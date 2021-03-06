//
//  LittlePlanetView.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class LittlePlanetView: UIView {

    override func draw(_ rect: CGRect) {
        let blueColor = UIColor(red: 0.380, green: 0.906, blue: 0.878, alpha: 1.000)
        let planet = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 18, height: 18))
        blueColor.setFill()
        planet.fill()
    }
    
}
