//
//  ProfileButton.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

final class ProfileButton: UIButton {
    
    private let profileImageView = UIImageView()
    private let titleLabelView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        profileImageView.isUserInteractionEnabled = false
        titleLabelView.isUserInteractionEnabled = false
        
        // Configure image view
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = Constants.imageSize / 2 // Adjust according to image size
        
        // Configure label
        titleLabelView.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        titleLabelView.textColor = .black
        titleLabelView.textAlignment = .center
        
        // Arrange subviews vertically
        let stackView = UIStackView(arrangedSubviews: [profileImageView, titleLabelView])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 2
        stackView.isUserInteractionEnabled = false
        
        // Add stackView to button
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize),
            profileImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize)
        ])
    }
    
    // Configure the button content
    func configure(image: UIImage?, title: String) {
        profileImageView.image = image
        titleLabelView.text = title
    }
    
    enum Constants {
        static let imageSize: CGFloat = 25
    }
}
