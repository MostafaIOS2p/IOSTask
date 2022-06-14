//
//  SaveImages.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 14/06/2022.
//

import Foundation
import UIKit
import Combine
struct saveImages{
    
    func saveImage(image: UIImage,filename: String) -> Future<Bool,Error> {
        
        Future{ promis in
            guard let data = image.jpegData(compressionQuality: 1) else {
                return promis(.failure("image data error" as! Error))
            }
            guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
                return promis(.failure("directory path error" as! Error))
            }
            do {
                try data.write(to: directory.appendingPathComponent("\(filename).png")!)
                return promis(.success(true))
            } catch {
                return promis(.failure(error.localizedDescription as! Error))
            }
        }

    }
}
