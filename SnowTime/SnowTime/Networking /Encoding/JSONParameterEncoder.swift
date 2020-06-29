//
//  JSONParameterEncoder.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/29/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters:Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("applicaton/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
            }
        }
    }
