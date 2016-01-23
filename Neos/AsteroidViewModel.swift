//
//  AsteroidViewModel.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/22/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation

struct AsteroidViewModel {
    
    let name: String
    
    init?(asteroid:Asteroid?) {
        guard let asteroid = asteroid else {
            return nil
        }
        self.name = asteroid.name
    }
}