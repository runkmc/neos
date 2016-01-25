//
//  AsteroidViewController.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class AsteroidViewController: UIViewController {

    @IBOutlet weak var orbitView: OrbitalView!
    let innerPlanet = LittlePlanetView()
    let outerPlanet = LittlePlanetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        orbitView.addSubview(innerPlanet)
        innerPlanet.frame = CGRectMake(47, 175, 18, 18)
        let innerOrbit = CAKeyframeAnimation()
        innerOrbit.keyPath = "position"
        innerOrbit.path = orbitView.innerOrbitPath.CGPath
        innerOrbit.duration = 27
        innerOrbit.repeatCount = 1000
        innerOrbit.calculationMode = kCAAnimationCubicPaced
        innerPlanet.backgroundColor = UIColor.clearColor()
        innerPlanet.layer.addAnimation(innerOrbit, forKey: "orbit")
        
        orbitView.addSubview(outerPlanet)
        outerPlanet.frame = CGRectMake(192, 192, 18, 18)
        let outerOrbit = CAKeyframeAnimation()
        outerOrbit.keyPath = "position"
        outerOrbit.path = orbitView.outerOrbitPath.CGPath
        outerOrbit.duration = 41
        outerOrbit.repeatCount = 1000
        outerOrbit.calculationMode = kCAAnimationCubicPaced
        outerPlanet.backgroundColor = UIColor.clearColor()
        outerPlanet.layer.addAnimation(outerOrbit, forKey: "orbit2")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
