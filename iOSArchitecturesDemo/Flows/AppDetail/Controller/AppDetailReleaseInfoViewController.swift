//
//  AppDetailReleaseInfoViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Karahanyan Levon on 07.07.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailReleaseInfoViewController: UIViewController {
    
    // MARK: - Properties
    
    private let app: ITunesApp
    
    private var appDetailReleaseInfoView: AppDetailReleaseInfoView {
        return self.view as! AppDetailReleaseInfoView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailReleaseInfoView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillData()
    }
    
    // MARK: - Private
    
    private func fillData() {
        self.appDetailReleaseInfoView.versionLabel.text = "Версия " + app.version
        self.appDetailReleaseInfoView.descriptionLabel.text = app.releaseNotes
        self.appDetailReleaseInfoView.dateLabel.text = ""
    }
}
