//
//  SearchRouterInput.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SearchAppRouterInput {
    
    func openDetails(for app: ITunesApp)
    
    func openAppInITunes(_ app: ITunesApp)
}

