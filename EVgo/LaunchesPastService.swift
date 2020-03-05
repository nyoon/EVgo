//
//  LaunchesPastService.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import Foundation

struct LaunchesPastService: ServiceProvider {
    private let missionName: String?
    private let rocketName: String?
    private let launchYear: String?
    
    init(missionName: String? = nil, rocketName: String? = nil, launchYear: String? = nil) {
        self.missionName = missionName
        self.rocketName = rocketName
        self.launchYear = launchYear
    }
    
    private var parameters: [String: Any] {
        var searchParameters = [String]()
        if let missionName = missionName {
            let parameter = "mission_name: \"\(missionName)\""
            searchParameters.append(parameter)
        }
        
        if let rocketName = rocketName {
            let parameter = "rocket_name: \"\(rocketName)\""
            searchParameters.append(parameter)
        }
        
        if let launchYear = launchYear {
            let parameter = "launch_year: \"\(launchYear)\""
            searchParameters.append(parameter)
        }

        var allFindParameters = ""
        for (index, parameter) in searchParameters.enumerated() {
            allFindParameters += parameter
            
            if index < searchParameters.count - 1 {
                allFindParameters += " "
            }
        }
            
        let resultParameters = "id mission_name launch_date_utc links { video_link } rocket { rocket_name }"
        return ["query": "{ launchesPast(find: { \(allFindParameters) }) { \(resultParameters) } }"] as [String : Any]
    }
    
    var request: URLRequest? {
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])

        guard let url = NSURL(string: Globals.spaceXURLString) else {
            print("Error: Could not validate URL for SpaceX GraphQL Service")
            return nil
        }
        
        let request = NSMutableURLRequest(url: url as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = Globals.headers
        request.httpBody = postData as Data

        return request as URLRequest
    }
}
