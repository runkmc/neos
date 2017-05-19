//
//  CloseApproach.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Runes
import Argo
import Curry

struct CloseApproach {
    let closeApproachDate: String
    let kph: String
    let mph: String
    let missDistanceKilometers: String
    let missDistanceMiles: String
    let missDistanceLunar: String
    let missDistanceAstronomical: String
}

extension CloseApproach: Decodable {
    static func decode(_ json: JSON) -> Decoded<CloseApproach> {
        let c = curry(CloseApproach.init)
        return c
            <^> json <| "close_approach_date"
            <*> json <| ["relative_velocity","kilometers_per_hour"]
            <*> json <| ["relative_velocity","miles_per_hour"]
            <*> json <| ["miss_distance","kilometers"]
            <*> json <| ["miss_distance","miles"]
            <*> json <| ["miss_distance","lunar"]
            <*> json <| ["miss_distance","astronomical"]
    }
}
