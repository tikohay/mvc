//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class AppStartManager {
    
    var window: UIWindow?
    
    private let searchAppVC = SearchModuleBuilder.buildAppVC()
    private let searchSongVC = SearchModuleBuilder.buildSongVC()
    
    private let tabBarController: UITabBarController = {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .black
        tabBarController.tabBar.backgroundColor = .white
        return tabBarController
    }()
    
    private let appImage = UIImage(systemName: "gamecontroller.fill")
    private let songImage = UIImage(systemName: "music.note")
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        tabBarController.viewControllers = [generateNavigationController(rootViewController: searchAppVC,title: "app", image: appImage!),
                                            generateNavigationController(rootViewController: searchSongVC, title: "song", image: songImage!)]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
    private func configureNavigaionController(rootVC: UIViewController) -> UINavigationController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationItem.title = "Search via iTunes"
        return navVC
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = configureNavigaionController(rootVC: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
