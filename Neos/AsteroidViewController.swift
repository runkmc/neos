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
    
    override func viewWillAppear(_ animated: Bool) {
        setPlanetsInMotion()
        getUnits()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: (collectionView.frame.width), height: (collectionView.frame.height))
        collectionView.collectionViewLayout = layout
        pager.hidesForSinglePage = true
        collectionView.emptyDataSetDelegate = self
        collectionView.emptyDataSetSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.allowsSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        NotificationCenter.default.addObserver(self, selector: #selector(AsteroidViewController.setPlanetsInMotion), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        activitySpinner.startAnimating()
        collectionView.isHidden = true
        self.pager.hidesForSinglePage = true
        self.pager.isHidden = true
        let downloader = AsteroidDownloader(startDate: Date(), endDate: Date())
        
        downloader.download { response in
            if let _ = response.result.error {
                let alert = UIAlertController(title: "Error", message: "There was a problem getting today's asteroids.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                self.asteroids = []
                self.activitySpinner.stopAnimating()
                self.collectionView.isHidden = false
                return
            }
            if let data = response.data {
                let asteroidModels = jsonParser(data)
                self.asteroids = asteroidModels.flatMap { AsteroidViewModel(asteroid: $0) }
                self.pager.numberOfPages = self.asteroids.count
                self.collectionView.reloadData()
                self.activitySpinner.stopAnimating()
                self.collectionView.isHidden = false
                self.pager.isHidden = false
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    // GET DEFAULT UNITS
    
    func getUnits() -> String {
        if let u = self.units {
            return u
        }
        let defaults = UserDefaults.standard
        let selection = defaults.object(forKey: "units") as? String ?? "metric"
        self.units = selection
        return selection
    }
    
    // SEGUE JUNK
    
    @IBAction func unwindToAsteroidController(_ sender:UIStoryboardSegue) {
        self.units = nil
        getUnits()
        collectionView.reloadData()
    }
    
    // TWEEEEEEEEET
    
    @IBAction func tweetTapped(_ sender: AnyObject) {
        guard let currentAsteroid = collectionView.indexPathForItem(at: collectionView.convert(collectionView.center, from: collectionView.superview))?.row else {
            return
        }
        let asteroid = asteroids[currentAsteroid]
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) {
            let tweetVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetVC?.setInitialText("Asteroid \(asteroid.name) is passing by earth today! #Neos")
            self.present(tweetVC!, animated: true, completion: nil)
        }
    }
    
    // ANIMATIONS BECAUSE WHY NOT HAVE ONE CLASS DO ALL OF THIS
    
    func setPlanetsInMotion() {
        orbitView.addSubview(innerPlanet)
        innerPlanet.frame = CGRect(x: 47, y: 175, width: 18, height: 18)
        orbitView.addSubview(outerPlanet)
        outerPlanet.frame = CGRect(x: 192, y: 192, width: 18, height: 18)
        addOrbit(innerPlanet, orbit: orbitView.innerOrbitPath, speed: 27)
        addOrbit(outerPlanet, orbit: orbitView.outerOrbitPath, speed: 41)
    }
    
    func addOrbit(_ planet:LittlePlanetView, orbit:UIBezierPath, speed:Double) {
        let planetOrbit = CAKeyframeAnimation()
        planetOrbit.keyPath = "position"
        planetOrbit.path = orbit.cgPath
        planetOrbit.duration = speed
        planetOrbit.repeatCount = 1000
        planetOrbit.calculationMode = kCAAnimationCubicPaced
        planet.backgroundColor = UIColor.clear
        planet.layer.add(planetOrbit, forKey: "orbit")
    }
    
    // UICollectionViewDataSource stuff
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asteroids.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "neosCell", for: indexPath) as! NeosCollectionViewCell
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let cv = scrollView as! UICollectionView
        if let cp = cv.indexPathForItem(at: cv.convert(cv.center, from: cv.superview))?.row {
            pager.currentPage = cp
        }
    }
    
    // UICollectionViewDelegateFlowLayout stuff. What a short and very good name for this.
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    // BUT WHAT DO WE DO IF THERE ARE NO ASTEROIDS TODAY
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let attrs = [NSFontAttributeName: UIFont(name: "FiraMono-Bold", size: 19)!,
            NSForegroundColorAttributeName: UIColor(red:0.184, green:0.192, blue:0.267, alpha:1)]
        return NSAttributedString(string: "NO ASTEROIDS TODAY", attributes: attrs)
    }
    
}
