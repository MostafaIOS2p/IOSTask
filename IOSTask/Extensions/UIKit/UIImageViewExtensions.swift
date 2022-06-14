//
//  UIImageViewExtensions.swift
//  Gamers
//
//  Created by Mostafa Muhammad on 16/04/2022.
//

import UIKit

var imageCashe = NSCache<AnyObject, AnyObject>()
extension UIImageView{
    
    // set image from image name
    func setImage(forName name: String){
        self.image = UIImage(named: name)
    }
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
    // convert image to base64 string
    func toBase64() -> String{
        let imageData = self.image!.jpegData(compressionQuality: 0.0)!
        return imageData.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
    }
    
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    func blur(withStyle style: UIBlurEffect.Style = .light) {
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        addSubview(blurEffectView)
        clipsToBounds = true
    }

    ///   Blurred version of an image view.
    /// - Parameter style: UIBlurEffectStyle (default is .light).
    /// - Returns: blurred version of self.
    func blurred(withStyle style: UIBlurEffect.Style = .light) -> UIImageView {
        let imgView = self
        imgView.blur(withStyle: style)
        return imgView
    }
    
//    @IBInspectable var lImage: String {
//        get {
//            return self.lImage
//        }
//        set {
//            image = UIImage(named: LanguageHelper.getStrings(forKey: newValue))
//        }
//    }
}
