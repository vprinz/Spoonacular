//
//  DataModel.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 28/07/2024.
//

import Foundation


struct RecipesResponse: Decodable {
    let results: [Recipe]
    let offset: Int
    let number: Int
    let totalResults: Int
}


struct Recipe: Identifiable, Decodable {
    let id: Int
    let title: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "image"
        
        case id
        case title
    }
}


struct RecipeInformation: Identifiable, Decodable {
    let id: Int
    let title: String
    let summary: String
    let readyInMinutes: Int
    let extendedIngredients: [Dictionary<String, Ingredient>]
    let nutrition: Dictionary<String, Nutrient>
}


struct Ingredient: Identifiable, Decodable {
    let id: Int
    let name: String
}


struct Nutrient: Decodable {
    var id = UUID()
    let name: String
    let amount: Double
    let unit: String
}
