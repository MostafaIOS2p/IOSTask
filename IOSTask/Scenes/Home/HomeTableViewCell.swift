//
//  HomeTableViewCell.swift
//  IOSTask
//
//  Created by Mostafa Muhammad on 13/06/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var imageTitleLabel: UILabel!
    @IBOutlet weak var autherNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var imageDescriptionLabel: UILabel!
    
    var photoDetails: Photo!{
        didSet{
            autherNameLabel.text = photoDetails.ownername
            imageTitleLabel.text = photoDetails.title
            imageDescriptionLabel.text = photoDetails.description.content
            postDateLabel.text = changeDateFromatter(fromFromate: "yyyy-MM-dd HH:mm:ss", toFormate: "dd-MM-yyyy", selectedDate: photoDetails.datetaken)
            let imageUrl = ConfigureImageURL().createImageUrl(photoData: photoDetails)
            homeImageView.image = nil
            homeImageView.setImage(url: imageUrl)
        }
    }
    
}
