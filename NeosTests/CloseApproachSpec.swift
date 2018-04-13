//
//  CloseApproachSpec.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import XCTest
@testable import Neos

class CloseApproachTest: XCTestCase {

	func testCloseApproachCreation() {
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "testfeed", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let asteroids = jsonParser(data! as Data)
        let asteroid = asteroids[0]
        
        let approach = asteroid?.closeApproach[0]
        
        XCTAssertEqual(approach?.date, "2017-10-01")
        XCTAssertEqual(approach?.relativeVelocity.kilometersPerHour, "61016.1139399712")
        XCTAssertEqual(approach?.relativeVelocity.milesPerHour, "37913.0403534227")
        XCTAssertEqual(approach?.missDistance.kilometers, "47764500")
        XCTAssertEqual(approach?.missDistance.miles, "29679484")
        XCTAssertEqual(approach?.missDistance.lunar, "124.2022399902")
        XCTAssertEqual(approach?.missDistance.astronomical, "0.3192859737")
    }

}
