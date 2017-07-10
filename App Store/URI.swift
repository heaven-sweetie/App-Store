//
//  URI.swift
//  App Store
//
//  Created by ParkSunJae on 2017. 4. 28..
//  Copyright © 2017년 heaven. All rights reserved.
//

import Foundation
import Alamofire

struct URI: URLConvertible {
    let base: String
    let paths: [String]
    
    init(base: String = Constant.itunesBase, paths: [String]) {
        self.base = base
        self.paths = paths
    }
    
    private var string: String {
        return "\(base)/\(paths.joined(separator: "/"))"
    }
    
    // MARK: URLConvertible
    public func asURL() throws -> URL {
        guard let url = URL(string: string) else { throw AFError.invalidURL(url: self) }
        
        return url
    }
}

extension Dictionary {
    func toString(by valueSeparator: String = "=", listSeparator: String? = nil) -> String {
        let stringList = map { "\($0.key)\(valueSeparator)\($0.value)" }
        
        guard let listSeparator = listSeparator else { return stringList.first ?? "" }
        
        return stringList.joined(separator: listSeparator)
    }
}
