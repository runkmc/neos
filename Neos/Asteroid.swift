//
//  Asteroid.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation

struct Asteroid : Codable {

    let name: String
    let links: Links
    let url: URL
    let absoluteMagnitude: Float
    let estimatedDiameter: EstimatedDiameter
    let hazardous: Bool
    let closeApproach: [CloseApproach]
    
    enum CodingKeys : String, CodingKey {
        case name
        case links
        case url = "nasa_jpl_url"
        case absoluteMagnitude = "absolute_magnitude_h"
        case estimatedDiameter = "estimated_diameter"
        case hazardous = "is_potentially_hazardous_asteroid"
        case closeApproach = "close_approach_data"
    }

}
