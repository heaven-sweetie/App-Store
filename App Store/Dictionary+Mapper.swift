//
//  Dictionary+Mapper.swift
//  AppStore
//
//  Created by ParkSunJae on 2017. 4. 24..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Mapper

extension Dictionary: Convertible {
    public static func fromMap(_ value: Any) throws -> Dictionary {
        guard let dictionary = value as? Dictionary else {
            throw MapperError.convertibleError(value: value, type: [String: Any].self)
        }
        
        return dictionary
    }
}
