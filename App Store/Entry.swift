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
    let summary: String
    let price: Object
    let contentType: Object
    let rights: String
    let title: String
    let link: Object
    let id: Object
    let artist: Object
    let category: Object
    let releaseDate: Date
    
    init(map: Mapper) throws {
        try name = map.from("im:name.label")
        try image = map.from("im:image")
        try summary = map.from("summary.label")
        try price = map.from("im:price")
        try contentType = map.from("im:contentType")
        try rights = map.from("rights.label")
        try title = map.from("title.label")
        try link = map.from("link")
        try id = map.from("id")
        try artist = map.from("im:artist")
        try category = map.from("category")
        try releaseDate = map.from("im:releaseDate")
    }
}
