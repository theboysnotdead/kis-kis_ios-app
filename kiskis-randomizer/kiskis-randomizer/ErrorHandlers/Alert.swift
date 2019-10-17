//
//  Alert.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import UIKit

final class Alert {
    
    static func createAlert(with message: String) -> UIAlertController {
        return UIAlertController(title: nil, message: message, preferredStyle: .alert)
    }
}
