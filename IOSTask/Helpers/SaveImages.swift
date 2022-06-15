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
    
    func saveImage(image: String,filename: String) -> Future<Bool,Error> {
        
        Future{ promis in
            
                let pdfData = Data(base64Encoded: image)
                let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
                let pdfNameFromUrl = "\(filename)"
                let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
                print(actualPath)
                do {
                    try pdfData?.write(to: actualPath, options: .atomic)
                } catch {
                    
                }
            }
    }
}
