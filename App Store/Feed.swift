//
//  Feed.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 23..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

struct Feed: Mappable {
    let entry: [Entry]
    
    init(map: Mapper) throws {
        try entry = map.from(Constant.path([Constant.feed, Constant.entry]))
    }
}
