//
//  ChefDetailsView.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 02/01/2024.
//

import SwiftUI

struct ChefDetailsView: View {
    let recipes: Recipe
    var body: some View {
        
       
            VStack (alignment: .leading, spacing: 10){
                NavigationView {
                HStack {
                    Image(recipes.chefimage) .resizable() .frame(width: 100, height: 100) .aspectRatio(contentMode: .fill) .clipShape(Circle())
                    Text(recipes.chefname) .font(.title.weight(.bold))
                }
                Text(recipes.description) .padding()
                HStack {
                ForEach(Recipe.all.shuffled().prefix(5)) { recipe in
                    VStack (alignment: .leading) {
                        RecipeCardView(recipes: recipe)
                    }
                        }
                    }
                Spacer()
            } .padding()
        }
    }
}

#Preview {
    ChefDetailsView(recipes: Recipe.all[0])
}
