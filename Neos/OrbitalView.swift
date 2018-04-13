//
//  OrbitalView.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class OrbitalView: UIView {
    
    let sunPath = UIBezierPath(ovalIn: CGRect(x: 62, y: 62, width: 114, height: 114))
    let innerOrbitPath = UIBezierPath(ovalIn: CGRect(x: 28, y: 28, width: 182, height: 182))
    let outerOrbitPath = UIBezierPath(ovalIn: CGRect(x: 2, y: 2, width: 234, height: 234))
    
    override func draw(_ rect: CGRect) {
        let color = UIColor(red: 0.920, green: 0.161, blue: 0.478, alpha: 1.000)
        let color2 = UIColor(red: 0.380, green: 0.906, blue: 0.878, alpha: 1.000)

        // Sun
        color.setFill()
        sunPath.fill()

        // Inner orbit
        color2.setStroke()
        innerOrbitPath.lineWidth = 1
        innerOrbitPath.stroke()

        // Outer orbit
        color2.setStroke()
        outerOrbitPath.lineWidth = 1
        outerOrbitPath.stroke()
    }

}
