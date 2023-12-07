import SwiftUI
import CoreData

struct FirstPage: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isPasswordVisible = false
    @State private var navigationLinkActive: Bool = false

    @State private var wrongpassword = ""
    @State private var navigateToLocation = false
    
    var body: some View {
        
        
     
            NavigationView {
                ZStack {
                    Image("bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.3)
                
                VStack {
                    
                     
                   
                }
                    VStack{
                    
                    
                        Image("2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .padding(-40)
                        Text("Hello! This AgriConnect World ")
                            .foregroundColor(.gray)
                        
                        VStack {
                            VStack{
                       
                                NavigationLink(destination: SignInF(), isActive: $navigationLinkActive) {
                                       EmptyView()
                                   }
                                   Button(action: {
                                       navigationLinkActive = true
                                   }) {
                                HStack {
                                    Image("fermier")
                                        .resizable()
                                        .scaledToFit()
                                    }
                                    Text("Farmer")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                                .cornerRadius(10)
                            }.padding(10)
                            
                            NavigationLink(destination: ContentView(), isActive: $navigationLinkActive) {
                                   EmptyView()
                               }
                               Button(action: {
                                   navigationLinkActive = true
                               }) {
                                HStack {
                                    Image("h")
                                        .resizable()
                                        .scaledToFit()
                                    }
                                    Text("User")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                                .cornerRadius(10)
                            
                    }
                            
                            
                       
                            }
                     
                
                
                    
                }
            }
            .navigationBarBackButtonHidden(true)
        }
}
    
    
    struct FirstPage_Previews: PreviewProvider {
        static var previews: some View {
            FirstPage().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
