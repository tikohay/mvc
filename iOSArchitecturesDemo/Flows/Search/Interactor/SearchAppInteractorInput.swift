//
//  SearchInteractorInput.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Alamofire

protocol SearchAppInteractorInput {
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}
