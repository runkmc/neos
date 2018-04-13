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

        let viewModel = AsteroidViewModel(asteroid: asteroid)

        XCTAssertEqual(viewModel?.name, "(2013 TN69)")
        XCTAssertEqual(viewModel?.maxMeters, "130 meters")
        XCTAssertEqual(viewModel?.minMeters, "58 meters")
        XCTAssertEqual(viewModel?.maxFeet, "427 feet")
        XCTAssertEqual(viewModel?.minFeet, "191 feet")
        XCTAssertEqual(viewModel?.hazard, "FALSE")
        XCTAssertEqual(viewModel?.approachDate, "2017-10-01")
        XCTAssertEqual(viewModel?.kph, "61,016.1kph")
        XCTAssertEqual(viewModel?.mph, "37,913mph")
        XCTAssertEqual(viewModel?.missDistanceKilometers, "47,764,500")
        XCTAssertEqual(viewModel?.missDistanceMiles, "29,679,484")
        XCTAssertEqual(viewModel?.missDistanceLunar, "124.2")
        XCTAssertEqual(viewModel?.missDistanceAstronomical, "0.319")
    }

}
