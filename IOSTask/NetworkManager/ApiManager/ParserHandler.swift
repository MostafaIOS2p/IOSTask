//
//  ParserHandlerProtocol.swift
//  ApiDataStrategy
//
//  Created by 2p on 3/15/22.
//

import Foundation

struct ParserHandler {
    
    func parserHandler<T: Codable>(parsefrom data:Data) -> Result<T,Error>{
        do{
            let object = try JSONDecoder().decode(T.self, from: data)
            return .success(object)
        }catch{
            return .failure(error)
       }
    }
}

