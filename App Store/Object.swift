//
//  Object.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

struct Object: Mappable {
    let label: String?
    let attributes: [String: Any]
    
    init(map: Mapper) throws {
        label = map.optionalFrom("label")
        try attributes = map.from("attributes")
    }
}
