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
        
        XCTAssertEqual(asteroid?.name, "(2013 TN69)")
        XCTAssertEqual(asteroid?.url.absoluteString, "http://ssd.jpl.nasa.gov/sbdb.cgi?sstr=3650046")
        XCTAssertEqual(asteroid?.estimatedDiameter.meters.max, 130.0289270043)
        XCTAssertEqual(asteroid?.estimatedDiameter.meters.min, 58.1507039646)
        XCTAssertEqual(asteroid?.estimatedDiameter.feet.max, 426.6041048727)
        XCTAssertEqual(asteroid?.estimatedDiameter.feet.min, 190.7831555951)
        XCTAssertEqual(asteroid?.hazardous, false)
	}

}
