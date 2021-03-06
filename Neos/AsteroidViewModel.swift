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
    let missDistanceLunar: String
    let missDistanceAstronomical: String
    static let formatter = NumberFormatter()
    
    init?(asteroid:Asteroid?) {
        guard let asteroid = asteroid else {
            return nil
        }
        let f = AsteroidViewModel.formatter
        f.numberStyle = .decimal
        f.maximumFractionDigits = 0
        self.name = asteroid.name
        self.maxMeters = (f.string(from: NSNumber(value:asteroid.estimatedDiameterMaxMeters)) ?? "UNKNOWN") + " meters"
        self.minMeters = (f.string(from: NSNumber(value:asteroid.estimatedDiameterMinMeters)) ?? "UNKNOWN") + " meters"
        self.maxFeet = (f.string(from: NSNumber(value:asteroid.estimatedDiameterMaxFeet)) ?? "UNKNOWN") + " feet"
        self.minFeet = (f.string(from: NSNumber(value:asteroid.estimatedDiameterMinFeet)) ?? "UNKNOWN") + " feet"
        self.hazard = asteroid.hazardous ? "TRUE" : "FALSE"
        let approach = asteroid.approach[0]
        f.maximumFractionDigits = 1
        self.approachDate = approach.closeApproachDate
        let k = f.string(from: NSNumber(value:(approach.kph as NSString).doubleValue))
        self.kph = (k ?? "UNKNOWN ") + "kph"
        let m = f.string(from: NSNumber(value:(approach.mph as NSString).doubleValue))
        self.mph = (m ?? "UNKNOWN ") + "mph"
        let missK = f.string(from: NSNumber(value:(approach.missDistanceKilometers as NSString).integerValue))
        self.missDistanceKilometers = missK ?? "UNKNOWN"
        let missM = f.string(from: NSNumber(value:(approach.missDistanceMiles as NSString).integerValue))
        self.missDistanceMiles = missM ?? "UNKNOWN"
        f.maximumFractionDigits = 2
        let missL = f.string(from: NSNumber(value:(approach.missDistanceLunar as NSString).doubleValue))
        self.missDistanceLunar = missL ?? "UNKNOWN"
        f.maximumFractionDigits = 3
        let missA = f.string(from: NSNumber(value:(approach.missDistanceAstronomical as NSString).doubleValue))
        self.missDistanceAstronomical = missA ?? "UNKNOWN"
    }
}
