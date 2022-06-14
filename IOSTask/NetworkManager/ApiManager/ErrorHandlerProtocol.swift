//
//  ErrorHandlerProtocol.swift
//  ApiDataStrategy
//
//  Created by 2p on 3/15/22.
//

import Foundation

protocol ErrorHandlerProtocol {
    func handleError(error: Error)
}

enum CustomError: Error {
    case parseingError
    case networkError
}
