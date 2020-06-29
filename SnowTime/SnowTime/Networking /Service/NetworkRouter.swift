//
//  connectToNetwork.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/29/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation


public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func requset(_ route: EndPoint, completion: @escaping NetworkRouterCompletion)
    func cancel()
}

func getDataForLodges(page:Int, completion: @escaping (_  lodge: [name]?,_ error: string?)->()){
    
}

