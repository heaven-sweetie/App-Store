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
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                guard let resultValue = response.result.value,
                    let resultDictionary = resultValue as? NSDictionary, let feed = Feed.from(resultDictionary) else { return }
                
                completion(feed)
        }
    }
    
    func requestAppDetail(by appId: String, completion: @escaping ClosureType<AppDetail>) {
        let urlParams = ["id": appId, "country": "kr"]
        Alamofire.request("https://itunes.apple.com/lookup", method: .get, parameters: urlParams)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                guard let resultValue = response.result.value,
                    let resultDictionary = resultValue as? [String: Any],
                    let results = resultDictionary["results"],
                    let resultArray = results as? [[String: Any]],
                    let appDetailDictionary = resultArray.first as NSDictionary?,
                    let appDetail = AppDetail.from(appDetailDictionary) else { return }
                
                completion(appDetail)

        }
    }
}
