//
//  HomeEndPoint.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import Foundation

struct PhotoListEndPoint: BaseEndPointProtocol {

    
    var parameters: [String : Any]?
    
    init(query: String) {
            parameters = ["method":"flickr.photos.search",
                          "api_key":"4f0b01ff599ad962cdacf3dbcb791b2b",
                          "format":"json",
                          "nojsoncallback":"1",
                          "extras":"description,owner_name,date_taken",
                          "text":query,
                          "per_page":"10"]
    }
    
    var baseUrl: String {
        return Links.development
    }
    
    var path: String {
        return "rest/"
    }
    
    var headers: [String : String] {
        return [:]
    }
    
    var httpMethod: HttpMethod{
        return.get
    }
    
    var apiVersion: String {
        return "1.0"
    }
    
    var url: URL {
        return URL.init(string: baseUrl + path)!
    }
    
}
