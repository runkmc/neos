//
//  jsonParser.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation

func jsonParser(_ data:Data) -> [Asteroid?] {
    let decoder = JSONDecoder()
    let pagedAsteroids = try! decoder.decode(PagedAsteroids.self, from: data)

    var asteroids = [Asteroid?]()
    
    let sortedAsteroids = pagedAsteroids.asteroids.sorted(by: { $0.0 < $1.0 })
    sortedAsteroids.forEach { _, value in
        value.forEach { v in
            asteroids.append(v)
        }
    }
    
    return asteroids
}
