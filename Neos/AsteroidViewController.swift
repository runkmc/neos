//
//  AsteroidViewController.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit

class AsteroidViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // PROPERTIES OR INSTANCE VARIABLES OR WHAEVER I'M SUPPOSED TO CALL THEM NOW
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var orbitView: OrbitalView!
    let innerPlanet = LittlePlanetView()
    let outerPlanet = LittlePlanetView()
    var asteroids = [AsteroidViewModel]()
    
    // OVERRIDES THIS PART IS BORING
    
    override func viewWillAppear(animated: Bool) {
        setPlanetsInMotion()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pager.hidesForSinglePage = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.pagingEnabled = true
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setPlanetsInMotion", name: UIApplicationDidBecomeActiveNotification, object: nil)
        let downloader = AsteroidDownloader(startDate: NSDate(), endDate: NSDate())
        downloader.download { data in
            let asteroidModels = jsonParser(data)
            self.asteroids = asteroidModels.flatMap { AsteroidViewModel(asteroid: $0) }
            self.pager.numberOfPages = self.asteroids.count
            self.collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // ANIMATIONS BECAUSE WHY NOT HAVE ONE CLASS DO ALL OF THIS
    
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
    
    // UICollectionViewDataSource stuff
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asteroids.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("neosCell", forIndexPath: indexPath)
        return cell
    }
}
