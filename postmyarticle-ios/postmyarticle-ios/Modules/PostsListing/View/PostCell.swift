//
//  PostCell.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

final class PostCell: UITableViewCell {
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var displayNameLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        profileImageView.tintColor = .lightGray
        
        displayNameLabel.text = nil
        usernameLabel.text = nil
        
        descriptionLabel.text = nil
        descriptionLabel.isHidden = true
        
        contentImageView.image = nil
        contentImageView.isHidden = true
    }
    
    func configure(postData: PostModel) {
        if let image = UIImage(systemName: postData.authorThumbnail) {
            profileImageView.image = image
            profileImageView.tintColor = .blue
        }
        displayNameLabel.text = postData.authorDisplayName
        usernameLabel.text = postData.authorUsername
        descriptionLabel.text = postData.description
        descriptionLabel.isHidden = postData.description.isEmpty
        displayNameLabel.isHidden = postData.description.isEmpty
        dateLabel.text = postData.datePosted.formatted()
        contentImageView.image = postData.image
        contentImageView.isHidden = postData.image == nil
    }
}
