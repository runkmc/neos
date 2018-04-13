//
//  PagedNearEarthObjects.swift
//  Neos
//
//  Created by Scott Densmore on 10/15/17.
//  Copyright © 2017 Kevin McGladdery. All rights reserved.
//

import Foundation

struct PagedAsteroids : Codable {
    let links: Links
    let elementCount: Int
    let asteroids: [String:[Asteroid]]

    enum CodingKeys : String, CodingKey {
        case links
        case elementCount = "element_count"
        case asteroids = "near_earth_objects"
    }
}
