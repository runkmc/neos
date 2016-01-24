//
//  AsteroidViewModel.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/22/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation

struct AsteroidViewModel {
    
    let name: String
    let maxMeters: String
    let minMeters: String
    let maxFeet: String
    let minFeet: String
    let hazard: String
    let approachDate: String
    let kph: String
    let mph: String
    let missDistanceKilometers: String
    let missDistanceMiles: String
    static let formatter = NSNumberFormatter()
    
    init?(asteroid:Asteroid?) {
        guard let asteroid = asteroid else {
            return nil
        }
        let f = AsteroidViewModel.formatter
        f.numberStyle = .DecimalStyle
        f.maximumFractionDigits = 0
        self.name = asteroid.name
        self.maxMeters = (f.stringFromNumber(asteroid.estimatedDiameterMaxMeters) ?? "UNKNOWN") + " meters"
        self.minMeters = (f.stringFromNumber(asteroid.estimatedDiameterMinMeters) ?? "UNKNOWN") + " meters"
        self.maxFeet = (f.stringFromNumber(asteroid.estimatedDiameterMaxFeet) ?? "UNKNOWN") + " feet"
        self.minFeet = (f.stringFromNumber(asteroid.estimatedDiameterMinFeet) ?? "UNKNOWN") + " feet"
        self.hazard = asteroid.hazardous ? "TRUE" : "FALSE"
        let approach = asteroid.approach[0]
        f.maximumFractionDigits = 1
        self.approachDate = approach.closeApproachDate
        let k = f.stringFromNumber((approach.kph as NSString).doubleValue)
        self.kph = (k ?? "UNKNOWN ") + "kph"
        let m = f.stringFromNumber((approach.mph as NSString).doubleValue)
        self.mph = (m ?? "UNKNOWN ") + "mph"
        let missK = f.stringFromNumber((approach.missDistanceKilometers as NSString).integerValue)
        self.missDistanceKilometers = missK ?? "UNKNOWN"
        let missM = f.stringFromNumber((approach.missDistanceMiles as NSString).integerValue)
        self.missDistanceMiles = missM ?? "UNKNOWN"
    }
}