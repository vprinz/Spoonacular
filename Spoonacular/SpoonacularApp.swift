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
    @AppStorage("onboarding") var isNeedOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(recipeModel)
                .fullScreenCover(isPresented: $isNeedOnboarding, onDismiss: {
                    isNeedOnboarding = false
                }, content: {
                    OnboardingView()
                })
        }
    }
}
