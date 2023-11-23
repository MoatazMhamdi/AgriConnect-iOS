//
//  ForgetPassword.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI

struct ResetPassF: View {
    
   
    @State private var navigationLinkActive: Bool = false

    @State private var isPasswordVisible = false
    @State private var isConfirmPasswordVisible = false


    @ObservedObject var userviewmodel: UserViewModel


    var body: some View{
        
        
        NavigationView {
           
            
            
        
                // Your view content goes here
                
                VStack {
                    Image("farmer")
                        .resizable()
                        .scaledToFit()
                        .padding(-60)
                        .offset(x:0, y:-30)
                    
                    Text("Reset Your Password")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Text("Congrats! Now you can change your password.")
                    
                    ZStack(alignment: .leading) {
                       
                            Text("")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                      
                        HStack {
                            Image(systemName: "phone")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                           
                                TextField("Phone Number", text: $userviewmodel.numTel)
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            
                          
                        }
                    }
                    .frame(width: 343, height: 51)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(10)
                    
                    
                    
                    ZStack(alignment: .leading) {
                       
                            Text("")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                      
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            if isConfirmPasswordVisible {
                                TextField("", text: $userviewmodel.newPassword)
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            } else {
                                SecureField("New Password", text: $userviewmodel.newPassword)
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            }
                            Button(action: {
                                isConfirmPasswordVisible.toggle()
                            }) {
                                Image(systemName: isConfirmPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 8)
                        }
                    }
                    .frame(width: 343, height: 51)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(10)
                  
                    NavigationLink(destination: FarmerProfile(), isActive: $navigationLinkActive) {
                           EmptyView()
                       }
                       Button(action: {
                           navigationLinkActive = true
                           userviewmodel.resetPassword()

                       }) {
                           Text("Send")
                               .font(Font.custom("Inter", size: 20).weight(.bold))
                               .foregroundColor(.white)
                               .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                               .frame(width: 343, height: 51)
                               .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                               .cornerRadius(12)
                       }
                    
                  
                }
            
            
     
            
              
                
            }.navigationBarBackButtonHidden(true)
        
        
        }
        
     
    }

struct ResetPassF_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassF(userviewmodel: UserViewModel())
    }
}
