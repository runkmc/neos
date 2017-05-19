//
//  jsonParser.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Argo

func jsonParser(_ data:Data) -> [Asteroid?] {
    let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
    guard let days = json!["near_earth_objects"] as? [String: [AnyObject]] else {
        return []
    }
    var asteroidJSON = [AnyObject]()
    days.forEach { _, value in
        value.forEach { v in
            asteroidJSON.append(v)
        }
    }
    return asteroidJSON.flatMap {asteroid -> Asteroid? in
        let a: Asteroid? = decode(asteroid)
        return a
    }
}
