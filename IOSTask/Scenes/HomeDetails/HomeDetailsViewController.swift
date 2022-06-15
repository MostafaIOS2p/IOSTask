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
    @IBAction func shareClicked(_ sender: UIBarButtonItem) {
        shareTo(activityItems: [homeImageView.image ?? UIImage()])
    }
    @IBAction func closeClicked(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
