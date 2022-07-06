//
//  LoginView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: Login View is used for login

import SwiftUI

struct LoginView: View {
    @State var user: FetchedResults<User>.Element?
    @State var isLogined: Bool = false
    
    var body: some View {
        ZStack {
            SignInView(isLogined: $isLogined, signeduser: $user)
            if user != nil {
                ProfileView(user: user, isLogined: $isLogined)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLogined: true)
    }
}
