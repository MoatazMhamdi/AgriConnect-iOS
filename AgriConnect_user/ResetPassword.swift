//
//  ForgetPassword.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI

struct ResetPassword: View {
    
    @State private var password = ""

  
    @State private var navigateToLocation = false

    var body: some View{
        
        
        NavigationView {
           
            
            
        
                // Your view content goes here
                
                VStack {
                    Image("otfverif")
                        .resizable()
                        .scaledToFit()
                        .padding(-60)
                    
                    Text("Reset Password")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Text("Congrats! Now you can change your password.")
                    
                    SecureField("Password", text: $password)
                        
                        .font(.title3)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        .frame(width: 343, height: 51)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .padding(10)
                    SecureField("Confirm Password", text: $password)
                        
                        .font(.title3)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        .frame(width: 343, height: 51)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .padding(10)
                   
                  
                    
                    NavigationLink(destination: OTF_Verification()) {
                        Text("Send")
                    }
                    .font(Font.custom("Inter", size: 20).weight(.bold))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    .frame(width: 343, height: 51)
                    .background(Color(red: 0.37, green: 0.69, blue: 0.46))
                    .cornerRadius(12)
                  
                }
            
              
                
            }
        
        
        }
        
     
    }

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
