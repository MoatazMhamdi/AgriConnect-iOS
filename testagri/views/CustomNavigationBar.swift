//
//  CustomNavigationBar.swift
//  testagri
//
//  Created by youssef jemmali on 20/11/2023.
//

import SwiftUI

struct CustomNavigationBar: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.custom("YourCustomFontName", size: 20)) // Custom font
                .foregroundColor(Color.blue) // Custom color
                .padding()
                .background(Color.white) // Or any background color for the bar

            Divider() // This acts as the bottom border
        }
    }
}


