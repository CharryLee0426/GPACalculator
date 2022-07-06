//
//  SignInView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.colorScheme) var colorScheme
    @FetchRequest(sortDescriptors: [SortDescriptor(\.useravatar, order: .reverse)]) var users: FetchedResults<User>
    
    @Binding var isLogined: Bool
    @Binding var signeduser: FetchedResults<User>.Element?
    @State var isSignUp: Bool = false
    @State var isFailSignUp: Bool = false
    @State private var userAccount: String = ""
    @State private var userPassword: String = ""
    
    private func selectUser(userAccount: String, userPassword: String) -> FetchedResults<User>.Element? {
        for user in users {
            if user.useraccount! == userAccount && user.userpassword! == MD5(plainMessage: userPassword) {
                return user
            }
        }
        
        return nil
    }
    
    private func signin() {
        print("click sign in")
        if selectUser(userAccount: userAccount, userPassword: userPassword) != nil {
            signeduser = selectUser(userAccount: userAccount, userPassword: userPassword)
            print("sign in successfully✅")
            userAccount = ""
            userPassword = ""
            isFailSignUp = false
            isLogined = true
        } else {
            isFailSignUp = true
            print("Failed to login")
        }
    }
    
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
                        #if os(iOS)
                        withAnimation(.spring(response: 1, dampingFraction: 0.5, blendDuration: 0.5)) {
                            signin()
                        }
                        #endif
                    } label: {
                        Text("Sign in")
                            .bold()
                            .frame(width: 200)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
//                    .alert(isPresented: $falsse) {
//                        Alert(title: Text("Success"), message: Text("Logined successfullly"), dismissButton: .default(Text("OK")))
//                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
            }
        }
        .background((colorScheme == .dark) ? Color.black : Color(UIColor.systemGray6))
        .offset(x: isLogined ? -2000 : 0)
    }
}

//struct SignInView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignInView(isLogined: .constant(false))
//    }
//}
