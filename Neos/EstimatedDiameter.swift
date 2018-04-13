//
// Created by Scott Densmore on 10/18/17.
// Copyright (c) 2017 Scott Densmore. All rights reserved.
//

import Foundation

struct EstimatedDiameter : Codable {

    let kilometers: EstimatedDiameterInfo
    let meters: EstimatedDiameterInfo
    let miles: EstimatedDiameterInfo
    let feet: EstimatedDiameterInfo

}