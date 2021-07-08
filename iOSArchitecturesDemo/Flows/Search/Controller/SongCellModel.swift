//
//  SongCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

struct SongCellModel {
    var trackName: String
    var artistName: String?
    var collectionName: String?
    var artwork: String?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        
        return SongCellModel(trackName: model.trackName, artistName: model.artistName, collectionName: model.collectionName, artwork: model.artwork)
    }
}
