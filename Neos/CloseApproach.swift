//
//  CloseApproach.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation

struct CloseApproach : Codable {

    let date: String
    let epochDate: Int
    let relativeVelocity: RelativeVelocity
    let missDistance: MissDistance
    let orbitingBody: String

    enum CodingKeys : String, CodingKey {
        case date = "close_approach_date"
        case epochDate = "epoch_date_close_approach"
        case relativeVelocity = "relative_velocity"
        case missDistance = "miss_distance"
        case orbitingBody = "orbiting_body"
    }

}

