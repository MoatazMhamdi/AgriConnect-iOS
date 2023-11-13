//
//  Settings.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 13/11/2023.
//

import SwiftUI

struct Settings: View {
    @State private var darkscreen = false
    @State private var faceid = false

    var body: some View {
        NavigationView{
        
        ZStack {
            
        
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.3)
            
            Text("Paramétre")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .position(x:380, y:23)
            
            
            ScrollView {              
                HStack {
                  
                    HStack {
                     
                        
                        Image("homme")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 180)
                            .position(x: 250, y: 120)
                    }
                    .padding(.bottom, 160)
                    VStack{
                        NavigationLink(destination: Home()) {
                    Text("Moataz")
                        }
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .position(x:0-20, y:120)
                    
                    Text("Moataz.Mhamdi@gmail.com")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .position(x:24, y:30)
                        .foregroundColor(.green)
                      
                    
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 20))
                        .foregroundColor(Color(.green))
                        .position(x:50, y:-110)
                    
             }
                    
           }
                HStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 450, height: 0.5)
                      .background(Color.gray)
                      .cornerRadius(2)
                      .opacity(0.5)
                      .position(x:350, y: -160)
                }
                
            Text("Account")
                .font(.system(size: 12))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .position(x:230, y:-150)
                HStack{
                    
                    Image("email")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .position(x: 240, y: -120)
                    Text("Email")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:130, y:-118)
                    Text("mo@gmail.com")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:150, y:-115)
                    Image("arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 30)
                        .position(x:50, y: -115)
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 300, height: 0.5)
                      .background(Color.black)
                      .cornerRadius(2)
                      .opacity(0.5)
                      .position(x:-240, y: -90)
                    
                    
                }
                HStack{
                    
                    Image("compte")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .position(x: 240, y: -100)
                    Text("Compte")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:137, y:-98)
                    Text("moataz")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:160, y:-97)
                    Image("arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 30)
                        .position(x:50, y: -97)
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 300, height: 0.5)
                      .background(Color.black)
                      .cornerRadius(2)
                      .opacity(0.5)
                      .position(x:-240, y: -70)
                    
                    
                }
                HStack{
                    
                    Image("appel")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .position(x: 240, y: -80)
                    Text("Téléphone")
                        .font(.system(size: 15))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:144, y:-80)
                    Text("+216...")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:160, y:-80)
                    Image("arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 30)
                        .position(x:50, y: -77)
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 300, height: 0.5)
                      .background(Color.black)
                      .cornerRadius(2)
                      .opacity(0.5)
                      .position(x:-240, y: -50)
                    
                    
                }
                HStack {
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 450, height: 0.5)
                      .background(Color.gray)
                      .cornerRadius(2)
                      .opacity(1)
                      .position(x:350, y: -50)
                }
                
            Text("Systéme")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .position(x:230, y:-40)
                HStack{
                    
                    Image("croissant-de-lune")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .position(x: 240, y: -20)
             
                    Toggle("Dark Mode", isOn: $darkscreen)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .position(x:140, y:-20)

                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 300, height: 0.5)
                      .background(Color.black)
                      .cornerRadius(2)
                      .opacity(0.2)
                      .position(x:-140, y: 10)
                    
                    
                }
                HStack{
                    
                    Image("selfie")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .position(x: 240, y: 3)
             
                    Toggle("FaceID", isOn: $faceid)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                        .position(x:140, y:5)

                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 300, height: 0.5)
                      .background(Color.black)
                      .cornerRadius(2)
                      .opacity(0.2)
                      .position(x:-140, y: 30)
                    
                    
                }
                HStack{
                    
                    Image("cloche")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .position(x: 240, y: 25)
                    Text("Notification")
                        .font(.system(size: 17))
                        .fontWeight(.regular)
                        .foregroundColor(.black)
                        .position(x:172, y:25)
                    Text("Désactiver")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .position(x:150, y:25)
                    
                    Image("arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 30)
                        .position(x:50, y: 27)
                    Rectangle()
                      .foregroundColor(.clear)
                      
                      .frame(width: 300, height: 0.5)
                      .background(Color.black)
                      .cornerRadius(2)
                      .opacity(0.2)
                      .position(x:-240, y: 50)
                    
                    
                }
                NavigationLink(destination: ContentView()) {
                    Text("Déconnécter")
                }
                .font(Font.custom("Inter", size: 20).weight(.bold))
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                .frame(width: 343, height: 51)
                .background(Color(red: 0, green: 0, blue: 0))
                .cornerRadius(12)
                .position(x:370 , y:80)
                
              
                

        }
    }
}  .navigationBarBackButtonHidden(true)
}
}
#Preview {
    Settings()
}
