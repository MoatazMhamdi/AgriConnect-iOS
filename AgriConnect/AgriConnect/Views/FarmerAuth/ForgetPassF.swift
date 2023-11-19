//
//  ForgetPassword.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI

struct ForgetPassF: View {
    @State private var email = ""
    @State private var password = ""
    @State private var navigationLinkActive: Bool = false

    @State private var wrongpassword = ""
    @State private var navigateToLocation = false

    var body: some View{
        
        
        NavigationView {
           
            
            
        
                // Your view content goes here
                
                VStack {
                    Image("forgetpass")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Send email")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Text("Don't Worry! It occurs. Please Enter your email")
                    
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
                    
                   
                  
                    
                    NavigationLink(destination: OTP_Verification()) {
                        Text("Send")
                    }
                    .font(Font.custom("Inter", size: 20).weight(.bold))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    .frame(width: 343, height: 51)
                    .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                    .cornerRadius(12)
                  
                }
            
              
                
            }
        
        
    }
        
     
    }

struct ForgetPassF_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPassF()
    }
}
