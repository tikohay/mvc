//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 08.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class SongCell: UITableViewCell {
    
    var trackName: String?
    var artistName: String?
    var collectionName: String?
    
    private(set) lazy var trackNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var musicImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "music.note")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureUI()
    }
    
    func configure(with cellModel: SongCellModel) {
        self.trackNameLabel.text = cellModel.trackName
        self.artistNameLabel.text = cellModel.artistName
        self.collectionNameLabel.text = cellModel.collectionName
    }
    
    override func prepareForReuse() {
        [self.trackNameLabel, self.artistNameLabel, self.collectionNameLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addMusicImage()
        self.addTrackNameLabel()
        self.addArtistNameLabel()
        self.addCollectionNameLabel()
    }
    
    private func addMusicImage() {
        self.contentView.addSubview(self.musicImage)
        NSLayoutConstraint.activate([
            self.musicImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.musicImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            self.musicImage.heightAnchor.constraint(equalToConstant: 20),
            self.musicImage.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func addTrackNameLabel() {
        self.contentView.addSubview(self.trackNameLabel)
        NSLayoutConstraint.activate([
            self.trackNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.trackNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            self.trackNameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20.0)
        ])
    }
    
    private func addArtistNameLabel() {
        self.contentView.addSubview(self.artistNameLabel)
        NSLayoutConstraint.activate([
            self.artistNameLabel.topAnchor.constraint(equalTo: trackNameLabel.bottomAnchor, constant: 4),
            self.artistNameLabel.leftAnchor.constraint(equalTo: trackNameLabel.leftAnchor),
            self.artistNameLabel.trailingAnchor.constraint(equalTo: trackNameLabel.trailingAnchor)
        ])
    }
    
    private func addCollectionNameLabel() {
        self.contentView.addSubview(self.collectionNameLabel)
        NSLayoutConstraint.activate([
            self.collectionNameLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 4),
            self.collectionNameLabel.leftAnchor.constraint(equalTo: artistNameLabel.leftAnchor),
            self.collectionNameLabel.trailingAnchor.constraint(equalTo: artistNameLabel.trailingAnchor)
        ])
    }
}
