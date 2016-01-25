//
//  OrbitalView.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class OrbitalView: UIView {
    
    let sunPath = UIBezierPath(ovalInRect: CGRectMake(62, 62, 114, 114))
    let innerOrbitPath = UIBezierPath(ovalInRect: CGRectMake(28, 28, 182, 182))
    let outerOrbitPath = UIBezierPath(ovalInRect: CGRectMake(2, 2, 234, 234))
    
    override func drawRect(rect: CGRect) {
    let color = UIColor(red: 0.920, green: 0.161, blue: 0.478, alpha: 1.000)
    let color2 = UIColor(red: 0.380, green: 0.906, blue: 0.878, alpha: 1.000)
    
    // Sun
    color.setFill()
    sunPath.fill()
    
    // Inner orbit
    color2.setStroke()
    innerOrbitPath.lineWidth = 2
    innerOrbitPath.stroke()
    
    // Outer orbit
    color2.setStroke()
    outerOrbitPath.lineWidth = 2
    outerOrbitPath.stroke()
    }
}
