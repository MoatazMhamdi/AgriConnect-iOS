//
//  AgriConnectApp.swift
//  AgriConnect
//
//  Created by Moataz Mhamdi on 9/11/2023.
//

import SwiftUI

@main
struct AgriConnectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            FirstPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
