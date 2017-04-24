//
//  Date+Mapper.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

extension Date: Convertible {
    public static func fromMap(_ value: Any) throws -> Date {
        let dateFormatter = DateFormatter()
        
        if let stringValue = value as? String {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-mm:ss"
            guard let date = dateFormatter.date(from: stringValue) else { throw MapperError.convertibleError(value: value, type: Date.self) }
            
            return date
        } else if let dictionaryValue = value as? [String: Any], let dateValue = dictionaryValue["label"] as? String {
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-mm:ss"
            guard let date = dateFormatter.date(from: dateValue) else { throw MapperError.convertibleError(value: value, type: Date.self) }
            
            return date
        } else {
            throw MapperError.convertibleError(value: value, type: Date.self)
        }
    }
}
