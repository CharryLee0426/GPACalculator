//
//  IndexView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//  Description: Index view shows index page after logining

import SwiftUI

struct IndexView: View {
    @State var isLogined: Bool = false
    
    var body: some View {
        if isLogined {
            Text("You have been signed up.")
                .foregroundColor(.secondary)
        } else {
            IndexWelcomeView()
        }
    }
}

struct IndexView_Previews: PreviewProvider {
    static var previews: some View {
        IndexView()
    }
}
