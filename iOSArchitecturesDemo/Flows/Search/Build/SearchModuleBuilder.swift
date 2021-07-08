//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class SearchModuleBuilder {
    
    static func buildAppVC() -> (UIViewController & SearchViewInput) {
        let router = SearchAppRouter()
        let interactor = SearchAppInteractor()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        router.viewController = viewController
        
        return viewController
    }
    
    static func buildSongVC() -> (UIViewController & SearchSongViewInput) {
        let interactor = SearchSongInteractor()
        let presenter = SearchSongPresenter(interactor: interactor)
        let viewController = SearchSongViewController(presenter: presenter)
        presenter.viewInput = viewController
        
        return viewController
    }
}
