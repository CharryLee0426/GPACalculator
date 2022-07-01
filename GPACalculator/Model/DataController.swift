//
//  DataController.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import Foundation
import CoreData

// THis is the most important part of this app.
class DataController: ObservableObject {
    // import the container locally.
    let container = NSPersistentContainer(name: "GPA")
}
