//
//  FavoriteView.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 9/11/2023.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView{

                    Text("Myrecipes")

                        .padding()

                        .navigationTitle("Favorites")

                }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
