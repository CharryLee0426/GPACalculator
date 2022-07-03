//
//  UserTest.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/3.
//  Description: This is a test class for developing the ProfileView without model.

import Foundation

struct UserTest: Hashable, Codable, Identifiable {
    var id: UUID
    var userName: String
    var userAccount: String
    var userPassword: String
    var userGender: Int
    var userDescription: String
    var userAvatar: Double
}
