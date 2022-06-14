//
//  ConfigureImageURL.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 14/06/2022.
//

import Foundation

struct ConfigureImageURL{
    
    func createImageUrl(photoData: Photo) -> String{
        let imageUrl = "https://farm\(photoData.farm).staticflickr.com/\(photoData.server)/\(photoData.id)_\(photoData.secret)_w.jpg"
        return imageUrl
    }
}
