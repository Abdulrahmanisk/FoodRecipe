import SwiftUI

struct RecipeDetailsView: View {
    @State private var userRating: Int = 0
    @State private var servings: Int = 1
    @Environment(\.presentationMode) var presentationMode
    let recipes: Recipe
    public var comments: Int = 0
    public var comimgs: Int = 0
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
        static let CircColor = Color("CircColor")
    }
    @State private var selectedIngredients: Set<String> = []
    
    var body: some View {
        NavigationView {
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
                            Text(recipes.name)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .bold()
                                .frame(width: 400)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                            
                            HStack {
                                ForEach(1..<6) { star in
                                    Image(systemName: userRating >= star ? "star.fill" : "star")
                                        .resizable()
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(.yellow)
                                        .onTapGesture {
                                            userRating = star
                                        }
                                }
                            }
                            
                            Text("Based on \(userRating) rating")
                                .fontWeight(.light)
                                .bold()
                                .foregroundColor(.gray)
                            
                            HStack {
                                HStack {
                                    Image(systemName: "heart")
                                    Text("49")
                                }
                                .padding()
                                .padding(.horizontal, 5)
                                
                                HStack {
                                    Image(systemName: "square.and.arrow.up")
                                    Text("49")
                                }
                                .padding()
                                .padding(.horizontal, 5)
                            }
                        } //name + rating stuff
                        Divider()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image(recipes.chefimage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 45, height: 45)
                                    .clipShape(Circle())
                                
                                Text(recipes.chefname)
                                    .bold()
                                    .font(.system(size: 25))
                                    .padding(.top, 10)
                                
                                Spacer()
                            }
                            
                            Text(recipes.description)
                        } //chef info, description
                        .padding(.horizontal, 100)
                        .padding(.bottom, 25)
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                        
                        Divider()
                        
                        HStack {
                            Text("Difficulty:")
                                .bold()
                            
                            Text(recipes.difficulty)
                            
                            Spacer()
                        } // Diffculty
                        .padding(.horizontal, 100)
                        .padding(.bottom, 20)
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                        
                        Divider()
                        
                        HStack { // Ingredients
                            VStack(alignment: .leading) {
                                Text("Ingredients")
                                    .font(.system(size: 20))
                                    .bold()
                                    .padding(.horizontal, 100)
                                    .padding(.bottom, 20)
                                    .padding(.leading, 25)
                                    .padding(.trailing, 25)
                                    .padding(.top, 20)
                                
                                HStack {
                                    Text("\(servings) Servings")
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        if servings > 1 {
                                            servings -= 1
                                        }
                                    }) {
                                        Image(systemName: "minus") .foregroundColor(.black)
                                            .frame(width: 35, height: 35)
                                            .background(CustomColor.colour)
                                            .cornerRadius(10)
                                    }
                                    .padding(.leading, 10)
                                    
                                    Text("\(servings)") .padding(.horizontal, 10)
                                    
                                    Button(action: {
                                        
                                        servings += 1
                                        
                                    }) {
                                        Image(systemName: "plus") .foregroundColor(.black)
                                            .frame(width: 35, height: 35)
                                            .background(CustomColor.colour)
                                            .cornerRadius(10)
                                    }
                                    .padding(.leading, 5)
                                }
                                .padding(.horizontal, 100)
                                .padding(.bottom, 15)
                                .padding(.leading, 25)
                                .padding(.trailing, 25)
                                .padding(.top, 5)
                                
                                VStack(alignment: .leading) {
                                    ForEach(recipes.ingredients.components(separatedBy: "\n"), id: \.self) { ingredient in
                                        HStack(alignment: .center) {
                                            Button(action: {
                                                toggleSelection(for: ingredient)
                                            }) {
                                                Image(systemName: selectedIngredients.contains(ingredient) ? "checkmark" : "circle")
                                                    .renderingMode(.template)
                                                    .foregroundColor(selectedIngredients.contains(ingredient) ? Color.green : CustomColor.CircColor)
                                                    .imageScale(.large)
                                                    .padding(.trailing)
                                            }
                                            
                                            if selectedIngredients.contains(ingredient) {
                                                Text(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))
                                                    .font(.system(size: 18))
                                                    .strikethrough()
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .padding(5)
                                            } else {
                                                Text(ingredient.trimmingCharacters(in: .whitespacesAndNewlines))
                                                    .font(.system(size: 18))
                                                    .fixedSize(horizontal: false, vertical: true)
                                                    .padding(5)
                                            }
                                        }
                                        .padding()
                                    }
                                }
                                .padding(.horizontal, 100)
                                .padding(.bottom, 20)
                                .padding(.leading, 25)
                                .padding(.trailing, 25)
                                .padding(.top, 20)
                            }
                        }
                        Divider()
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Instructions : ")
                                    .font(.system(size: 25))
                                    .bold()
                                Spacer()
                            }
                            
                            
                            ForEach(Array(zip(1..., recipes.directions.components(separatedBy: "\n"))), id: \.0) { index, step in
                                Divider()
                                HStack {
                                    Text("Step \(index):")
                                        .font(.system(size: 18))
                                        .bold()
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(5)
                                    
                                    Divider()
                                    VStack {
                                        Text(step)
                                            .font(.system(size: 18))
                                            .fixedSize(horizontal: false, vertical: true)
                                            .padding(5)
                                        Divider()
                                    }
                                }
                            }
                        } //direcions
                        .padding(.horizontal, 100)
                        .padding(.bottom, 20)
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                        
                        Divider()
                        VStack (alignment: .leading) {
                            HStack {
                                Text("Reviews") .bold()
                                Spacer()
                                Button {
                                    print("write")
                                } label: {
                                    Text("Write") .padding(.horizontal, 20) .foregroundColor(.orange) .bold()
                                }
                            }
                            
                            HStack {
                                Button {
                                    print("Comment")
                                } label: {
                                    Text("\(comments) Comments")
                                }
                                
                                Text("-")
                                
                                Button {
                                    print("Comment")
                                } label: {
                                    Text("\(comimgs) Images")
                                }
                                Spacer()
                            }
                            .foregroundColor(.gray)
                            .fontWeight(.light)
                            
                            Text("There are no reactions yet. Be the first to share your cooking experience!")
                                .fontWeight(.light)
                        }
                        .padding(.horizontal, 100)
                        .padding(.bottom, 25)
                        .padding(.leading, 25)
                        .padding(.trailing, 25)
                        .padding(.top, 20)
                        
                        Spacer()
                    }
                    .frame(width: .infinity, height: .infinity)
                    .background(Color.white)
                    
                    .padding(.top, 300)
                }
            }
            .navigationViewStyle(.automatic)
            
            
        }
    }
    
    private func toggleSelection(for ingredient: String) {
        if selectedIngredients.contains(ingredient) {
            selectedIngredients.remove(ingredient)
        } else {
            selectedIngredients.insert(ingredient)
        }
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipes: Recipe.all[0])
    }
}
