import SwiftUI

struct FarmerProfile: View {
    @State private var navigationLinkActive: Bool = false

    @StateObject var siginViewModel = SigInViewModel()

    var body: some View {
        NavigationView{
            
            ZStack {
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3)
                
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
                            
                            Image("fermier")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 180)
                                .position(x: 379, y: 120)
                        }
                        .padding(.bottom, 160)
                        
                        ZStack {
                            
                            
                            Text("Profile")
                                .font(Font.custom("Inter", size: 27).weight(.semibold))
                                .foregroundColor(.black)
                                .offset(x: 1.50, y: -350)
                            
                        }
                        
                        Text("F X")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(x: -10, y: -200)
                        
                        Text("Xfarmer@gmail.com")
                            .font(.system(size: 15))
                            .fontWeight(.light)
                            .foregroundColor(.blue)
                            .offset(x: -10, y: -205)
                        
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.06, green: 0.21, blue: 0.19))
                            .offset(x: 65, y: -250)
                        
                        Text("+20")
                        
                            .font(.system(size: 22))
                        
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(x: -70, y: -230)
                        
                        Text("+200DT")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .offset(x: 70, y: -250)
                        
                        Text("Achat Effectué")
                            .font(.system(size: 13))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .offset(x: -70, y: -250)
                        
                        Text("Achat")
                            .font(.system(size: 13))
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .offset(x: 70, y: -265)
                    }
                    HStack{
                        VStack(alignment: .leading, spacing: 0) {
                            NavigationLink(destination: Setting()) {
                                Text("Edit")
                            }
                            .font(Font.custom("SF Pro Text", size: 14).weight(.medium))
                            .lineSpacing(18)
                            .foregroundColor(.white)
                        }
                        
                        .padding(
                            EdgeInsets(top: 5.50, leading: 16, bottom: 6.50, trailing: 16)
                        )
                        .frame(width: 91, height: 30)
                        .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                        .cornerRadius(10)
                        .position(x:320, y:-220)
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Accueil")
                                .font(Font.custom("SF Pro Text", size: 14).weight(.medium))
                                .lineSpacing(18)
                                .foregroundColor(.white)
                        }
                        .padding(
                            EdgeInsets(top: 5.50, leading: 16, bottom: 6.50, trailing: 16)
                        )
                        .frame(width: 91, height: 30)
                        .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                        .cornerRadius(10)
                        .position(x:50, y:-220)
                    }
                    
                    
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(.clear)
                        
                            .frame(width: 500, height: 0.5)
                            .background(Color.black)
                            .cornerRadius(2)
                            .opacity(0.2)
                            .position(x:350, y: -200)
                    }
                    Text("Account")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .position(x:230, y:-190)
                    
                    HStack{
                        
                        Image("shop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .position(x: 240, y: -170)
                        
                        Text("Achat")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .position(x:170, y:-170)
                        
                        Image("arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 30)
                            .position(x:100, y: -170)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                        
                            .frame(width: 300, height: 0.5)
                            .background(Color.black)
                            .cornerRadius(2)
                            .opacity(0.2)
                            .position(x:-200, y: -140)
                        
                        
                    }
                    HStack{
                        
                        Image("location")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .position(x: 240, y: -140)
                        
                        Text("Envoyer Localisation")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .position(x:170, y:-140)
                        
                        Image("arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 30)
                            .position(x:100, y: -140)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                        
                            .frame(width: 300, height: 0.5)
                            .background(Color.black)
                            .cornerRadius(2)
                            .opacity(0.2)
                            .position(x:-200, y: -110)
                        
                        
                    }
                    HStack{
                        
                        Image("parametres")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .position(x: 240, y: -110)
                        
                        Text("Paramétre")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .position(x:170, y:-110)
                        
                        Image("arrow")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 30)
                            .position(x:100, y: -110)
                        
                        
                        Rectangle()
                            .foregroundColor(.clear)
                        
                            .frame(width: 300, height: 0.5)
                            .background(Color.black)
                            .cornerRadius(2)
                            .opacity(0.2)
                            .position(x:-200, y: -80)
                        
                        
                    }
                    NavigationLink(destination: SignInF(), isActive: $navigationLinkActive) {
                        EmptyView()
                    }
                    Button(action: {
                        navigationLinkActive = true
                        siginViewModel.logout()
                        
                        
                    }) {
                        Text("Déconnecter")
                            .font(Font.custom("Inter", size: 20).weight(.bold))
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            .frame(width: 343, height: 51)
                            .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                            .cornerRadius(12)
                    }.position(x:375,y:0)
                    
                    
                    
                }
                
            }
        }  .navigationBarBackButtonHidden(true)

    }
}

struct FarmerProfile_Previews: PreviewProvider {
    static var previews: some View {
        FarmerProfile()
    }
}
