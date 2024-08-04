//
//  InstructionsView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 04/08/2024.
//

import SwiftUI

struct InstructionsView: View {
    
    @Environment(RecipeModel.self) var recipeModel
    
    var body: some View {
        let recipeInformation = recipeModel.recipeInformation ?? nil
        
        VStack(alignment: .leading) {
            Text("Instructions")
                .font(.system(size: 20))
                .bold()

            ScrollView(showsIndicators: false) {
                Text(recipeInformation?.summary.htmlToString() ?? "")
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    InstructionsView()
        .environment(RecipeModel())
}
