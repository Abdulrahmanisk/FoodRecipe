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
        Text(recipes.chefname)
    }
}

#Preview {
    ChefDetailsView(recipes: Recipe.all[0])
}
