//
//  BaseEndPointProtocol.swift
//  ApiDataStrategy
//
//  Created by 2p on 3/15/22.
//

import Foundation

protocol BaseEndPointProtocol{
    var httpMethod: HttpMethod {get}
    var parameters: [String: Any]? {get}
    var headers: [String: String]{get}
    var path: String {get}
    var baseUrl: String {get}
    var apiVersion: String {get}
    var url: URL {get}
}



enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case update = "UPDATE"
}
