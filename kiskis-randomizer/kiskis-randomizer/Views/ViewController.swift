//
//  ViewController.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import UIKit
import AVFoundation

private enum KisKisMember {
    case sonya, alina
    
    var value: String {
        switch self {
        case .sonya: return "sonya"
        case .alina: return "alina"
        }
    }
    
    var image: UIImage {
        return UIImage(named: value) ?? UIImage()
    }
}

private enum Swipes {
    case left, right, tinderQueen
    
    var audioName: String {
        switch self {
        case .left: return "left_swipe"
        case .right: return "right_swipe"
        case .tinderQueen: return "tinder_queen"
        }
    }
}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageBackground: UIImageView!
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    
    private var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.image = KisKisMember.sonya.image
        setupGesture(direction: .left)
        setupGesture(direction: .right)
    }
    
    @IBAction func kiskisButtonPressed(_ sender: Any) {
        playAudioFile(name: Swipes.tinderQueen.audioName)
    }
 
    @IBAction func kiskisMemberChanged(_ sender: Any) {
        UIView.transition(with: imageBackground, duration: 0.5, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.imageBackground.image = self?.segmentControl.selectedSegmentIndex == 0
                ? KisKisMember.sonya.image
                : KisKisMember.alina.image
        })
    }
    
    private func setupGesture(direction: Swipes) {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipe.direction = direction == .left ? .left : .right
        view.addGestureRecognizer(swipe)
    }
    
    @objc private func handleSwipe(swipe: UISwipeGestureRecognizer) {
        if swipe.direction == .right {
            playAudioFile(name: Swipes.right.audioName)
            segmentControl.selectedSegmentIndex = 1
        } else if swipe.direction == .left {
            playAudioFile(name: Swipes.left.audioName)
            segmentControl.selectedSegmentIndex = 0
        }
        kiskisMemberChanged(self)
    }
    
    private func playAudioFile(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else { return }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = audioPlayer else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
