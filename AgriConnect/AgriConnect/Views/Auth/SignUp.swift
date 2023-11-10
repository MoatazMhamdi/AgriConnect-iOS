//
//  SignUp.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var confirmpassword = ""
    
    var body: some View {
        
        VStack{
            Text("SignUP")
                .font(.title)
                .fontWeight(.black)
                .padding(10)
            
            Text("Please enter you personal informations")
                .fontWeight(.medium)
                .padding(10)
            
            TextField("User Name", text: $username )
                .font(.title3)
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
            
            TextField("Email", text: $email )
                .font(.title3)
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
            
            TextField("Password", text: $password )
            
                .font(.title3)
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(15)
            
            
            SecureField("Confirm Password", text: $confirmpassword)
                .font(.title3)
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .frame(width: 343, height: 51)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
            
            NavigationLink(destination: Home()) {
                
                Text("Registre")
                
            }
            .font(Font.custom("Inter", size: 20).weight(.black))
            .foregroundColor(.white)
            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
            .frame(width: 343.0, height: 51)
            .background(Color(red: 0.37, green: 0.69, blue: 0.46))
            .cornerRadius(12)
            
            
            
        }
        
        Spacer()
        VStack(spacing: 20) {
            
            Text("or Sign In with")
            
                .foregroundColor(.gray)
            
            
            
            HStack {
                
                Button(action: {
                    
                    // Redirect to Google Sign In
                    
                    if let url = URL(string: "https://accounts.google.com/ServiceLogin") {
                        
                        UIApplication.shared.open(url)
                        
                    }
                    
                }) {
                    
                    Text("Google")
                    
                        .foregroundColor(.white)
                    
                        .bold()
                    
                        .frame(maxWidth: .infinity)
                    
                        .padding()
                    
                        .background(Color.green)
                    
                        .cornerRadius(10)
                    
                }
                
                
                
                
            }
            
            
            
            Button(action: {
                
                // Redirect to Facebook Sign In
                
                // Replace "your_facebook_app_id" with your actual Facebook App ID
                
                if let url = URL(string: "https://www.facebook.com/v10.0/dialog/oauth?client_id=your_facebook_app_id&redirect_uri=https://www.facebook.com/connect/login_success.html") {
                    
                    UIApplication.shared.open(url)
                    
                }
                
            }) {
                
                Text("Facebook")
                
                    .foregroundColor(.white)
                
                    .bold()
                
                    .frame(maxWidth: .infinity)
                
                    .padding()
                
                    .background(Color.green)
                
                    .cornerRadius(10)
                
            }
            
        }
        
    }
        
}
    

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
