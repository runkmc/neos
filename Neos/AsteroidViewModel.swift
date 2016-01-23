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
    
    init?(asteroid:Asteroid?) {
        guard let asteroid = asteroid else {
            return nil
        }
        self.name = asteroid.name
        self.maxMeters = NSString(format: "%.0f meters", asteroid.estimatedDiameterMaxMeters) as String
        self.minMeters = NSString(format: "%.0f meters", asteroid.estimatedDiameterMinMeters) as String
        self.maxFeet = NSString(format: "%.0f feet", asteroid.estimatedDiameterMaxFeet) as String
        self.minFeet = NSString(format: "%.0f feet", asteroid.estimatedDiameterMinFeet) as String
        self.hazard = asteroid.hazardous ? "TRUE" : "FALSE"
    }
}