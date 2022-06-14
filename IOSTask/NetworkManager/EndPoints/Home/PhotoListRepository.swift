//
//  PhotoListApi.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import Foundation
import Combine

struct PhotoListRepository {
    
    func searchPhotos(query: String) -> Future<HomeData,Error>{
        return ApiManager().apiCall(endPoint: PhotoListEndPoint.init(query: query))
    }
}

