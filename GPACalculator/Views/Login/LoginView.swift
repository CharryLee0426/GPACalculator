//
//  LoginView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: Login View is used for login

import SwiftUI

struct LoginView: View {
    @State var isLogined: Bool = false
    
    var body: some View {
        if isLogined {
            ProfileView()
        } else {
            SignInView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLogined: true)
    }
}
