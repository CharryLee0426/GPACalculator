//
//  SignInView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import SwiftUI

struct SignInView: View {
    @State var isSignUp: Bool = false
    @State private var userAccount: String = ""
    @State private var userPassword: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Form {
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
                
                Section("Account") {
                    TextField("User Accounct...", text: $userAccount)
                }
                
                Section("Password") {
                    VStack(alignment: .trailing) {
                        SecureField("User Password...", text: $userPassword)
                        Divider()
                        HStack {
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
                                SignUpView()
                            }
                        }
                    }
                }
            }
            
            HStack {
                Spacer()

                Button {
                    //login
                } label: {
                    Text("Sign in")
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .background(Color(UIColor.systemGray6))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
