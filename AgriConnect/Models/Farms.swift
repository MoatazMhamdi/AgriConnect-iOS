//
//  farm.swift
//  AgriConnect
//
//  Created by ZinaBenSaadallah on 8/11/2023.
//

import Foundation

struct Farms: Identifiable{
    var id = UUID()
    var name : String
    var description : String
    var image : String
    var location : String
    var size : Float
}

var farmList = [Farms(name: "DakotaFarm", description: "khflhslsdhjfjkheef", image: "farm2", location: "haffouz", size: 100.235),
                Farms(name: "DakotaFarm", description: "khflhslsdhjfjkheef", image: "farm2", location: "haffouz", size: 100.235),
                Farms(name: "SpiritFarm", description: "khflhslsdhjfjkheef", image: "farm3", location: "fahs", size: 110.235),
                Farms(name: "SunshineFarm", description: "khflhslsdhjfjkheef", image: "farm4", location: "tazarka", size: 80.235)]
