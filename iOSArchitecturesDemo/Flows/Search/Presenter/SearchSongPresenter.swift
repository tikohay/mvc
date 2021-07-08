//
//  SearchSongPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SearchSongPresenter {
    
    weak var viewInput: (UIViewController & SearchSongViewInput)?
    
    let interactor: SearchSongInteractor
    
    init(interactor: SearchSongInteractor) {
        self.interactor = interactor
    }
    
    private func requestSong(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        self.viewInput?.throbber(show: false)
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                    self.viewInput?.throbber(show: false)
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
}

extension SearchSongPresenter: SearchSongViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestSong(with: query)
    }
}
