//
//  SearchSongViewOutput.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol SearchSongViewOutput: class {
    
    func viewDidSearch(with query: String)
}
