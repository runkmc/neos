//
//  AsteroidDownloaderSpec.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Neos

class AsteroidDownloaderSpec: QuickSpec {
    override func spec() {
        describe("The Downloader") {
            let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            let startComps = NSDateComponents()
            startComps.year = 1990
            startComps.month = 6
            startComps.day = 18
            let startDate = calendar!.dateFromComponents(startComps)!
            
            let endComps = NSDateComponents()
            endComps.year = 1990
            endComps.month = 9
            endComps.day = 24
            let endDate = calendar!.dateFromComponents(endComps)!
            let downloader = AsteroidDownloader(startDate: startDate, endDate: endDate)
            
            it("generates the correct request") {
                expect(downloader.requestString) == "https://api.nasa.gov/neo/rest/v1/feed?start_date=1990-06-18&end_date=1990-09-24&api_key=\(ApiKey)"
            }
        }
    }
}