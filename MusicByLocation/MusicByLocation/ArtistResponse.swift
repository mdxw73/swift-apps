//
//  ArtistResponse.swift
//  MusicByLocation
//
//  Created by Zack Obied on 29/02/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

struct ArtistResponse: Codable {
    var count: Int
    var results: [Artist]
    
    private enum CodingKeys: String, CodingKey {
        case count = "resultCount"
        case results
    }
}
