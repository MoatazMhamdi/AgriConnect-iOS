//
//  AgriConnectApp.swift
//  AgriConnect
//
//  Created by ZinaBenSaadallah on 8/11/2023.
//

import SwiftUI

@main
struct AgriConnectApp: App {
    
    var body: some Scene {
        WindowGroup {
            Farm(farm : Farms(name: "DakotaFarm", description: "khflhslsdhjfjkheef", image: "farm2", location: "haffouz", size: 100.235))
        }
    }
}
