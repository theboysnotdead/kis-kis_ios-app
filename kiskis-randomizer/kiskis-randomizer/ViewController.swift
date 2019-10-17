//
//  ViewController.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import UIKit

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

final class ViewController: UIViewController {
    
    @IBOutlet private weak var imageBackground: UIImageView!
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageBackground.image = KisKisMember.sonya.image
    }
    
    @IBAction func kiskisMemberChanged(_ sender: Any) {
        UIView.transition(with: imageBackground, duration: 0.5, options: .transitionCrossDissolve, animations: { [weak self] in
            self?.imageBackground.image = self?.segmentControl.selectedSegmentIndex == 0
                ? KisKisMember.sonya.image
                : KisKisMember.alina.image
            
        })
    }
}
