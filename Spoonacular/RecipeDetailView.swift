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
            
            Text(recipeModel.recipeInformation?.summary ?? "This Healthy Taco Salad is the universal delight of taco night View More")
                .foregroundStyle(pageColor)
                .padding(.top, 6)
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color(red: 230/255, green: 235/255, blue: 242/255))
                    Image(systemName: "leaf.fill")
                }
                Text("65g carbs")
                    .padding(.leading, 12)
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
