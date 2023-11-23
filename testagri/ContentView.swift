//
//  ContentView.swift
//  testagri
//
//  Created by youssef jemmali on 14/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        AcceuilView()
    }

}
