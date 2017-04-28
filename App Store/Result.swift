//
//  Result.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 28..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation

enum Result<Type> {
    case success(Type)
    case failure(Error)
    
    public init(value: Type) {
        self = .success(value)
    }
    
    public init(error: Error) {
        self = .failure(error)
    }
}

