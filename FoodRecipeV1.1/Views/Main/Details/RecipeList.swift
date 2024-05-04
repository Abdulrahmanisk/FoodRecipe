//
//  RecipeList.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 25/12/2023.
//

import SwiftUI

struct RecipeList: View {
    @Environment(\.presentationMode) var presentationMode
    var category: Categories
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    
    @State private var searchText = ""
    var recipes: [Recipe]
    var body: some View {
        
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(category.rawValue)
                            .font(.system(size: 30))
                            .padding(.leading, 20)
                            .fontWeight(.bold)
                        Text(String(format: "%d Recipes", recipes.count))
                            .padding(.leading, 20)
                    }
                    Spacer()
                }
                
                ForEach(0..<recipes.count / 2) { index in
                    HStack {
                        RecipeCardView(recipes: recipes[index * 2]) .padding(.horizontal)
                        RecipeCardView(recipes: recipes[index * 2 + 1]) .padding(.horizontal) 
                    }
                    .foregroundColor(.black)
                    Divider() .padding(.horizontal, 30) .padding(.bottom, 20) .padding(.top, 10)
                    
                }
                
                if recipes.count % 2 != 0 {
                    RecipeCardView(recipes: recipes.last!)
                        .foregroundColor(.black)
                }
                VStack { } .frame(width: 100, height: 100)
            }
            
            .navigationBarTitle("Category", displayMode: .inline)
        }
        
    }
}

#Preview {
    RecipeList(category: .main, recipes: Recipe.all)
}
