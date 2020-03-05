//
//  PastLaunch.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PastLaunch {
    let missionName: String
    let rocketName: String
    let launchDate: String
    let videoLink: String
    
    init(json: JSON) {
        self.missionName = json["mission_name"].stringValue
        self.rocketName = json["rocket"]["rocket_name"].stringValue
        self.videoLink = json["links"]["video_link"].stringValue

        if let utcDate = json["launch_date_utc"].stringValue.toDate(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'") {
            self.launchDate = utcDate.toLocalTime().toString(dateFormat: "MMM dd, yyyy' at 'HH:mm:ss")
        } else {
            self.launchDate = ""
        }
    }
}
