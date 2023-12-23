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
                ScrollView (showsIndicators: false) {
                    
                    LazyVStack (spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section {
                            ZStack {
                                VStack {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: scrol.size.width, height: scrol.size.height / 4)
                                        .offset(y: -scrol.size.height - 0.1)
                                    
                                    Rectangle()
                                        .fill(CustomColor.colour)
                                        .frame(width: scrol.size.width, height: nil)
                                        .frame(maxHeight: .infinity)
                                    
                                    
                                }
                                
                                
                                    VStack {
                                        ZStack {
                                            Rectangle()
                                                .fill(Color.white)
                                                .frame(width: 370, height: 170)
                                                .cornerRadius(30)
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
                                                        Text("Get Started") .foregroundColor(.black) .bold() .frame(width: 170, height: 40).background(CustomColor.OrFill)  .cornerRadius(30) .font(.system(size: 20)).overlay(
                                                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                                .strokeBorder(CustomColor.OrStroke, lineWidth: 1))
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
                                            HStack (alignment: .lastTextBaseline) {
                                                Button {
                                                    print("See all!")
                                                } label: {
                                                    Text("See all") .bold() .font(.system(size: 25)).foregroundColor(CustomColor.SeeAll)
                                                }
                                            }
                                        } .padding(20) .frame(height: 5) .padding(.top, 40)
                                        ScrollView (.horizontal, showsIndicators: false) {
                                            HStack {
                                                
                                                Button {
                                                    print("Spaghetti")
                                                } label: {
                                                    ZStack {
                                                        Rectangle()
                                                            .fill(Color.white)
                                                            .frame(width: 300, height: 350)
                                                            .cornerRadius(30)
                                                            .overlay(
                                                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                                    .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                                                            )
                                                        
                                                        VStack (alignment: .leading) {
                                                            Image("Spaghetti")  .resizable() .scaledToFill() .frame(width: 300, height: 150)  .cornerRadius(30, corners: [.topRight, .topLeft])
                                                            VStack (alignment: .leading) {
                                                                Text("Spaghetti Bolognese") .bold() .font(.system(size: 20))
                                                                Text("Pasta") .fontWeight(.light) .foregroundColor(.gray)
                                                                HStack {
                                                                    Image("time") .resizable() .frame(width: 25, height: 25)
                                                                    Text("30-45 minutes")
                                                                }
                                                                HStack {
                                                                    Image("diff") .resizable() .frame(width: 25, height: 25)
                                                                    Text("Medium")
                                                                }
                                                                HStack {
                                                                    Image("propic") .resizable() .scaledToFill() .frame(width: 25, height: 25) .clipShape(Circle())
                                                                    Text("Gwen")
                                                                }
                                                            } .padding(15) .font(.system(size: 20))
                                                            Spacer()
                                                        }
                                                    } .frame(width: 280, height: 350)
                                                } .padding()
                                                
                                                Button {
                                                    print("Spaghetti")
                                                } label: {
                                                    ZStack {
                                                        Rectangle()
                                                            .fill(Color.white)
                                                            .frame(width: 300, height: 350)
                                                            .cornerRadius(30)
                                                            .overlay(
                                                                RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                                    .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                                                            )
                                                        
                                                        VStack (alignment: .leading) {
                                                            Image("stake")  .resizable() .scaledToFill() .frame(width: 300, height: 150)  .cornerRadius(30, corners: [.topRight, .topLeft])
                                                            VStack (alignment: .leading) {
                                                                Text("Classic Beef Steak") .bold() .font(.system(size: 20))
                                                                Text("Meat") .fontWeight(.light) .foregroundColor(.gray)
                                                                HStack {
                                                                    Image("time") .resizable() .frame(width: 25, height: 25)
                                                                    Text("30-45 minutes")
                                                                }
                                                                HStack {
                                                                    Image("diff") .resizable() .frame(width: 25, height: 25)
                                                                    Text("Easy")
                                                                }
                                                                HStack {
                                                                    Image("propic1") .resizable() .scaledToFill() .frame(width: 25, height: 25) .clipShape(Circle())
                                                                    Text("Irelia")
                                                                }
                                                            } .padding(15) .font(.system(size: 20))
                                                            Spacer()
                                                        }
                                                    } .frame(width: 280, height: 350)
                                                } .padding()
                                                
                                            } .foregroundColor(.black) .padding(20)
                                        }  .flipsForRightToLeftLayoutDirection(false).environment(\.layoutDirection, .leftToRight)
                                        
                                            HStack {
                                                Text("Popular creator").bold() .font(.system(size: 25))
                                                Spacer()
                                                HStack (alignment: .lastTextBaseline) {
                                                    Button {
                                                        print("See all!")
                                                    } label: {
                                                        Text("See all") .bold() .font(.system(size: 25)).foregroundColor(CustomColor.SeeAll)
                                                    }
                                                }
                                            } .padding(20) .frame(height: 5)
                                            ScrollView (.horizontal, showsIndicators: false) {
                                                HStack {
                                                    
                                                    Button {
                                                        print("Profile")
                                                    } label: {
                                                        ZStack {
                                                            Rectangle()
                                                                .fill(Color.white)
                                                                .frame(width: 230, height: 200)
                                                                .cornerRadius(30)
                                                                .overlay(
                                                                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                                        .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                                                                )
                                                            VStack (alignment: .leading) {
                                                                Image("propic")  .resizable() .scaledToFill() .frame(width: 45, height: 45) .clipShape(Circle())
                                                                Text("Gwen") .bold() .font(.system(size: 25)) .padding(.top, 10)
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
                                                    Button {
                                                        print("Profile")
                                                    } label: {
                                                        ZStack {
                                                            Rectangle()
                                                                .fill(Color.white)
                                                                .frame(width: 200, height: 200)
                                                                .cornerRadius(30)
                                                                .overlay(
                                                                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                                                                        .strokeBorder(CustomColor.Rounded, lineWidth: 1)
                                                                )
                                                            VStack (alignment: .leading) {
                                                                Image("propic1")  .resizable() .scaledToFill()  .frame(width: 45, height: 45) .clipShape(Circle())
                                                                Text("Irelia") .bold() .font(.system(size: 25)) .padding(.top, 10)
                                                                HStack {
                                                                    Image("time") .resizable() .frame(width: 25, height: 25)
                                                                    Text("58")
                                                                }
                                                                HStack {
                                                                    Image(systemName: "heart") .resizable() .frame(width: 25, height: 25) .foregroundColor(.gray)
                                                                    Text("7453")
                                                                    Spacer()
                                                                }
                                                            }.padding() .frame(width: 200, height: 200)
                                                        }
                                                    }
                                                    
                                                } .foregroundColor(.black) .padding(20)
                                            }  .flipsForRightToLeftLayoutDirection(false).environment(\.layoutDirection, .leftToRight)
                                       
                                        
                                        
                                    }
                                
                            }
                        } header: {
                            headerView(scrol.size )
                        } .padding(15)
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

        print("proxy frame: \(proxy.frame(in: .scrollView).minY) + \(safeArea.top) = \(minY)")

            return minY > 0 ? 0 : (-minY / 15)
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
