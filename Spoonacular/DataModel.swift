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
    let extendedIngredients: [Ingredient]
    let nutrition: Nutrition?
}


struct Ingredient: Identifiable, Decodable {
    let id: Int
    let name: String
}


struct Nutrition: Decodable {
    let nutrients: [Nutrient]
    
    func nutrient(byName name: String) -> Nutrient? {
        return nutrients.first { $0.name == name }
    }
}


struct Nutrient: Identifiable, Decodable {
    var id = UUID()
    let name: String
    let amount: Double
    let unit: String
    let percentOfDailyNeeds: Double
    
    enum CodingKeys: String, CodingKey {
            case name
            case amount
            case unit
            case percentOfDailyNeeds
        }
    
    func infoText() -> String {
        let amount = String(format: "%.0f", self.amount)
        switch name {
        case "Carbohydrates":
            return "\(amount)\(self.unit) carbs"
        case "Calories":
            return "\(amount) \(self.unit.capitalized)"
        case "Protein":
            return "\(amount)\(self.unit) proteins"
        case "Fat":
            return "\(amount)\(self.unit) fats"
        default:
            return "Undefined"
        }
    }
    
    func getIcon() -> String {
        switch name {
        case "Carbohydrates":
            return "leaf.fill"
        case "Calories":
            return "flame"
        case "Protein":
            return "carrot"
        case "Fat":
            return "birthday.cake"
        default:
            return "globe"
        }
    }
}
