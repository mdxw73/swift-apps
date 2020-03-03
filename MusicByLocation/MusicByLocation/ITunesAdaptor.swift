//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by Zack Obied on 03/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class ITunesAdaptor {
    let baseUrl = "https://itunes.apple.com"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: @escaping ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided, terminating request")
            return
        }
        
        let path = "/term=\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + path) else {
            print("Invalid URL. Not able to update recommended artists")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
    }
}
