//
//  Asteroid.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Runes
import Argo
import Curry

struct Asteroid {
    let name: String
    let url: String
    let estimatedDiameterMaxMeters: Double
    let estimatedDiameterMinMeters: Double
    let estimatedDiameterMaxFeet: Double
    let estimatedDiameterMinFeet: Double
    let hazardous: Bool
    let approach: [CloseApproach]
}

extension Asteroid: Decodable {
    static func decode(_ json: JSON) -> Decoded<Asteroid> {
        let a = curry(Asteroid.init)
        return a
            <^> json <| "name"
            <*> json <| "nasa_jpl_url"
            <*> json <| ["estimated_diameter","meters","estimated_diameter_max"]
            <*> json <| ["estimated_diameter","meters","estimated_diameter_min"]
            <*> json <| ["estimated_diameter","feet","estimated_diameter_max"]
            <*> json <| ["estimated_diameter","feet","estimated_diameter_min"]
            <*> json <| "is_potentially_hazardous_asteroid"
            <*> json <|| "close_approach_data"
    }
}

