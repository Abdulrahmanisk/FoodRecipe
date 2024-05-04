//
//  Settings.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 23/12/2023.
//

import SwiftUI

struct Settings: View {
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
            VStack {
                Text("Settings View")
            }
        }
    }
}

#Preview {
    Settings()
}
