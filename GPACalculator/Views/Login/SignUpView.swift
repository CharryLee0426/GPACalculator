//
//  SignUpView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: SignUpView is used for signing up if user
//               don't have an account

import SwiftUI

struct SignUpView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var isSignUp: Bool
    @State var userName: String = ""
    @State var isSucceessSignUP: Bool = false
    @State var isShowPassword: Bool = false
    @State var userAccount: String = ""
    @State var userPassword: String = ""
    @State var userAvatar: Double = 0.0
    // 1 for male; 0 for female
    @State var userGender: Int = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("UserName...", text: $userName)
                        .textFieldStyle(.plain)
                } header: {
                        Text("Name")
                            .bold()
                } footer: {
                    Text("It will show at your profile")
                }
                
                Section {
                    TextField("UserAccount...", text: $userAccount)
                        .textFieldStyle(.plain)
                } header: {
                    Text("Account")
                        .bold()
                } footer: {
                    Text("You will use account to login")
                }
                
                Section {
                    ZStack {
                        if isShowPassword {
                            TextField("UserPassword...", text: $userPassword)
                                .textFieldStyle(.plain)
                        } else {
                            SecureField("UserPassword...", text: $userPassword)
                                .textFieldStyle(.plain)
                        }
                        
                        HStack {
                            Spacer()
                            Button {
                                // It seems that no animation is the
                                // best solution.
                                isShowPassword.toggle()
                            } label: {
                                Image(systemName: isShowPassword ? "eye.fill" : "eye.slash")
                            }
                        }
                    }
                } header: {
                    Text("Password")
                        .bold()
                }
                
                Section {
                    Picker("", selection: $userGender) {
                        Text("🚹")
                            .tag(1)
                        Text("🚺")
                            .tag(0)
                    }
                    .pickerStyle(.segmented)
                } header: {
                    HStack {
                        Text("Gender: ")
                        if userGender == 1 {
                            Text("🚹")
                        } else {
                            Text("🚺")
                        }
                    }
                }
                
                Section {
                    VStack(alignment: .center) {
                        HStack {
                            Spacer()
                            
                            Avatar()
                                .frame(width: 300, height: 300)
                                .scaleEffect(1.0 / 3.0)
                                .frame(width: 100, height: 100)
                                .hueRotation(Angle(degrees: userAvatar))
                            
                            Spacer()
                        }
                        Slider(value: $userAvatar, in: 0...360, step: 0.1)
                    }
                } header: {
                    Text("Avatar")
                        .bold()
                } footer: {
                    Text("Drag to personalize your avatar")
                }
                
                Section {
                    HStack{
                        Spacer()
                        
                        Button {
                            // sign up method
                            isSucceessSignUP.toggle()
                        } label: {
                            Text("Sign UP🔥")
                        }
                        .alert(isPresented: $isSucceessSignUP) {
                            Alert(title: Text("Success"), message: Text("You created an account successfully!"), dismissButton: .default(Text("OK")))
                        }
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("Sign Up")
            .toolbar {
                Button {
                    isSignUp.toggle()
                } label: {
                    VStack {
                        Label("Exit", systemImage: "rectangle.portrait.and.arrow.right")
                        Text("Exit")
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(isSignUp: .constant(true))
    }
}
