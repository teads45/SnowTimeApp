//
//  NetworkMAnager.swift
//  SnowTime
//
//  Created by Thomas Eads on 6/29/20.
//  Copyright © 2020 Thomas Eads. All rights reserved.
//

import Foundation

struct NetworkManager {
    
    static let environment: NetworkEnvironment = .production
    static let YelpAPIKey = "thbwyY1lg0-9YAYhUpKYDlSgpJhJkrZQgQv1VYUJkDljgZUlw-wKU9i_nEUeNLwF01n8S4IovCt8vTWzi1iTdjdvhJemzapfWmEWLLPhdfxbu64YXMgOGFTO8IrzXnYx'"
    private let router = Router<YelpAPIKey>()
    
    
    enum NetworkResponse:String {
        case success
        case authenticationError = "need to be authenticated first"
        case badRequest = "badRequest"
        case outdated = "outdated URL"
        case failed = "network request failed"
        case noData = "no data returned to decode"
        case unableToDecode = "could not decode response"
    }
    enum Result<String>{
        case success
        case failure(String)
    }
}

fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
switch response.statusCode {
case 200...299: return .success
case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
case 600: return .failure(NetworkResponse.outdated.rawValue)
default: return .failure(NetworkResponse.failed.rawValue)
    }
    
}

func getLodges(completion: @escaping (_ lodge: [name]?,_ error:String?)->()){
    router.request(.skiLodges(page:page)){ data, response, error in
        if error!=nil {
            completion(nil, "please check your network connection")
        }
        if let response = response as? HTTPURLResponse {
            let result = self.handleNEtworkResponse(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                return
                }
                do { let apiResponse = try JSONDecoder().decode(MovieApiResponse.self, from: responseData)
                    completion(apiResponse.lodges,nil)
                } catch {
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let networkFailureError):
                completion(nil, networkFailureError)
                    
                }
            }
        }
    }

