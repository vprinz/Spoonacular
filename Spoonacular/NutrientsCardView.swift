//
//  NutrientsCardView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 04/08/2024.
//

import SwiftUI

struct NutrientsCardView: View {
    
    @Environment(RecipeModel.self) var recipeModel
    var nutrientName: String
    
    var body: some View {
        if let nutrient = recipeModel.recipeInformation?.nutrition?.nutrient(byName: nutrientName) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(red: 230/255, green: 235/255, blue: 242/255))
                Image(systemName: nutrient.getIcon())
            }
            Text(nutrient.infoText())
                .padding(.leading, 12)
        }
    }
}

#Preview {
    NutrientsCardView(nutrientName: "Calories")
        .environment(RecipeModel())
}
