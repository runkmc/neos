//
//  AsteroidViewModelSpec.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/22/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Neos

class AsteroidViewModelSpec: QuickSpec {
    override func spec() {
        describe("The AsteroidViewModel") {
            let bundle = NSBundle(forClass: self.dynamicType)
            let path = bundle.pathForResource("testfeed", ofType: "json")
            let data = NSData(contentsOfFile: path!)
            let asteroids = jsonParser(data!)
            let asteroid = asteroids[0]
            let viewModel = AsteroidViewModel(asteroid:asteroid)
            it("formats all properties correctly") {
                expect(viewModel?.name) == "(2011 EK)"
                expect(viewModel?.maxMeters) == "197 meters"
                expect(viewModel?.minMeters) == "88 meters"
                expect(viewModel?.maxFeet) == "646 feet"
                expect(viewModel?.minFeet) == "289 feet"
                expect(viewModel?.hazard) == "FALSE"
                expect(viewModel?.approachDate) == "2016-01-17"
                expect(viewModel?.kph) == "53,497.8kph"
                expect(viewModel?.mph) == "33,241.4mph"
                expect(viewModel?.missDistanceKilometers) == "52,985,684"
                expect(viewModel?.missDistanceMiles) == "32,923,778"
            }
        }
    }
}