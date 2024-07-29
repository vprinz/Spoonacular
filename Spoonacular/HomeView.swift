//
//  ContentView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 28/07/2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var query = ""
    @State var mealTypes = [String]()
    @State var recipes = [Recipe]()
    
    var service = DataService()
    
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading, 16)
                TextField("Search", text: $query)
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 151/255, green: 162/255, blue: 176/255))
            }
            .frame(height: 54)
            .background(alignment: .center) {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color(red: 151/255, green: 162/255, blue: 176/255))
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(mealTypes, id: \.self) { type in
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .foregroundColor(Color(red: 112/255, green: 185/255, blue: 190/255))
                                .frame(height: 44)
                            Text(type.capitalized)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 24)
                                .bold()
                        }
                    }
                }
            }
            .padding(.top, 16)
            
            VStack(alignment: .leading) {
                Text("Popular Recipes")
                    .font(.system(size: 20))
                    .bold()
                ScrollView(showsIndicators: false) {
                    VStack {
                        ForEach(recipes) { recipe in
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(height: 100)
                                    .foregroundColor(Color(red: 251/255, green: 251/255, blue: 251/255))
                                HStack {
                                    Image(recipe.imageUrl)
                                        .padding(.leading, 8)
                                    Text(recipe.title)
                                        .font(.system(size: 16))
                                        .bold()
                                        .padding(.leading, 16)
                                    Spacer()
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(Color(red: 4/255, green: 38/255, blue: 41/255))
                                        Image(systemName: "arrow.forward")
                                            .foregroundStyle(.white)
                                    }
                                    .padding(.trailing, 16)
                                }
                            }
                        }
                    }
                }
            }
            .padding(.top, 24)
        }
        .padding(.horizontal, 24)
        .onAppear {
            mealTypes = service.getListMealType()
            recipes = service.searchRecipes()
        }
    }
}

#Preview {
    HomeView()
}
