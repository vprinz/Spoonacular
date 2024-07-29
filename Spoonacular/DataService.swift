//
//  DataService.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 28/07/2024.
//

import Foundation


struct DataService {
    
    func getListMealType() -> [String] {
        let mealTypes = [
            "main course", "side dish", "dessert", "appetizer", "salad", "bread", "breakfast", "soup",
            "beverage", "sauce", "marinade", "fingerfood", "snack", "drink"
        ]
        return mealTypes
    }
    
    func searchRecipes() -> [Recipe] {
        return [
            Recipe(id: 1, title: "Easy homemade beef burger", imageUrl: "burger"),
            Recipe(id: 2, title: "Blueberry wuth egg for breakfast", imageUrl: "eggs")
        ]
    }
}
