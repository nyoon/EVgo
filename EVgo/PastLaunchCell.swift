//
//  PastLaunchCell.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import UIKit

class PastLaunchCell: UITableViewCell {
    
    @IBOutlet var missionNameLabel: UILabel!
    @IBOutlet var rocketNameLabel: UILabel!
    @IBOutlet var launchDateLabel: UILabel!
    @IBOutlet var videoTextView: UITextView!
    
    func setup(for model: PastLaunch) {
        missionNameLabel.text = model.missionName
        rocketNameLabel.text = model.rocketName
        launchDateLabel.text = model.launchDate
 
        let attributedString = NSMutableAttributedString(string: "Watch the launch!")
        attributedString.addAttribute(.link, value: model.videoLink, range: NSRange(location: 0, length: 17))
        videoTextView.attributedText = attributedString
    }
}

extension PastLaunchCell: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
