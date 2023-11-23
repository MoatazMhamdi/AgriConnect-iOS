//
//  Equipment.swift
//  testagri
//
//  Created by youssef jemmali on 14/11/2023.
//

import Foundation
import UIKit

struct Equipment: Identifiable, Codable {
    var id: String?
    var name: String
    var image: String
    var categorie: String
    var description: String
    var etat: String
    var imageUrl: String?
    
    
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, image, categorie, description, etat
    }
}
