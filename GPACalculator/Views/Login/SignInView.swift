//
//  SignInView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isSignin: Bool = false
    @State var isSignUp: Bool = false
    @State private var userAccount: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            ScrollView(.vertical) {
                HStack {
                    Spacer()
                    
                    VStack(alignment: .center) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.secondary)
                        
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    Text("UserAccount")
                        .font(.callout)
                        .bold()
                    
                    TextField("UserAccount...", text: $userAccount)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.callout)
                        .bold()
                    
                    SecureField("UserPassword...", text: $userPassword)
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Text("don't have an account...")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    Button {
                        isSignUp.toggle()
                    } label: {
                        Label("Sign Up", systemImage: "person.badge.plus")
                            .font(.footnote)
                    }
                    .sheet(isPresented: $isSignUp) {
                        SignUpView(isSignUp: $isSignUp)
                    }
                }
                .padding()
                
                HStack {
                    Spacer()

                    Button {
                        //login function, not below
                        isSignin.toggle()
                    } label: {
                        Text("Sign in")
                            .bold()
                            .frame(width: 200)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .alert(isPresented: $isSignin) {
                        Alert(title: Text("Success"), message: Text("Logined successfullly"), dismissButton: .default(Text("OK")))
                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
        .background((colorScheme == .dark) ? Color.black : Color(UIColor.systemGray6))
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
