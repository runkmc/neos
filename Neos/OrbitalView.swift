//
//  OrbitalView.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class OrbitalView: UIView {

    override func drawRect(rect: CGRect) {
    let color = UIColor(red: 0.920, green: 0.161, blue: 0.478, alpha: 1.000)
    let color2 = UIColor(red: 0.380, green: 0.906, blue: 0.878, alpha: 1.000)
    
    // Sun
    let ovalPath = UIBezierPath(ovalInRect: CGRectMake(62, 62, 114, 114))
    color.setFill()
    ovalPath.fill()
    
    // Inner orbit
    let oval2Path = UIBezierPath(ovalInRect: CGRectMake(28, 28, 182, 182))
    color2.setStroke()
    oval2Path.lineWidth = 2
    oval2Path.stroke()
    
    // Inner planet
    let oval3Path = UIBezierPath(ovalInRect: CGRectMake(47, 175, 18, 18))
    color2.setFill()
    oval3Path.fill()
    
    // Outer orbit
    let oval4Path = UIBezierPath(ovalInRect: CGRectMake(2, 2, 234, 234))
    color2.setStroke()
    oval4Path.lineWidth = 2
    oval4Path.stroke()
    
    // Outer planet
    let oval5Path = UIBezierPath(ovalInRect: CGRectMake(192, 193, 18, 18))
    color2.setFill()
    oval5Path.fill()
    }

}
