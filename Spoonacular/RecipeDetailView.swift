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
        let recipeInformation = recipeModel.recipeInformation ?? nil
        
        VStack(alignment: .leading, spacing: 0) {
            
            // Main information
            
            HStack {
                Text(recipeInformation?.title ?? "Health Taco Salad")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                Spacer()
                Image(systemName: "clock")
                Text("\(recipeInformation?.readyInMinutes ?? 0) Min")
            }
            .foregroundStyle(pageColor)
            
            Text(recipeInformation?.summary.htmlToString() ?? "This Healthy Taco Salad is the universal delight of taco night")
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .foregroundStyle(pageColor)
                .padding(.top, 6)
            
            // Nutrients information
            
            LazyVGrid(columns: [GridItem(alignment: .leading), GridItem(alignment: .leading)], spacing: 16) {
                ForEach(nutrientList, id: \.self) { nutrientName in
                    HStack(spacing: 0) {
                        NutrientsCardView(nutrientName: nutrientName)
                    }
                }
            }
            .padding(.top, 16)
            
            // Ingredients information
            
            Text("Ingredients")
                .font(.system(size: 20))
                .bold()
                .padding(.top, 24)
            
            Text("\(recipeInformation?.extendedIngredients.count ?? 0) Items")
                .font(.system(size: 16))
                .foregroundStyle(pageColor)
                .padding(.top, 2)
            
            ScrollView(showsIndicators: false) {
                VStack {
                    ForEach(recipeInformation?.extendedIngredients ?? []) { ingredient in
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 80)
                                .foregroundColor(Color(red: 251/255, green: 251/255, blue: 251/255))
                            HStack {
                                let url = "https://img.spoonacular.com/ingredients_100x100/\(ingredient.image)"
                                AsyncImage(url: URL(string: url)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 48, height: 48)
                                        .cornerRadius(16)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 50, height: 50)
                                }
                                .padding(.leading, 16)
                                Text(ingredient.name.capitalized)
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding(.leading, 16)
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding(.top, 12)
            
            Button {
                // Add to cart
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: 54)
                        .foregroundStyle(Color(red: 112/255, green: 185/255, blue: 190/255))
                    Text("Add To Cart")
                        .foregroundStyle(.white)
                        .font(.system(size: 16))
                        .bold()
                }
            }
            
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
