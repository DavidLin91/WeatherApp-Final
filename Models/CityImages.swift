//
//  Images.swift
//  WeatherApp
//
//  Created by David Lin on 4/30/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct PhotoSearch: Codable {
    let hits: [Photo]
}
struct Photo: Codable, Equatable {
    let largeImageURL: String
}
