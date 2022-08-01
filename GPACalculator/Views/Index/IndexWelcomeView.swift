//
//  IndexWelcomeView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: Index Welcome View is used for noticing users to login

import SwiftUI

struct IndexWelcomeView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Spacer()
                
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .foregroundColor(.blue)
                
                Spacer()
            }
            .padding()
            
            Text("It seems that you have not")
                .font(.title)
            Text("signed in")
                .font(.title)
        }
    }
}

struct IndexWelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        IndexWelcomeView()
    }
}
