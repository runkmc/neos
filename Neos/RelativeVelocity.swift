//
// Copyright (c) 2017 Scott Densmore. All rights reserved.
//

import Foundation

struct RelativeVelocity : Codable {

    let kilometersPerHour: String
    let milesPerHour: String
    let kilometersPerSecond: String

    enum CodingKeys : String, CodingKey {
        case kilometersPerHour = "kilometers_per_hour"
        case milesPerHour = "miles_per_hour"
        case kilometersPerSecond = "kilometers_per_second"
    }

}
