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
    let author: Author
    let updated: Date
    let rights: String
    let title: String
    let iconURL: URL
    let link: [Object]
    let id: URL
    let entry: [Entry]
    
    init(map: Mapper) throws {
        try author = map.from("feed.author")
        try updated = map.from("feed.updated.label")
        try rights = map.from("feed.rights.label")
        try title = map.from("feed.title.label")
        try iconURL = URL(string: map.from("feed.icon.label"))!
        try link = map.from("feed.link")
        try id = map.from("feed.id.label")
        do {
        try entry = map.from("feed.entry")
        } catch {
            print("Error: \(error)")
            entry = [Entry]()
        }
    }
}
