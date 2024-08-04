//
//  RecipeDetailView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 29/07/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @Environment(RecipeModel.self) var recipeModel
    
    var pageColor = Color(red: 116/255, green: 129/255, blue: 137/255)
    let nutrientList = ["Carbohydrates", "Protein", "Calories", "Fat"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(recipeModel.recipeInformation?.title ?? "Health Taco Salad")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "clock")
                Text("\(recipeModel.recipeInformation?.readyInMinutes ?? 55) Min")
            }
            .foregroundStyle(pageColor)
            
            Text(recipeModel.recipeInformation?.summary.htmlToString() ?? "This Healthy Taco Salad is the universal delight of taco night")
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .foregroundStyle(pageColor)
                .padding(.top, 6)
            
            LazyVGrid(columns: [GridItem(alignment: .leading), GridItem(alignment: .leading)], spacing: 16) {
                ForEach(nutrientList, id: \.self) { nutrientName in
                    HStack(spacing: 0) {
                        NutrientsCardView(nutrientName: nutrientName)
                    }
                }
            }
            .padding(.top, 16)
        }
        .padding()
        .onAppear {
            recipeModel.loadRecipeInformation()
        }
    }
}

#Preview {
    RecipeDetailView()
        .environment(RecipeModel())
}
