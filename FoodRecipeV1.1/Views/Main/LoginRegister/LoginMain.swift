//
//  LoginMain.swift
//  FoodRecipeV1.1
//
//  Created by Abdulrahman isk on 01/01/2024.
//

import SwiftUI

struct LoginMain: View {
    @Namespace var namespace
    @State var show = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            VStack {

                    ButtonsCards(Comp: "Google",CompLR: "Sign", CompImage: "google", destination: AnyView(CompName()))
                    ButtonsCards(Comp: "Facebook",CompLR: "Sign", CompImage: "facebook", destination: AnyView(CompName()))
                    ButtonsCards(Comp: "Apple",CompLR: "Sign", CompImage: "applelogo", destination: AnyView(CompName()))
                
                VStack {
                Divider() 
                    .background(Color.gray)
                    .overlay {
                        HStack {
                            Text("or") .frame(width: 50, height: 10).padding().background(Color.white)
                                .foregroundColor(.gray)
                        }
                    } .padding(.top, 20) .padding(.bottom, 20)
                    
                    }
                VStack {
                    ButtonsCardU(email: "")
                    ButtonsCardP(password: "") .padding(.top, -30)
                }
                buttonsCardL(sss: "Log in")
                Text("Forgot your password?")
                TextButton(TextBtn: "Reset it Here") .foregroundColor(.orange) .bold()
                Text("Don't have an account?")
                TextButton(TextBtn: "Sign up") .foregroundColor(.orange) .bold()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }


                Spacer()
            }
           
        .padding()
        }
    }
}

#Preview {
    LoginMain()
}

struct ButtonsCards: View {
    public var Comp: String
    public var CompLR: String
    public var CompImage: String
    public var destination: AnyView
    var body: some View {
        NavigationLink(destination: destination) {
            HStack {
                Image(CompImage) .resizable() .aspectRatio(contentMode: .fill) .frame(width: 20, height: 20) .padding(.horizontal, 5)
                Text("\(CompLR) up with \(Comp)").font(.subheadline) .foregroundColor(.black)
            }
                .frame(width: 350, height: 50)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
} //Sign-Login
struct ButtonsCardU: View {
    @State public var email: String
    var body: some View {
        TextField("Enter your Email", text: $email)
            .padding()
            .frame(width: 350, height: 56)
            .background(Color.white) .overlay( RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 1))
            .padding()
            .cornerRadius(10)
            .foregroundColor(Color(.black))
    }
} //enter email btn
struct ButtonsCardP: View {
    @FocusState var focus1: Bool
    @FocusState var focus2: Bool
    @State var showPassword: Bool = false
    @State public var password: String
    var body: some View {
        ZStack(alignment: .trailing) {
            TextField("Password", text: $password)
                .textContentType(.password)
                .focused($focus1)
                .opacity(showPassword ? 1 : 0)
            SecureField("Password", text: $password)
                .textContentType(.password)
                .focused($focus2)
                .opacity(showPassword ? 0 : 1)
            Button(action: {
                showPassword.toggle()
                if showPassword { focus1 = true } else { focus2 = true }
            }, label: {
                Image(systemName: self.showPassword ? "eye.slash.fill" : "eye.fill").font(.system(size: 16, weight: .regular))
                    .padding()
            })
        }                     
        .padding()
            .frame(width: 350, height: 56) 
            .background(Color.white) .overlay( RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.3), lineWidth: 1))
            .padding()
            .cornerRadius(10)
            .foregroundColor(Color(.black))
    }
} //btn for password
struct buttonsCardL: View {
    public var sss: String
    var body: some View {
        HStack {
            Text("\(sss)") .font(.subheadline)
        } .frame(width: 350, height: 40) .background(Color.green).cornerRadius(30) .padding() .foregroundColor(.white).fontWeight(.bold)
    }
} //login or register btn
struct TextButton: View {
    public var TextBtn: String
    var body: some View {
        Text(TextBtn) .padding(.bottom, 30) .padding(3)
    }
} //text btn




