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
    
    let startDate: Date
    let endDate: Date
    var requestString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let startString = formatter.string(from: startDate)
        let endString = formatter.string(from: endDate)
        return "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(startString)&end_date=\(endString)&api_key=\(ApiKey)"
    }
    
    init(startDate:Date, endDate:Date) {
        self.startDate = startDate
        self.endDate = endDate
    }
    
    func download(_ completionBlock: (_ response: Response<NSData, NSError>) -> ()) {
        Alamofire.request(.GET, requestString).responseData { response in
            completionBlock(response: response)
        }
    }
}
