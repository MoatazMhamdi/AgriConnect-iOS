//
//  NavBarView.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 8/11/2023.
//

import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {

                   

                   HomeView()

                       .tabItem {

                           Image(systemName: "house")

                           Text("Home")

                       }



                   FavoriteView()

                       .tabItem {

                           Image(systemName: "star")

                           Text("Favorites")

                       }



                   SettingsView()

                       .tabItem {

                           Image(systemName: "gear")

                           Text("Settings")

                       }

               }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
