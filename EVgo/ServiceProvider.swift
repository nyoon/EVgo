//
//  ServiceProvider.swift
//  EVgo
//
//  Created by Nicholas Yoon on 3/5/20.
//  Copyright © 2020 Nicholas Yoon. All rights reserved.
//

import Foundation

protocol ServiceProvider {
    var request: URLRequest? { get }
}
