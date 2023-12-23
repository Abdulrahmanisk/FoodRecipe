//
//  ContentView.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 23/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
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
                    if tabSelected == .gearshape {
                        Settings()
                    }
                }
            }
            VStack {
                Spacer()
                TabBar(selectedTab: $tabSelected)
            }
        }
    }
}

#Preview {
    ContentView()
}
