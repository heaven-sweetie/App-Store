//
//  Entry.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 23..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

struct Entry: Mappable {
    let name: String
    let image: [Object]
    let title: String
    let id: Object
    
    var detail: AppDetail?
    
    init(map: Mapper) throws {
        try name = map.from(Constant.path([Constant.name, Constant.label]))
        try image = map.from(Constant.image)
        try title = map.from(Constant.path([Constant.title, Constant.label]))
        try id = map.from(Constant.id)
    }
}
