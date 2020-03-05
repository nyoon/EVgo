//
//  LaunchesPastPresenter.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import Foundation

class LaunchesPastPresenter {
    var fetchComplete: (() -> Void)?
    
    var pastLaunches: [PastLaunch] = [] {
        didSet {
            fetchComplete?()
        }
    }
    
    func fetch(for service: LaunchesPastService)  {
        let networkManager = NetworkManager(service: service)
        
        networkManager.fetch { (json) in
            let allJSON = json["data"]["launchesPast"]
            let allLaunches = allJSON.map { PastLaunch(json: $0.1) }

            self.pastLaunches = allLaunches
        }
    }
}
