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
            Image("forgetpass")
                .resizable()
                .scaledToFit()
            
            TextField("User Name", text: $username )
                .padding()
                .font(.title3)
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(-5)
            
            TextField("Email", text: $email )
                .padding()
                .font(.title3)
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
            
            TextField("Password", text: $password )
                .padding()
                .font(.title3)
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(-5)
            
            
            SecureField("Confirm Password", text: $confirmpassword)
                .padding()
                .font(.title3)
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .padding(10)
            
            
            Button("login"){}
                .font(.callout)
                .fontWeight(.heavy)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .toolbar(.hidden, for: .navigationBar)
                .background(Color.gray)
                .cornerRadius(10)
                .padding(-5)

            
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
