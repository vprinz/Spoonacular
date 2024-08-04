//
//  OnboardingView.swift
//  Spoonacular
//
//  Created by Valerie N. Prinz on 04/08/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color(red: 112/255, green: 185/255, blue: 190/255)
            VStack {
                HStack {
                    Image("egg")
                    Image("salmon")
                        .padding(.leading, 75)
                }
                HStack {
                    Image("orange")
                        .padding(.top, 36)
                }
                HStack {
                    Image("cheeze")
                    Image("chicken")
                        .padding(.leading, 52)
                }
                
                Text("Help your path to health goals with happiness")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .padding(.top, 54)
                
                Button {
                    dismiss()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundStyle(Color(red: 4/255, green: 38/255, blue: 40/255))
                            .frame(height: 54)
                            .padding()
                        Text("Ready to Go")
                            .font(.system(size: 16))
                            .bold()
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
