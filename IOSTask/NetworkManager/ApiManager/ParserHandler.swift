//
//  ParserHandlerProtocol.swift
//  ApiDataStrategy
//
//  Created by 2p on 3/15/22.
//

import Foundation

class ParserHandler {
    func parserHandler<T: Codable>(parsefrom data:Data) -> Result<T,Error>{
   
        print(data)
        do{
            let object = try JSONDecoder().decode(T.self, from: data)
            print(object)
            return .success(object)
        }catch{
            print(error)
            return .failure(error)
       }
    }
}

