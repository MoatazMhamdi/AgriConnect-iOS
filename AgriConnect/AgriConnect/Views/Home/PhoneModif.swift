//
//  ForgetPassword.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI

struct PhoneModif: View {
    @State private var email = ""
    @State private var password = ""

    @State private var wrongpassword = ""
    @State private var navigateToLocation = false

    var body: some View{
        
        
        NavigationView {
           
            
            
        
                // Your view content goes here
                
                VStack {
                    Image("p")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Modifier Numéro Portable")
                        .font(.title)
                        .fontWeight(.bold)
                        
                    
                    Text("Modifier numero portable.")
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("+216")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        HStack {
                            Image(systemName: "phone")
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
                    
                   
                  
                    
                    NavigationLink(destination: Settings()) {
                        Text("Confirmer")
                    }
                    .font(Font.custom("Inter", size: 20).weight(.bold))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    .frame(width: 343, height: 51)
                    .background(Color(red: 0, green: 0, blue: 0))
                    .cornerRadius(12)
                  
                }
            
              
                
            }
        
        
    }
        
     
    }

struct PhoneModif_Previews: PreviewProvider {
    static var previews: some View {
        PhoneModif()
    }
}
