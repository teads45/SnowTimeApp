//
//  EndPointType.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/29/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation
protocol EndPointType {
    var baseURL: URL{get}
    var path: string {get}
    var httpMethod: HTTPMEthod {get}
    var task: HHTPTask {get}
    var headers: HTTPHeaders? {get}
}
