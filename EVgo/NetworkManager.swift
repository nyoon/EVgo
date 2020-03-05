//
//  NetworkManager.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct NetworkManager {
    private let service: ServiceProvider
    
    init(service: ServiceProvider) {
        self.service = service
    }
    
    func fetch(completion: ((JSON) -> Void)? = nil) {
        guard let request = service.request else {
            print("Error: Request was nil when fetching service")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else { return }

            do {
                let json = try JSON(data: data)
                completion?(json)
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
