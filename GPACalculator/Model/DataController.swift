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
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed to load Data in DataController \(error.localizedDescription)")
            }
        }
    }
    
    // CRUD about user
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved successfully✅")
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addUser(userName: String, userAccount: String, userPassword: String, userAvatar: Double, userGender: Int, context: NSManagedObjectContext) {
        let newUser = User(context: context)
        
        newUser.id = UUID()
        newUser.username = userName
        newUser.useraccount = userAccount
        newUser.userpassword = MD5(plainMessage: userPassword)
        newUser.usergender = Int16(userGender)
        newUser.useravatar = userAvatar
        newUser.userdescription = ""
        
        save(context: context)
    }
    
    func editUser(user: User, userName: String, userPassword: String, userGender: Int, userAvatar: Double, userDescription: String, context: NSManagedObjectContext) {
        user.username = userName
        user.userpassword = MD5(plainMessage: userPassword)
        user.usergender = Int16(userGender)
        user.useravatar = userAvatar
        user.userdescription = userDescription
        
        save(context: context)
    }
}
