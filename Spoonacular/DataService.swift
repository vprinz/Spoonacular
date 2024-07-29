//
//  DataService.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 28/07/2024.
//

import Foundation


struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getListMealType() -> [String] {
        let mealTypes = [
            "main course", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup",
            "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"
        ]
        return mealTypes
    }
    
    func searchRecipes(query: String?, type: String?) async -> [Recipe] {
        guard apiKey != nil else {
            return [Recipe]()
        }
        
        var urlComponents = URLComponents(string: "https://api.spoonacular.com/recipes/complexSearch")!
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: "\(apiKey!)")
        ]
        
        if let query = query {
            urlComponents.queryItems?.append(URLQueryItem(name: "query", value: "\(query)"))
        }
        
        if let type = type {
            urlComponents.queryItems?.append(URLQueryItem(name: "type", value: "\(type)"))
        }
        
        let url = urlComponents.url!
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            let recipesResponse = try decoder.decode(RecipesResponse.self, from: data)
            
            return recipesResponse.results
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
    }
    
    func getRecipeInformation(id: Int) async -> RecipeInformation? {
        guard apiKey != nil else {
            return nil
        }
        
        var urlComponents = URLComponents(string: "https://api.spoonacular.com/recipes/\(id)/information")!
        urlComponents.queryItems = [
            URLQueryItem(name: "apiKey", value: "\(apiKey!)"),
            URLQueryItem(name: "includeNutrition", value: "true")
        ]
        
        let url = urlComponents.url!
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            let recipesInformation = try decoder.decode(RecipeInformation.self, from: data)
            
            return recipesInformation
        }
        catch {
            print(error)
        }
        
        return nil
    }
}
