//
//  RecipeDetailView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 29/07/2024.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @Environment(RecipeModel.self) var recipeModel
    @State var secletedTab = 0
    
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
            
            // Picker (Ingredients or Instructions)
            
            Picker("", selection: $secletedTab) {
                Text("Ingredients")
                    .tag(0)
                Text("Instructions")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            .padding(.top, 28)
            .onAppear {
                UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 4/255, green: 38/255, blue: 40/255, alpha: 1)
                UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
            }
            
            if secletedTab == 0 {
                IngredientsView()
            } else {
                InstructionsView()
            }
            
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
