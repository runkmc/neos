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
        let path = bundle.path(forResource:"testfeed", ofType: "json")
        let data = NSData(contentsOfFile: path!)
        let asteroids = jsonParser(data! as Data)
        let approach = asteroids[0]?.approach[0]
            
        XCTAssertEqual(approach?.closeApproachDate, "2016-01-17")
		XCTAssertEqual(approach?.kph, "53497.777455211")
		XCTAssertEqual(approach?.mph, "33241.4384415448")
		XCTAssertEqual(approach?.missDistanceKilometers, "52985684")
		XCTAssertEqual(approach?.missDistanceMiles, "32923778")
		XCTAssertEqual(approach?.missDistanceLunar, "137.7789154053")
		XCTAssertEqual(approach?.missDistanceAstronomical, "0.354187416")
	}
}

//class CloseApproachSpec: QuickSpec {
//    override func spec() {
//        describe("A close approach") {
//            let bundle = Bundle(for: type(of: self))
//            let path = bundle.path(forResource:"testfeed", ofType: "json")
//            let data = NSData(contentsOfFile: path!)
//            let asteroids = jsonParser(data! as Data)
//            let approach = asteroids[0]?.approach[0]
//            
//            it("stores its properties") {
//                expect(approach?.closeApproachDate) == "2016-01-17"
//                expect(approach?.kph) == "53497.777455211"
//                expect(approach?.mph) == "33241.4384415448"
//                expect(approach?.missDistanceKilometers) == "52985684"
//                expect(approach?.missDistanceMiles) == "32923778"
//                expect(approach?.missDistanceLunar) == "137.7789154053"
//                expect(approach?.missDistanceAstronomical) == "0.354187416"
//            }
//        }
//    }
//}
