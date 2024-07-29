//
//  RecipeDetailView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 29/07/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe?
    
    var body: some View {
        Text(recipe?.title ?? "")
    }
}

#Preview {
    RecipeDetailView()
}
