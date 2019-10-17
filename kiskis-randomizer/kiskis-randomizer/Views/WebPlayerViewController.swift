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
    
    private let service = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        youTubeView.loadPlaylistID("RDA-ouS-cBu8I")
    }
    
    @IBAction func playButtonPressed(_ sender: UIButton) {
        youTubeView.play()
    }
    
    @IBAction func pauseButtonPressed(_ sender: UIButton) {
        youTubeView.pause()
    }
}
