//
//  API.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

import Alamofire

enum APIError: Error {
    case invalidResponseValueType(expectd: Any.Type, received: Any.Type)
    case invalidResponseValue(Any)
}

typealias ResultClosure<Type> = (Result<Type>) -> Swift.Void

struct API {
    func requestTopFreeApps(completion: @escaping ResultClosure<Feed>) {
        Alamofire.request(URI(paths: [Constant.countryKorea, Constant.rss, Constant.topfreeapplications,
                                      [Constant.limit: Constant.defaultInit].toString(),
                                      [Constant.genre: Constant.financeCode].toString(), Constant.json]))
            .responseJSON { response in
                if let error = response.result.error, response.result.isFailure {
                   completion(Result(error: error))
                    return
                }
                
                guard let resultValue = response.result.value,
                    let resultDictionary = resultValue as? NSDictionary else {
                        let error = APIError.invalidResponseValueType(expectd: NSDictionary.self, received: type(of: response.result.value))
                        completion(Result(error: error))
                        return
                }
                
                guard let feed = Feed.from(resultDictionary) else {
                    completion(Result(error: APIError.invalidResponseValue(resultDictionary)))
                    return
                }
                
                completion(Result(value: feed))
        }
    }
    
    func requestAppDetail(by appId: String, completion: @escaping ResultClosure<AppDetail>) {
        Alamofire.request(URI(paths: [Constant.lookup]),
                          method: .get,
                          parameters: [Constant.id: appId, Constant.country: Constant.countryKorea])
            .responseJSON { response in
                if let error = response.result.error, response.result.isFailure {
                    completion(Result(error: error))
                    return
                }
                
                guard let resultValue = response.result.value as? [String: Any] else {
                    let error = APIError.invalidResponseValueType(expectd: [String: Any].self, received: type(of: response.result.value))
                    completion(Result(error: error))
                    return
                }
                
                guard let results = resultValue[Constant.results] as? [[String: Any]],
                let appDetailDictionary = results.first as NSDictionary?,
                let appDetail = AppDetail.from(appDetailDictionary) else {
                    completion(Result(error: APIError.invalidResponseValue(resultValue)))
                    return
                }
                
                completion(Result(value: appDetail))
        }
    }
}
