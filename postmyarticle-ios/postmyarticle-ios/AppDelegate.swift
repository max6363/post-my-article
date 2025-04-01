//
//  AppDelegate.swift
//  postmyarticle-ios
//
//  Created by MinhazP on 30/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = NavigationProvider.navigationWithInitialVC()
        window?.makeKeyAndVisible()
        return true
    }
    
    
}

class NavigationProvider {
    static func navigationWithInitialVC() -> UINavigationController {
        UINavigationController(rootViewController: root())
    }
    
    private static func root() -> UIViewController {
        //TODO: Add logic to show Login or Post listing based on user session
        PostListingPageBuilder(model: nil).build()
    }
}
