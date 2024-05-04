import SwiftUI

struct HomeView: View {
    public var user1 = "Abdullah"
    public var poprecipes: Image = Image("")
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    
    @available (iOSApplicationExtension, unavailable)
    var safeArea: UIEdgeInsets {
        if let windowScene = (UIApplication.shared.connectedScenes.first as? UIWindowScene) {
            return windowScene.keyWindow?.safeAreaInsets ?? .zero
        }
        
        return .zero
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { scrol in
                ScrollView (.vertical ,showsIndicators: false) {
                    LazyVStack (spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            VStack {
                                ZStack {
                                    Rectangle()
                                        .fill(Color.gray)
                                        .frame(width: 370, height: 170)
                                        .cornerRadius(30)
                                        .shadow(radius: 0.1) .opacity(0.03)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                                        )
                                    VStack {
                                        HStack{
                                            VStack (alignment: .leading) {
                                                Text("Recipes Recomendation") .bold() .font(.system(size: 20)) .frame(width: 235)
                                                Text("Get your personalized recipes recommendation in a 4 steps") .frame(width: 240)
                                            }
                                            VStack {
                                                Image("Image1") .resizable() .frame(width: 100, height: 100) .aspectRatio(contentMode: .fit)
                                            }
                                        }
                                        
                                        HStack {
                                            Button {
                                                print("Get Started!")
                                            } label: {
                                                NavigationLink(destination: CategoriesView()) {
                                                    Text("Get Started") .foregroundColor(.black) .bold() .frame(width: 170, height: 40).background(CustomColor.OrFill)  .cornerRadius(30) .font(.system(size: 20)).overlay(
                                                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                            .strokeBorder(CustomColor.OrStroke, lineWidth: 1))
                                                }
                                            }
                                            Button {
                                                print("Skip!")
                                            } label: {
                                                Text("Skip") .foregroundColor(.black) .bold() .frame(width: 170, height: 40) .cornerRadius(30).font(.system(size: 20)).overlay(
                                                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                        .strokeBorder(CustomColor.Rounded, lineWidth: 1))
                                            }
                                        }
                                    }
                                }
                                
                                HStack {
                                    Text("Popular recipes").bold() .font(.system(size: 25))
                                    Spacer()
                                } .padding(20) .frame(height: 5) .padding(.top, 40)
                                ScrollView (.horizontal, showsIndicators: false) {
                                    VStack (alignment: .leading){
                                        HStack {
                                            ForEach(Recipe.all.shuffled().prefix(5)) { recipe in
                                                VStack (alignment: .leading) {
                                                    RecipeCardView(recipes: recipe)
                                                    ChefCardView(recipes: recipe)
                                                }
                                            }
                                        } .foregroundColor(.black) .padding(.top, 20)
                                    }
                                }  .flipsForRightToLeftLayoutDirection(false).environment(\.layoutDirection, .leftToRight)
                                
                                HStack {
                                    Text("Popular creator").bold() .font(.system(size: 25))
                                    Spacer()
                                } .padding(20) .frame(height: 5)
                                ScrollView (.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(Recipe.all.shuffled().prefix((5))) { recipe in
                                            CreatorCardView(recipes: recipe)
                                        }
                                    }.foregroundColor(.black) .padding(20)
                                }  .flipsForRightToLeftLayoutDirection(false).environment(\.layoutDirection, .leftToRight)
                                
                                
                                
                            }
                        } header: {
                            headerView(scrol.size )
                        } .padding(15)
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: scrol.size.width, height: 20)
                    }
                }
            }
        }
        
    }
    
    @ViewBuilder
    func headerView(_ size: CGSize) -> some View {
        HStack (spacing: 10) {
            VStack (alignment: .leading, spacing: 5, content: {
                Text("Hello, " + user1)
                    .bold()
                    .font(.system(size: 30))
                Text("What do you want to cook today?")
                    .foregroundColor(.gray)
                    .bold()
                
            })
            VStack (alignment: .trailing) {
                Button {
                    print("Profile!")
                } label: {
                    Image("userImage").resizable() .frame(width: 70, height: 70) .aspectRatio(contentMode: .fill)
                }
            }
            .visualEffect { content, geometryProxy in
                content
                    .scaleEffect(headerScale(size, proxy: geometryProxy), anchor: .topLeading)
            }
            
        } .padding(.bottom, 10)
        
            .background {
                VStack (spacing: 0) {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                    
                    Divider()
                    
                }
                .visualEffect { content, geometryProxy in
                    content.opacity(headerBGOpacity(geometryProxy))
                }
                .padding(.horizontal, -30)
                .padding(.top, -(safeArea.top + 15))
                
            }
    }
    
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = (proxy.frame(in: .scrollView).minY) + safeArea.top
        return 15
    }
    
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        let progress = minY / screenHeight
        let scale = (min(max(progress, 0),1)) * 0.4
        
        return 1 + scale
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RecipeCardView: View {
    let recipes: Recipe
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    var body: some View {
        VStack {
            Button {
                print(recipes.name)
            } label: {
                NavigationLink(destination: RecipeDetailsView(recipes: recipes)) {
                    ZStack {
                        Rectangle()
                            .fill(Color.white)
                            .frame(width: 150, height: 200)
                            .cornerRadius(30)
                        VStack (alignment: .leading) {
                            AsyncImage (url: URL(string: recipes.image)) { image in
                                image  .resizable() .scaledToFill() .frame(width: 150, height: 200) .cornerRadius(30)
                            } placeholder: {
                                ProgressView()
                            }
                            Text(recipes.name) .bold() .font(.system(size: 15)) .frame(width: 150, height: 80)
                        } .frame(width: 150, height: 250) .padding(.top, 20)
                    }
                }
            }
        }
    }
}

struct ChefCardView: View {
    let recipes: Recipe
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    var body: some View {
        VStack {
            Button {
                print(recipes.name)
            } label: {
                NavigationLink(destination: ChefDetailsView(recipes: recipes)) {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(recipes.chefimage) .resizable() .scaledToFill() .frame(width: 40, height: 40) .clipShape(Circle())
                            Text(recipes.chefname)
                        } .font(.system(size: 15)) .padding(.bottom, 20) .padding(.top, 10)
                    } .padding(.horizontal, 5) .font(.system(size: 12)) .bold()

                }
            }
        }
    }
}


struct CreatorCardView: View {
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    
    let recipes: Recipe
    var body: some View {
        Button {
            print(recipes.chefname)
        } label: {
            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 230, height: 200)
                    .cornerRadius(30)
                    .shadow(radius: 0.1) .opacity(0.03)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                    )
                VStack (alignment: .leading) {
                    Image(recipes.chefimage)  .resizable() .scaledToFill() .frame(width: 45, height: 45) .clipShape(Circle())
                    Text(recipes.chefname) .bold() .font(.system(size: 25)) .padding(.top, 10)
                    HStack {
                        Image("time") .resizable() .frame(width: 25, height: 25)
                        Text("78")
                    }
                    HStack {
                        Image(systemName: "heart") .resizable() .frame(width: 25, height: 25) .foregroundColor(.gray)
                        Text("5215")
                        Spacer()
                    }
                    
                } .frame(width: 230, height: 200) .padding(.leading, 30)
                
            } .padding(-7)
        }
    }
    
}
