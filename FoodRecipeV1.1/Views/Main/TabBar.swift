//
//  TabBar.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 23/12/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case book = "book"
    case plus = "plus.circle"
    case heart
    case person
}
struct TabBar: View {
    struct CustomColor {
        static let blue2 = "book1"
    }
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .orange
        case .book:
            return Color(CustomColor.blue2)
        case .plus:
            return .green
        case .heart:
            return .red
        case .person:
            return .gray
        }
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 80)
            .background(.white)
            .cornerRadius(10)
            
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selectedTab: .constant(.house))
    }
}
