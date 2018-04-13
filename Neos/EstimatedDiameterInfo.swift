//
// Copyright (c) 2017 Scott Densmore. All rights reserved.
//

import Foundation

struct EstimatedDiameterInfo : Codable {

    let min: Float
    let max: Float

    enum CodingKeys : String, CodingKey {
        case min = "estimated_diameter_min"
        case max = "estimated_diameter_max"
    }

}