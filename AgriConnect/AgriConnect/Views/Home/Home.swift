import SwiftUI

struct Home: View {
    
    var body: some View {
        
        ZStack {
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    
                    ZStack {
                        Ellipse()
                            .foregroundColor(.white)
                            .frame(width: 90, height: 80)
                            .overlay(Ellipse()
                                .inset(by: 2)
                                .stroke(.green, lineWidth: 3))
                            .shadow(color: Color(red: 0.40, green: 0.40, blue: 0.40, opacity: 0.15), radius: 20, y: 4)
                            .position(x: 379, y: 120)
                        
                        Image("homme")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 180)
                            .position(x: 379, y: 120)
                    }
                    .padding(.bottom, 160)
                    
                    ZStack {
                        NavigationLink(destination: ContentView()) {
                            Text("Logout")
                        }
                        .font(Font.custom("Inter", size: 16).weight(.medium))
                        .foregroundColor(.black)
                        .offset(x: 144.50, y: -350)
                        
                        Text("Profile")
                            .font(Font.custom("Inter", size: 30).weight(.semibold))
                            .foregroundColor(.black)
                            .offset(x: 1.50, y: -350)
                        
                        Text("Settings")
                            .font(Font.custom("Inter", size: 16).weight(.medium))
                            .foregroundColor(.black)
                            .offset(x: -139.50, y: -350)
                    }
                    
                    Text("Moataz")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(x: -10, y: -200)
                    
                    Text("Moataz.Mhamdi@gmail.com")
                        .font(.system(size: 25))
                        .fontWeight(.light)
                        .foregroundColor(.blue)
                        .offset(x: -10, y: -200)
                    
                    Image(systemName: "checkmark.seal.fill")
                        .font(.system(size: 25))
                        .foregroundColor(Color(.blue))
                        .offset(x: 65, y: -260)
                    
                    Text("+20")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(x: -70, y: -130)
                    
                    Text("+200DT")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .offset(x: 70, y: -163)
                    
                    Text("Achat Effectué")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .offset(x: -70, y: -160)
                    
                    Text("Achat")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .offset(x: 70, y: -183)
                }
                
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 355, height: 85)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                        .overlay(
                            Image("arrow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .position(x: 300, y: 42)
                        )
                        .overlay(
                            Text("Equipement Enregistrer")
                                .foregroundColor(.black)
                                .position(x: 150, y: 40)
                        )
                        .padding(-150)
                }
                
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 355, height: 85)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                        .overlay(
                            Image("arrow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .position(x: 300, y: 42)
                        )
                        .overlay(
                            Text("Shop")
                                .foregroundColor(.black)
                                .position(x: 150, y: 40)
                        )
                        .padding(-60)
                }
                
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 355, height: 85)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                        .overlay(
                            Image("arrow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .position(x: 300, y: 42)
                        )
                        .overlay(
                            Text("Liste Produit")
                                .foregroundColor(.black)
                                .position(x: 150, y: 40)
                        )
                        .padding(30)
                }
                
                HStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 355, height: 85)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4)
                        .overlay(
                            Image("arrow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .position(x: 300, y: 42)
                        )
                        .overlay(
                            Text("Settings")
                                .foregroundColor(.black)
                                .position(x: 150, y: 40)
                        )
                        .padding(-20)
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
