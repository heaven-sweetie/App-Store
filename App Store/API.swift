//
//  API.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

import Alamofire

typealias ClosureType<Type> = (Type) -> Swift.Void

struct API {
    func requestTopFreeApps(completion: @escaping ClosureType<Feed>) {
        Alamofire.request("https://itunes.apple.com/kr/rss/topfreeapplications/limit=50/genre=6015/json")
            .responseJSON { response in
                guard let resultValue = response.result.value else { return }
                guard let feed = Feed.from(resultValue as! NSDictionary) else { return }
                
                completion(feed)
        }
    }
}
