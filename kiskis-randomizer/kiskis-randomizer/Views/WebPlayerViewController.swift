//
//  WebPlayerViewController.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import UIKit
import YouTubePlayer

final class WebPlayerViewController: UIViewController {
    
    @IBOutlet private weak var youTubeView: YouTubePlayerView!
    @IBOutlet private weak var playButton: UIButton!
    @IBOutlet private weak var pauseButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var redirectButton: UIButton!
    
    private let service = NetworkService()
    private let redirectPath = "https://theboysnotdead.github.io/kis-kis-randomizer/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youTubeView.loadPlaylistID("PLjcSY85Bp5Q_9A-6lM7hPeur6OeRqsIpz")
        setupRedirectButton()
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        youTubeView.play()
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        youTubeView.pause()
    }
    
    @IBAction func nextButtonPressed(_ sender: UIButton) {
        youTubeView.nextVideo()
    }
    
    @IBAction func redirectButtonPressed(_ sender: UIButton) {
        guard let url = URL(string: redirectPath) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func setupRedirectButton() {
        let title = NSAttributedString(string: "кискис.рф",
                                       attributes: [.underlineStyle: NSUnderlineStyle.patternDash.rawValue])
        redirectButton.setAttributedTitle(title, for: .normal)
    }
}
