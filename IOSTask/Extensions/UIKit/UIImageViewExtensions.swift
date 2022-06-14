//
//  UIImageViewExtensions.swift
//  Gamers
//
//  Created by Mostafa Muhammad on 16/04/2022.
//

import UIKit

var imageCashe = NSCache<AnyObject, AnyObject>()


extension UIImageView{
    
   
    // set image from url
    func setImage(url: String){
        if url != ""{
            if let image = imageCashe.object(forKey: url as AnyObject) as? UIImage{
                self.image = image
            }
            else{
                let safeUrl = url.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!
                if URL(string: safeUrl) != nil{
                    let imgURL: URL = URL(string: safeUrl)!
                    let session = URLSession.shared
                    session.dataTask(with: imgURL, completionHandler:
                        { (data :Data?, response :URLResponse?, error:Error?) in
                            if (error == nil && data != nil)
                            {
                                DispatchQueue.main.sync(execute: {
                                    if UIImage(data: data!) != nil{
                                        let image = UIImage(data: data!)
                                        imageCashe.setObject(image!, forKey: url as AnyObject)
                                        self.image = image
                                    }
                                })
                            }
                    }).resume()
                }
            }
        }
    }
}
