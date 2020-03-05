//
//  ViewController.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/4/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {
    var presenter = LaunchesPastPresenter()
    
    @IBOutlet var missionNameTextField: UITextField!
    @IBOutlet var rocketNameTextField: UITextField!
    @IBOutlet var launchYearTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 150.0
        
        presenter.fetchComplete = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func findButtonTapped(_ sender: UIButton) {
        let service = LaunchesPastService(
            missionName: missionNameTextField.text,
            rocketName: rocketNameTextField.text,
            launchYear: launchYearTextField.text
        )
        
        presenter.fetch(for: service)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.pastLaunches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PastLaunchCell", for: indexPath) as! PastLaunchCell
        
        cell.setup(for: presenter.pastLaunches[indexPath.row])
        
        return cell
    }
}
