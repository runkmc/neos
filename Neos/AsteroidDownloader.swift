//
//  AsteroidDownloader.swift
//  Neos
//
//  Created by Kevin McGladdery on 1/17/16.
//  Copyright © 2016 Kevin McGladdery. All rights reserved.
//

import Foundation
import Alamofire

class AsteroidDownloader {
    
    let startDate: NSDate
    let endDate: NSDate
    var requestString: String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let startString = formatter.stringFromDate(startDate)
        let endString = formatter.stringFromDate(endDate)
        return "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(startString)&end_date=\(endString)&api_key=\(ApiKey)"
    }
    
    init(startDate:NSDate, endDate:NSDate) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func download(completionBlock: (response: Response<NSData, NSError>) -> ()) {
        Alamofire.request(.GET, requestString).responseData { response in
            completionBlock(response: response)
        }
    }
}