//
//  HashUtils.swift
//  GPACalculator
//
//  Created by 李晨 on 2022/7/2.
//

import Foundation
import CryptoKit

// This is util class for generating hash for password.

// MD5 [legacy]
/// parameters:
///     -plainMessage: String
/// return:
///     String
/// description:
///     This function is used for coverting the plainMessage to hash value by MD5.
///     It's not a safe way although but easy to impletment.
func MD5(plainMessage: String) -> String {
    let digest = Insecure.MD5.hash(data: plainMessage.data(using: .utf8) ?? Data())
    return digest.map {
        String(format: "%02hhx", $0)
    }.joined()
}

// SHA256
/// parameters:
///     -plainMessage: String
/// return:
///     String
/// description:
///     This function is used for coverting the plainMessage to hash value by SHA256.
///     It can be seen as a safe way for encryption
func SHA256(plainMessage: String) -> String {
    let plainData = Data(plainMessage.utf8)
    let hashValue = SHA256.hash(data: plainData)
    let cypherString = hashValue.map {
        String(format: "%02x", $0)
    }.joined()
    return cypherString
}
