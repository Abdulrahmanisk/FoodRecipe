//
//  Settings.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 23/12/2023.
//

import SwiftUI

struct Profile: View {
    struct CustomColor {
        static let colour = Color("F5F5EB")
        static let Rounded = Color("Rounded")
        static let OrFill = Color("OrFill")
        static let OrStroke = Color("OrStroke")
        static let SeeAll = Color("SeeAll")
    }
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 10) {
                Image("recipe") .resizable() .frame(width: 200, height: 200) .padding(10)
                Text("To discover all our tastebud tickling recipes and features, please sign up.") .multilineTextAlignment(.center) .font(.title2.weight(.bold)) .padding()
                ButtonsCards(Comp: "Google",CompLR: "Sign", CompImage: "google",  destination: AnyView(CompName()))
                ButtonsCards(Comp: "Facebook",CompLR: "Sign", CompImage: "facebook",  destination: AnyView(CompName()))
                ButtonsCards(Comp: "Apple",CompLR: "Sign", CompImage: "applelogo",   destination: AnyView(CompName()))
                buttonsCardL(sss: "Sign up with email")
                Text("By signing up I accept the terms of use and the data privacy policy") .fontWeight(.light) .foregroundColor(.gray) .font(.system(size: 12)) .padding(.horizontal, 20)
                
                Text("Already have an account?") .padding(.top, 20)
                    NavigationLink(destination: LoginMain()) {
                        TextButton(TextBtn: "LOG IN HERE")
                            .foregroundColor(.orange)
                            .bold()
                    }
                    
            }
        }
    }
}

#Preview {
    Profile()
}
