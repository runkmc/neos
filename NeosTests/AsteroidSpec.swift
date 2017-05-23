//
//  AsteroidSpec.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import XCTest
@testable import Neos

class AsteroidTest: XCTestCase {
	func testAsteroidCreation() {
       let bundle = Bundle(for: type(of: self))
       let path = bundle.path(forResource: "testfeed", ofType: "json")
       let data = NSData(contentsOfFile: path!)
       let asteroids = jsonParser(data! as Data)
       let asteroid = asteroids[0]
            
       XCTAssertEqual(asteroid?.name, "(2011 EK)")
       XCTAssertEqual(asteroid?.url, "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3558278")
       XCTAssertEqual(asteroid?.estimatedDiameterMaxMeters, 196.8067450894)
       XCTAssertEqual(asteroid?.estimatedDiameterMinMeters, 88.0146520901)
       XCTAssertEqual(asteroid?.estimatedDiameterMaxFeet, 645.6914415591)
       XCTAssertEqual(asteroid?.estimatedDiameterMinFeet, 288.7619911632)
       XCTAssertEqual(asteroid?.hazardous, false)
	}
}
