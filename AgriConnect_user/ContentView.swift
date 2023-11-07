//
//  ContentView.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""

    @State private var wrongpassword = ""
    @State private var navigateToLocation = false

    var body: some View{
        
        
        NavigationView {
                   VStack {
                       Image("login")
                           .resizable()
                           .scaledToFit()

                       TextField("Email", text: $email)
                           .padding()
                           .font(.title3)
                           .frame(width: 300, height: 50)
                           .background(Color.black.opacity(0.05))
                           .cornerRadius(10)
                           .padding(10)

                       SecureField("password", text: $password)
                           .padding()
                           .font(.title3)
                           .frame(width: 300, height: 50)
                           .background(Color.black.opacity(0.05))
                           .cornerRadius(10)
                           .padding(10)

                       NavigationLink(destination: SignUp()) {
                           Text("Login")
                       }
                       .font(.callout)
                       .fontWeight(.heavy)
                       .padding(.vertical, 5)
                       .padding(.horizontal, 10)
                       .toolbar(.hidden, for: .navigationBar)
                       .background(Color.gray)
                       .cornerRadius(10)
                       .padding(10)
                   }
               }
           }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }

