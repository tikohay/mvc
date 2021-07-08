//
//  SearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchAppRouter: SearchAppRouterInput {
    
    weak var viewController: UIViewController?
    
    func openDetails(for app: ITunesApp) {
        let appDetaillViewController = AppDetailViewController(app: app)
        self.viewController?.navigationController?.pushViewController(appDetaillViewController, animated: true)
    }
    
    func openAppInITunes(_ app: ITunesApp) {
        guard let urlString = app.appUrl, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
