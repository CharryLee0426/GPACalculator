//
//  ContentView.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/1.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .index
    enum Tab {
        case index
        case profile
    }
    
    var body: some View {
        TabView(selection: $selection) {
            IndexView()
                .tabItem({
                    Label("Index", systemImage: "list.number")
                })
                .tag(Tab.index)
            
            LoginView()
                .tabItem({
                    Label("Me", systemImage: "person")
                })
                .tag(Tab.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
