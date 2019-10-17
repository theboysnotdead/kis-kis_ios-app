//
//  NetworkService.swift
//  kiskis-randomizer
//
//  Created by Vsevolod Onishchenko on 17/10/2019.
//  Copyright © 2019 theboysnotdead. All rights reserved.
//

import Foundation

final class NetworkService {
    
    private let baseUrlPath: String = "www.youtube.com"
    typealias Action<T> = (T) -> Void
    
    func getKisKisVideo(successHandler: @escaping Action<String>,  errorHandler: @escaping Action<String>) {
        guard let kiskisPath = URL(string: baseUrlPath + "/kiskis") else {
            errorHandler(MessageConstants.AlertMessages.wrongPath.message)
            return
        }
        
        let request = URLRequest(url: kiskisPath)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                errorHandler(MessageConstants.AlertMessages.errorLoading.message)
            }
        }.resume()
    }
}
