//
//  LoadView.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 30/12/2023.
//

import SwiftUI

struct LoadView: View {
    @State var isActive: Bool = false
    struct CustomColor {
        static let bbb = Color("bbb")
    }
    var body: some View {
        VStack {
            VStack {
                if self.isActive {
                    HomeView()
                } else {
                    
                    GifImage("loading") .background(.black) .frame(width: 700, height: 500)
                }
            }
            
        }
        .frame(width: 1000, height: 1000) .background(CustomColor.bbb)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
    
}


#Preview {
    LoadView()
}
