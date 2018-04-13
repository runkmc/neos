//
// Copyright (c) 2017 Scott Densmore. All rights reserved.
//

import Foundation

struct Links : Codable {

    let nextLink: URL?
    let previousLink: URL?
    let selfLink: URL

    enum CodingKeys : String, CodingKey {
        case nextLink = "next"
        case previousLink = "prev"
        case selfLink = "self"
    }

}