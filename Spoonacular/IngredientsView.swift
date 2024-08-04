//
//  IngredientsView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 04/08/2024.
//

import SwiftUI

struct IngredientsView: View {
    
    @Environment(RecipeModel.self) var recipeModel
    
    var body: some View {
        let recipeInformation = recipeModel.recipeInformation ?? nil
        
        Text("Ingredients")
            .font(.system(size: 20))
            .bold()
            .padding(.top, 24)
        
        Text("\(recipeInformation?.extendedIngredients.count ?? 0) Items")
            .font(.system(size: 16))
            .foregroundStyle(Color(red: 116/255, green: 129/255, blue: 137/255))
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
    }
}

#Preview {
    IngredientsView()
        .environment(RecipeModel())
}
