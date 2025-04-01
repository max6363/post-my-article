//
//  ProfileModel+Menu.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 01/04/25.
//

import UIKit

extension [ProfileModel] {
    func menuDisplayable() -> [MenuItem] {
        map({
            MenuItem(
                title: $0.displayName,
                image: UIImage(systemName: $0.profileThumbnail),
                dataVal: $0)
        })
    }
}
