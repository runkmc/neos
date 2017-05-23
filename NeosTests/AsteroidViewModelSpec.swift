//
//  AsteroidViewModelSpec.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/22/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import XCTest
@testable import Neos

class AsteroidViewModelTest: XCTestCase {
	func testAsteroidViewModelCreation() {
		let bundle = Bundle(for: type(of: self))
		let path = bundle.path(forResource: "testfeed", ofType: "json")
		let data = NSData(contentsOfFile: path!)
		let asteroids = jsonParser(data! as Data)
		let asteroid = asteroids[0]
		let viewModel = AsteroidViewModel(asteroid:asteroid)
		
		XCTAssertEqual(viewModel?.name, "(2011 EK)")
		XCTAssertEqual(viewModel?.maxMeters, "197 meters")
		XCTAssertEqual(viewModel?.minMeters, "88 meters")
		XCTAssertEqual(viewModel?.maxFeet, "646 feet")
		XCTAssertEqual(viewModel?.minFeet, "289 feet")
		XCTAssertEqual(viewModel?.hazard, "FALSE")
		XCTAssertEqual(viewModel?.approachDate, "2016-01-17")
		XCTAssertEqual(viewModel?.kph, "53,497.8kph")
		XCTAssertEqual(viewModel?.mph, "33,241.4mph")
		XCTAssertEqual(viewModel?.missDistanceKilometers, "52,985,684")
		XCTAssertEqual(viewModel?.missDistanceMiles, "32,923,778")
		XCTAssertEqual(viewModel?.missDistanceLunar, "137.78")
		XCTAssertEqual(viewModel?.missDistanceAstronomical, "0.354")
	}
}
