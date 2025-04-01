//
//  AppMenu.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 31/03/25.
//

import UIKit

struct MenuItem {
    let title: String
    let image: UIImage?
    let dataVal: Any?
}

extension UIButton {
    typealias MenuSelectionHandler = ((MenuItem) -> Void)
    
    func showMenu(menuItems: [MenuItem], title: String = "", handler: @escaping MenuSelectionHandler) {
        let actions = menuItems.map { item in
            UIAction(title: item.title, image: item.image) { action in
                handler(item)
            }
        }
        
        menu = UIMenu(title: title, children: actions)
        showsMenuAsPrimaryAction = true
    }
}
