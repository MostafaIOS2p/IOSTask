//
//  PhotoListApi.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import Foundation
import Combine


class PhotoListRepository {
    
    
    
    func searchPhotos(query: String) -> Future<HomeModel,Error>{
        return ApiManager().apiCall(endPoint: PhotoListEndPoint.init(query: query))
    }
}

