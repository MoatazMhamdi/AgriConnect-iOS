//
//  Edit Profile.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 23/11/2023.
//

import Foundation
import SwiftUI

struct Edit: View {
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State private var numTel = ""
    @State private var navigationLinkActive: Bool = false
    @State private var showingAlert = false
    @State private var confirmPassword = ""
    @State private var isPasswordVisible = false
    
    let apiManager = APIManager()

  
     @StateObject private var userViewModel = UserViewModel()
    
    var body: some View {
        
        
        ZStack {
            
            
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.3)
           
            Text("Edit Profile")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .position(x:380, y:23)
            VStack {
               
                Image("name")
                    .resizable()
                    .scaledToFit()
                    .offset(x:0,y:20)
                Text("Please enter your new informations")
                    .fontWeight(.medium)
                    .padding(10)
                
                VStack {
                    ZStack(alignment: .leading) {
                        if name.isEmpty {
                            Text("Username")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            TextField("", text: $name)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                    }
                    .frame(width: 343, height: 51)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(12)
                    .padding(10)
                    
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("Email")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        HStack {
                            Image(systemName: "envelope")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            TextField("", text: $email)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                    }
                    .frame(width: 343, height: 51)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(12)
                    .padding(10)
                }
                ZStack(alignment: .leading) {
                    if numTel.isEmpty {
                        Text("+216")
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    }
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        TextField("", text: $numTel)
                            .font(.title3)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    }
                }
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(12)
                .padding(10)
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password")
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    }
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        if isPasswordVisible {
                            TextField("", text: $password)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        } else {
                            SecureField("", text: $password)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                }
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Password")
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    }
                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                        if isPasswordVisible {
                            TextField("", text: $password)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        } else {
                            SecureField("", text: $password)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 8)
                    }
                }
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
                
                
                NavigationLink(destination: ContentView(), isActive: $navigationLinkActive) {
                    EmptyView()
                }
                Button(action: {
                    navigationLinkActive = true
                    
                    userViewModel.registerClient( name: name, email: email, password: password, numTel: numTel)
                }) {
                    Text("SignUp")
                        .font(Font.custom("Inter", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        .frame(width: 343, height: 51)
                        .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                        .cornerRadius(12)
                }
                
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Succed"), message: Text("Welcome our dear customer"), dismissButton: .default(Text("OK")))
                }
                
            }
                
            }
        
        }
    }


struct Edit_Previews: PreviewProvider {
    static var previews: some View {
        Edit()
    }
}
