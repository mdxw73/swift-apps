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
