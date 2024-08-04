//
//  NutritionCardView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 04/08/2024.
//

import SwiftUI

struct NutritionCardView: View {
    
    var nutrition: Nutrition?
    
    var body: some View {
        if let nutrient = nutrition {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(red: 230/255, green: 235/255, blue: 242/255))
                Image(systemName: "leaf.fill")
            }
            Text("\(String(format: "%.0f", nutrient.amount! ?? 65))g carbs")
                .padding(.leading, 12)
        }
    }
}

#Preview {
    NutritionCardView()
}
