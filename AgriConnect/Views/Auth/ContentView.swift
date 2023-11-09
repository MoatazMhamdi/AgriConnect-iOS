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
    @State private var rememberMe = false
       
    @State private var wrongpassword = ""
    @State private var navigateToLocation = false

    var body: some View{
        
    
            NavigationView {
               
                    
                    // Your view content goes here
                    
                    VStack {
                        Image("login")
                            .resizable()
                            .scaledToFit()
                        
                        Text("LOGIN")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(10)
                        
                        Text("Please enter you data to connect")
                        
                        TextField("Email", text: $email)
                        
                            .font(.title3)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            .frame(width: 343, height: 51)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(12)
                            .padding(10)
                        
                        SecureField("Password", text: $password)
                        
                            .font(.title3)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            .frame(width: 343, height: 51)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .padding(10)
                        Toggle("Remember Me", isOn: $rememberMe)
                                                .foregroundColor(.gray)
                                                .padding(.leading, 10)
                        
                        
                        NavigationLink(destination: ForgetPassword()) {
                            Text("Forgot password?")
                        }
                        .font(Font.custom("Inter", size: 16).weight(.semibold))
                        .foregroundColor(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .padding(EdgeInsets(top: 5, leading: 55, bottom: 5, trailing: -150))
                        
                        
                        
                        NavigationLink(destination: Home()) {
                            Text("Login")
                        }
                        .font(Font.custom("Inter", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        .frame(width: 343, height: 51)
                        .background(Color(red: 0.37, green: 0.69, blue: 0.46))
                        .cornerRadius(12)
                        
                        NavigationLink(destination: SignUp()) {
                            Text("Create you personal account!")
                        }
                        .font(Font.custom("Inter", size: 20).weight(.black))
                        .foregroundColor(Color.blue)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 30))
                        
                        
                        
                        
                        
                        
                    }
                    
          
                
            }.navigationBarBackButtonHidden(true)
            
            
        }
    
     
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
