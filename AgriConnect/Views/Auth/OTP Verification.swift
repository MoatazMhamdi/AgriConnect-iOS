//
//  OTF Verification.swift
//  AgriConnect_user
//
//  Created by MoatazMhamdi on 7/11/2023.
//

import SwiftUI

struct OTP_Verification: View {
    @State private var otp = ""
    @State private var navigateToLocation = false
    
    var body: some View{
        
        
        NavigationView {
            
            
            
            
            // Your view content goes here
            
            VStack {
                Image("otfverif")
                    .resizable()
                    .scaledToFit()
                    .padding(-60)
                
                Text("OTF Verfication")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                Text("Enter your verification code.")
                
                
                HStack(spacing: 16) {
                    ForEach(0..<4) { index in
                        Rectangle()
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text(getDigit(at: index))
                                    .font(.title)
                                    .foregroundColor(.black)
                            )
                            .foregroundColor(Color(red: 1, green: 1, blue: 1))
                            .cornerRadius(0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.green, lineWidth: 1)
                            )
                    }
                }
                .padding(10)
                
                
                
                
                NavigationLink(destination: ResetPassword()) {
                    Text("Send")
                }
                .font(Font.custom("Inter", size: 20).weight(.bold))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .frame(width: 343, height: 51)
                .background(Color(red: 0.37, green: 0.69, blue: 0.46))
                .cornerRadius(12)
                .padding(10)
              
                
            }
            
            
            
        }.navigationBarBackButtonHidden(true)
        
        
    }
    
    private func getDigit(at index: Int) -> String {
        let otpDigits = Array(otp)
        if index < otpDigits.count {
            return String(otpDigits[index])
        } else {
            return ""
        }
    }
    
    
    struct OTP_Verification_Previews: PreviewProvider {
        static var previews: some View {
            OTP_Verification()
        }
    }
}
