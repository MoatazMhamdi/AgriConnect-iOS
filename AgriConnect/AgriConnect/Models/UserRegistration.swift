//
//  User.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 17/11/2023.
//

import Foundation
import SwiftUI
import CoreData
struct UserRegistration: Decodable ,Encodable{
    var _id: String?
    var name: String
    var email: String
    var password: String
    var numTel: String
    var role: String?

 
}

struct RegistrationError: Identifiable {
    let id = UUID()
    let message: String
}

