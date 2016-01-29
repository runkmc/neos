//
//  AsteroidViewController.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/24/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import UIKit
import Social
import Alamofire
import DZNEmptyDataSet

class AsteroidViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, DZNEmptyDataSetDelegate, DZNEmptyDataSetSource {

    // PROPERTIES OR INSTANCE VARIABLES OR WHAEVER I'M SUPPOSED TO CALL THEM NOW
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pager: UIPageControl!
    @IBOutlet weak var orbitView: OrbitalView!
    let innerPlanet = LittlePlanetView()
    let outerPlanet = LittlePlanetView()
    var asteroids = [AsteroidViewModel]()
    var units: String?
    
    // OVERRIDES THIS PART IS BORING
    
    override func viewWillAppear(animated: Bool) {
        setPlanetsInMotion()
        getUnits()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height))
        collectionView.collectionViewLayout = layout
        pager.hidesForSinglePage = true
        collectionView.emptyDataSetDelegate = self
        collectionView.emptyDataSetSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.pagingEnabled = true
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "setPlanetsInMotion", name: UIApplicationDidBecomeActiveNotification, object: nil)
        activitySpinner.startAnimating()
        collectionView.hidden = true
        let downloader = AsteroidDownloader(startDate: NSDate(), endDate: NSDate())
        
        downloader.download { response in
            if let _ = response.result.error {
                let alert = UIAlertController(title: "Error", message: "There was a problem getting today's asteroids.", preferredStyle: .Alert)
                let ok = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated: true, completion: nil)
                self.asteroids = []
                self.activitySpinner.stopAnimating()
                self.collectionView.hidden = false
                return
            }
            if let data = response.data {
                let asteroidModels = jsonParser(data)
                self.asteroids = asteroidModels.flatMap { AsteroidViewModel(asteroid: $0) }
                self.pager.numberOfPages = self.asteroids.count
                self.collectionView.reloadData()
                self.activitySpinner.stopAnimating()
                self.collectionView.hidden = false
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    // GET DEFAULT UNITS
    
    func getUnits() -> String {
        if let u = self.units {
            return u
        }
        let defaults = NSUserDefaults.standardUserDefaults()
        let selection = defaults.objectForKey("units") as? String ?? "metric"
        self.units = selection
        return selection
    }
    
    // SEGUE JUNK
    
    @IBAction func unwindToAsteroidController(sender:UIStoryboardSegue) {
        self.units = nil
        getUnits()
        collectionView.reloadData()
    }
    
    // TWEEEEEEEEET
    
    @IBAction func tweetTapped(sender: AnyObject) {
        guard let currentAsteroid = collectionView.indexPathsForVisibleItems().first?.row else {
            return
        }
        let asteroid = asteroids[currentAsteroid]
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let tweetVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetVC.setInitialText("Asteroid \(asteroid.name) is passing by earth today! #Neos")
            self.presentViewController(tweetVC, animated: true, completion: nil)
        }
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
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("neosCell", forIndexPath: indexPath) as! NeosCollectionViewCell
        let asteroid = asteroids[indexPath.row]
        cell.nameLabel.text = asteroid.name
        cell.dateLabel.text = asteroid.approachDate
        cell.hazardLabel.text = asteroid.hazard
        cell.auDistanceLabel.text = asteroid.missDistanceAstronomical
        cell.lunarDistanceLabel.text = asteroid.missDistanceLunar
        
        if getUnits() == "metric" {
            cell.basicDistanceLabel.text = asteroid.missDistanceKilometers
            cell.speedLabel.text = asteroid.kph
            cell.maxDiameterLabel.text = asteroid.maxMeters
            cell.minDiameterLabel.text = asteroid.minMeters
            cell.distanceUnitsLabel.text = "KILOMETERS:"
        } else {
            cell.basicDistanceLabel.text = asteroid.missDistanceMiles
            cell.speedLabel.text = asteroid.mph
            cell.maxDiameterLabel.text = asteroid.maxFeet
            cell.minDiameterLabel.text = asteroid.minFeet
            cell.distanceUnitsLabel.text = "MILES:"
        }
        
        return cell
    }
    
    // UIScrollViewDelegate stuff, to connect the collectionView to the page control.
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let cv = scrollView as! UICollectionView
        if let cp = cv.indexPathsForVisibleItems().first?.row {
            pager.currentPage = cp
        }
    }
    
    // UICollectionViewDelegateFlowLayout stuff. What a short and very good name for this.
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    // BUT WHAT DO WE DO IF THERE ARE NO ASTEROIDS TODAY
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let attrs = [NSFontAttributeName: UIFont(name: "FiraMono-Bold", size: 19)!,
            NSForegroundColorAttributeName: UIColor(red:0.184, green:0.192, blue:0.267, alpha:1)]
        return NSAttributedString(string: "NO ASTEROIDS TODAY", attributes: attrs)
    }
    
}