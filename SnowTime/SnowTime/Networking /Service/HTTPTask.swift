//
//  HTTPTask.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/29/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
public typealias HTTPHeaders = [String:String]
public enum HTTPTask{
    case request
    case requestParameters(bodyParameters: Paramaters?,
        urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionalHeaders: HTTPHeaders?)
    //case down/upload etc.
}
