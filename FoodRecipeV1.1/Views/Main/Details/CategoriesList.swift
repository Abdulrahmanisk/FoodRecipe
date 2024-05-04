//
//  CategoriesList.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 26/12/2023.
//

import SwiftUI

struct CategoriesList: View {
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    let recipes: Recipe
    var body: some View {
        VStack{
            Button {
                print(recipes.name)
            } label: {
                NavigationLink(destination: RecipeDetailsView(recipes: recipes)) {
                    ZStack {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 300, height: 350)
                            .shadow(radius: 0.1) .opacity(0.03)
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                    .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                            )
                        
                        VStack (alignment: .leading) {
                            AsyncImage (url: URL(string: recipes.image)) { image in
                                image  .resizable() .scaledToFill() .frame(width: 300, height: 150)  .cornerRadius(30, corners: [.topRight, .topLeft])
                            } placeholder: {
                                ProgressView()
                            }
                            VStack (alignment: .leading) {
                                Text(recipes.name) .bold() .font(.system(size: 20))
                                Text(recipes.category) .fontWeight(.light) .foregroundColor(.gray)
                                HStack {
                                    Image("time") .resizable() .frame(width: 25, height: 25)
                                    Text(recipes.timetomake)
                                }
                                HStack {
                                    Image("diff") .resizable() .frame(width: 25, height: 25)
                                    Text(recipes.difficulty)
                                }
                                HStack {
                                    Image(recipes.chefimage) .resizable() .scaledToFill() .frame(width: 25, height: 25) .clipShape(Circle())
                                    Text(recipes.chefname)
                                }
                            } .padding(15) .font(.system(size: 20))
                            Spacer()
                        }
                    } .frame(width: 280, height: 350)
                } .padding()
            }
        }
    }
}

#Preview {
    CategoriesList(recipes: Recipe.all[0])
}

