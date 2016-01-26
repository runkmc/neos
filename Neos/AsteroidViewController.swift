//
//  AsteroidViewController.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class AsteroidViewController: UIViewController {

    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var orbitView: OrbitalView!
    let innerPlanet = LittlePlanetView()
    let outerPlanet = LittlePlanetView()
    
    override func viewWillAppear(animated: Bool) {
        setPlanetsInMotion()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setPlanetsInMotion", name: UIApplicationDidBecomeActiveNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setPlanetsInMotion() {
        orbitView.addSubview(innerPlanet)
        innerPlanet.frame = CGRectMake(47, 175, 18, 18)
        orbitView.addSubview(outerPlanet)
        outerPlanet.frame = CGRectMake(192, 192, 18, 18)
        addOrbit(innerPlanet, orbit: orbitView.innerOrbitPath, speed: 27)
        addOrbit(outerPlanet, orbit: orbitView.outerOrbitPath, speed: 41)
    }
    
    func addOrbit(planet:LittlePlanetView, orbit:UIBezierPath, speed:Double) {
        let planetOrbit = CAKeyframeAnimation()
        planetOrbit.keyPath = "position"
        planetOrbit.path = orbit.CGPath
        planetOrbit.duration = speed
        planetOrbit.repeatCount = 1000
        planetOrbit.calculationMode = kCAAnimationCubicPaced
        planet.backgroundColor = UIColor.clearColor()
        planet.layer.addAnimation(planetOrbit, forKey: "orbit")
    }
}
