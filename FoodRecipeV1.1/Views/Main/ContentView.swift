//
//  ContentView.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 23/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    struct CustomColor {
        static let bbb = Color("bbb")
    }

    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    if tabSelected == nil {
                        LoadView()
                    }
                    if tabSelected == .house {
                        HomeView()
                    }
                    if tabSelected == .book {
                        CategoriesView()
                    }
                    if tabSelected == .heart {
                        FavoritesView()
                    }
                    if tabSelected == .plus {
                        NewRecipeView()
                    }
                    if tabSelected == .person {
                        Profile()
                    }
                }
            }
            VStack {
                Spacer()
                TabBar(selectedTab: $tabSelected)
                
                
            }  .ignoresSafeArea()
        }
    }
}



#Preview {
    ContentView()
}
