//
//  GPACalculatorApp.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/1.
//

import SwiftUI

@main
struct GPACalculatorApp: App {
    // Inject the data model to App
    @State private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
