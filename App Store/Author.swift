//
//  Author.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 23..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

struct Author: Mappable {
    let name: String
    let uri: String
    
    init(map: Mapper) throws {
        try name = map.from("name.label")
        try uri = map.from("uri.label")
    }
}
