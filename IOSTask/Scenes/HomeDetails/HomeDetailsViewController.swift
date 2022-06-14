//
//  HomeDetailsViewController.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 14/06/2022.
//

import UIKit
import Combine

class HomeDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var homeImageView: UIImageView!

    var photoDetails: Photo?
    var imageUrl: String?
    private var bindings = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageUrl = ConfigureImageURL().createImageUrl(photoData: photoDetails!)
        homeImageView.setImage(url: imageUrl ?? "")
    }
    @IBAction func downloadClicked(_ sender: UIBarButtonItem) {
        saveImages().saveImage(image: homeImageView.image ?? UIImage(), filename: imageUrl ?? "").sink { [unowned self] completion in
            switch completion{
            case .failure(let error):
                showAlert(title: "Alert", message: error.localizedDescription, buttonTitle: "Ok")
            case.finished:
                break
            }
        } receiveValue: { [unowned self] value in
            showAlert(title: "Alert", message: "image saved successfully", buttonTitle: "Ok")
        }.store(in: &bindings)

    }
    @IBAction func shareClicked(_ sender: UIBarButtonItem) {
        shareTo(activityItems: [imageUrl ?? ""])
    }
    @IBAction func closeClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
