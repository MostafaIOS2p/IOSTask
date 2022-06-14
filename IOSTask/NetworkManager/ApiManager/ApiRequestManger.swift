//
//  ApiRequestManger.swift
//  ApiDataStrategy
//
//  Created by 2p on 3/15/22.
//

import Foundation
import Alamofire
import Combine

protocol ApiManagerProtocol {
    func apiCall<T: Codable>(endPoint: BaseEndPointProtocol) -> Future<T, Error>
}

class ApiManager: ApiManagerProtocol {
    
    let parser = ParserHandler.init()
    var errorHandler: ErrorHandlerProtocol!
    
    
    func apiCall<T: Codable>(endPoint: BaseEndPointProtocol) -> Future<T, Error>  {
        let url = endPoint.url
        let parameters = endPoint.parameters
        let headers = HTTPHeaders.init(endPoint.headers)
        let method = HTTPMethod.init(rawValue: endPoint.httpMethod.rawValue)
        
        return Future { completion in
            AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseData { response in
                switch response.result {
                case .success(let data):
                    print(data)
                    let parserResult: Result<T,Error> = self.parser.parserHandler(parsefrom: data)
                    switch parserResult {
                    case .success(let object):
                        print(object)
                        completion(.success(object))
                    case .failure(let error):
                        completion(.failure(error))
                        break
                    }
                    break
                case .failure(let error):
                        completion(.failure(error))
                    break
                }
            }
            
        }
        
        
        
        
        
    }
}
