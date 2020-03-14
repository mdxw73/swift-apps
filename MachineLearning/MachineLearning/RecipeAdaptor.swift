//
//  RecipeAdaptor.swift
//  MachineLearning
//
//  Created by Zack Obied on 14/03/2020.
//  Copyright © 2020 Zack Obied. All rights reserved.
//

import Foundation

class RecipeAdaptor {
    let baseUrl = "https://www.themealdb.com/api/json/v1/1/filter.php"
    let decoder = JSONDecoder()
    
    func getRecipes(_ search: String, completion: @escaping ([Recipe]?) -> Void) {
        let path = "?i=\(search)"
        
        guard let url = URL(string: baseUrl + path) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.meals)
                //Check wehther each substring in search term gets results by itself
                } else {
                    if search.contains("_") {
                        let searchArray = search.map {return $0}
                        var substringArray = [String]()
                        var word = ""
                        for i in 0..<searchArray.count {
                            if searchArray[i] == "_" {
                                substringArray.append(word)
                                word = ""
                            } else if i == searchArray.count - 1 {
                                word += String(searchArray[i])
                                substringArray.append(word)
                            } else {
                                word += String(searchArray[i])
                            }
                        }
                        for substring in substringArray {
                            self.getRecipes(substring, completion: completion)
                        }
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> RecipeResponse? {
        if let recipeResponse = try? decoder.decode(RecipeResponse.self, from: json) {
            return recipeResponse
        } else {
            print("No meals match this image")
            return nil
        }
    }
}
