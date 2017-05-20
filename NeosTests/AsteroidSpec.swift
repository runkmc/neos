//
//  AsteroidSpec.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Curry
import Runes
import Argo
@testable import Neos

class AsteroidSpec: QuickSpec {
    override func spec() {
        describe("Creating an asteroid") {
            let bundle = Bundle(for: type(of: self))
            let path = bundle.path(forResource: "testfeed", ofType: "json")
            let data = NSData(contentsOfFile: path!)
            let asteroids = jsonParser(data! as Data)
            let asteroid = asteroids[0]
            
            it("stores its properties") {
                expect(asteroid?.name) == "(2011 EK)"
                expect(asteroid?.url) == "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3558278"
                expect(asteroid?.estimatedDiameterMaxMeters) == 196.8067450894
                expect(asteroid?.estimatedDiameterMinMeters) == 88.0146520901
                expect(asteroid?.estimatedDiameterMaxFeet) == 645.6914415591
                expect(asteroid?.estimatedDiameterMinFeet) == 288.7619911632
                expect(asteroid?.hazardous) == false
            }
        }
    }
}
