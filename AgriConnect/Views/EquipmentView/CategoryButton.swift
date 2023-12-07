//
//  CategoryButton.swift
//  testagri
//
//  Created by youssef jemmali on 20/11/2023.
//

import SwiftUI

struct CategoryButton: View {
    var category: String
    @Binding var selectedCategory: String

    var body: some View {
        Button(action: {
            self.selectedCategory = category
        }) {
            Text(category)
                .padding()
                .background(selectedCategory == category ? Color.blue : Color.gray)
                .foregroundColor(Color.white)
                .cornerRadius(10)
        }
    }
}

