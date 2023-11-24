//
//  Produit.swift
//  AgriConnect
//
//  Created by zina ben saadallah on 15/11/2023.
//

import Foundation
struct Produit: Identifiable{
    var id = UUID()
    var name : String
    var quantiteEnStock : Int
    var dateRecolte: String
    var image : String

}

var ProduitList = [
    Produit(name: "tomato", quantiteEnStock: 12, dateRecolte : "janvier" , image: "apple"),
    Produit(name: "banana", quantiteEnStock: 12, dateRecolte : "janvier" , image: "banana"),
    Produit(name: "madanina", quantiteEnStock: 12, dateRecolte : "janvier" , image: "madanina"),
    Produit(name: "grape", quantiteEnStock: 12, dateRecolte : "janvier" , image: "grape")]
