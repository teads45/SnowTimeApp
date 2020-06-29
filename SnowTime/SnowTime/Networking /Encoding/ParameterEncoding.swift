//
//  ParameterEncoding.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/29/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
public typealias Parameters = [String:Any]

public protocol ParameterEncoder {
 static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
public enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
    
}
