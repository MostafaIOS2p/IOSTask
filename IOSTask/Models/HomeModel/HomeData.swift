//
//  HomeModel.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import Foundation

// MARK: - HomeData
struct HomeData :Codable{
    let photos: Photos
    let stat: String
}

// MARK: - Photos
struct Photos :Codable{
    let page, pages, perpage, total: Int
    let photo: [Photo]
}

// MARK: - Photo
struct Photo :Codable{
    let id, owner, secret, server: String
    let farm: Int
    let title: String
    let ispublic, isfriend, isfamily: Int
    let description: Description
    let datetaken: String
    let datetakengranularity: Int
    let datetakenunknown, ownername: String
}

// MARK: - Description
struct Description: Codable {
    let content: String
    enum CodingKeys: String, CodingKey {
        case content = "_content"
    }
}
