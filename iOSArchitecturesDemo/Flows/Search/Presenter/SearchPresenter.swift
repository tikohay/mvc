//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    let interactor: SearchAppInteractorInput
    let router: SearchAppRouterInput

    init(interactor: SearchAppInteractorInput, router: SearchAppRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestApps(with query: String) {
        self.interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        let appdetaillViewController = AppDetailViewController(app: app)
        self.viewInput?.navigationController?.pushViewController(appdetaillViewController, animated: true)
    }
}

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.router.openDetails(for: app)
    }
}
