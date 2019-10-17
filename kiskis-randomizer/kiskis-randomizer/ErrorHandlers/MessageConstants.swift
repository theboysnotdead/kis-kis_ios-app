//
//  MessageConstants.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import Foundation

final class MessageConstants {
    
    enum AlertMessages {
        case errorLoading
        case wrongPath
        
        var message: String {
            switch self {
            case .errorLoading: return "Ошибка загрузки"
            case .wrongPath: return "Неправильный путь"
            }
        }
    }
}
