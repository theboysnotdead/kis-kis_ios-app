//
//  ViewController.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import UIKit

private enum KisKisMember {
    case sonya, alyona
    
    var value: String {
        switch self {
        case .sonya: return "sonya"
        case .alyona: return "alyona"
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
        imageBackground.image = segmentControl.selectedSegmentIndex == 0
            ? KisKisMember.sonya.image
            : KisKisMember.alyona.image
    }
}
