//
//  User.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 17/11/2023.
//

import Foundation
struct UserRegistration: Codable{
    var name: String
    var email: String
    var password: String
    var numTel: String
 
}
struct RegistrationError: Identifiable {
    let id = UUID()
    let message: String
}

