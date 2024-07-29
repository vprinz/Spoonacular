//
//  SpoonacularApp.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 28/07/2024.
//

import SwiftUI

@main
struct SpoonacularApp: App {
    
    @State var recipeModel = RecipeModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(recipeModel)
        }
    }
}
