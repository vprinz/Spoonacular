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
            .onAppear {
                mealTypes = service.getListMealType()
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    HomeView()
}
