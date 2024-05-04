//
//  CategoriesView.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 23/12/2023.
//

import SwiftUI

struct CategoriesView: View {
    @Environment(\.presentationMode) var presentationMode
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    
    var body: some View {
        ZStack {
            CustomColor.colour .ignoresSafeArea()
            NavigationView {
                VStack {
                    ScrollView (showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))], spacing: 16) {
                            ForEach(Categories.allCases, id: \.self) { category in
                                NavigationLink {
                                    RecipeList(category: category, recipes: Recipe.all.filter { category.rawValue == "All Recipes" || $0.category == category.rawValue })
                                } label : {
                                    VStack {
                                        if let categoryImage = getImageForCategory(category.rawValue) {
                                            Image(categoryImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                                
                                        } else {
                                            Image("nophoto")
                                                .resizable().aspectRatio(contentMode: .fit)
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                        }
                                        Text(category.rawValue + "") .foregroundColor(.black) .padding() .bold()
                                            
                                    } .frame(width: 150, height: 150)
                                      
                                }
                            }
                        }
                        .padding()
                    }
                    .navigationTitle("Categories")  .bold()
                   
                }

                }
        }
            .navigationViewStyle(.automatic)
            
        }
    }


struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}

struct CateList: View {
    let recipes: Recipe
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    var body: some View {
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

struct profilewhatever: View {
    public var user1 = "Abdullah"
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text("Hello, " + user1)
                    .bold()
                    .font(.system(size: 20))
                Text("What do you want to cook today?")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                    .bold()
            }
                Button {
                    print("Profile!")
                } label: {
                    Image("userImage").resizable() .frame(width: 50, height: 50) .aspectRatio(contentMode: .fill)
                        .padding(.leading, 80)
                }
        }
    }
}

func getImageForCategory(_ categoryName: String) -> String? {
    switch categoryName {
    case "All Recipes":
        return "allrecipes"
    case "Breakfast":
        return "breakfast"
    case "Soup":
        return "soup"
    case "Salad":
        return "salad"
    case "Appetizer":
        return "appetizer"
    case "Main Course":
        return "maincourse"
    case "Side Dish":
        return "sidedish"
    case "Dessert":
        return "dessert"
    case "Snack":
        return "snacks"
    case "Drink":
        return "drink"
    default:
        return nil
    }
}
