//
//  NutrientCardView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 29/07/2024.
//

import SwiftUI

struct NutrientCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 40, height: 40)
                .foregroundColor(Color(red: 230/255, green: 235/255, blue: 242/255))
            Image(systemName: "leaf.fill")
        }
        Text("65g carbs")
            .padding(.leading, 12)
    }
}

#Preview {
    NutrientCardView()
}
