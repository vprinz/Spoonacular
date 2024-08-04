//
//  RecipeModel.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 29/07/2024.
//

import Foundation
import SwiftUI


@Observable
class RecipeModel {
    
    var recipes = [Recipe]()
    var selectedRecipe: Recipe?
    var service = DataService()
    var recipeInformation: RecipeInformation?
    
    func getRecipes(query: String?, type: String?) {
        Task {
            recipes = await service.searchRecipes(query: query, type: type)
        }
    }
    
    func loadRecipeInformation() {
        Task {
            recipeInformation = await service.getRecipeInformation(id: selectedRecipe?.id ?? 715415)
        }
    }
}
