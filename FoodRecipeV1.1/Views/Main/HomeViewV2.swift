//
//  HomeViewV2.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 31/12/2023.
//

import SwiftUI

struct HomeViewV2: View {
    var recipes: Recipe
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                AsyncImage(url: URL(string: recipes.image)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 600, height: 600)
                        .ignoresSafeArea(.all)
                } placeholder: {
                    ProgressView()
                }
            }
            .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    
                    VStack {
                        VStack {
                            Text(recipes.category)
                            Text(recipes.name)
                            HStack {
                                Image(recipes.chefimage) .resizable() .frame(width: 30, height: 30) .cornerRadius(30)
                                Text(recipes.chefname)
                            }
                        } .frame(width: 350, height: 250) .cornerRadius(50)
                    }
                }                 .frame(width: .infinity, height: .infinity)
                    .background(Color.white)
                    .padding(.top, 250)
            }
            } .background(Color.white)
    }
}

#Preview {
    HomeViewV2(recipes: Recipe.all[0])
}
