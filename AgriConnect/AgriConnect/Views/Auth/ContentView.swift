import SwiftUI
import CoreData

struct ContentView: View {
    @State private var numTel = ""
    @State private var password = ""
    @State private var rememberMe = false
    @State private var isPasswordVisible = false
    @State private var navigationLinkActive: Bool = false
    @State private var wrongpassword = ""
    @State private var navigateToLocation = false
    @State var isLogged = false
    @StateObject var siginViewModel = SigInViewModel()
    var body: some View {
        
        
     
            NavigationView {
                VStack {
                   
                    Text("LOGIN")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)
                    
                    Text("Please enter your data to connect")
                    
                    ZStack(alignment: .leading) {
                        if numTel.isEmpty {
                            Text("Email")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        HStack {
                            Image(systemName: "person")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            TextField("", text: $numTel)
                                .font(.title3)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                    }
                    .frame(width: 343, height: 51)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(12)
                    .padding(10)
                    
                    ZStack(alignment: .leading) {
                        if password.isEmpty {
                            Text("Password")
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                        }
                        HStack {
                            Image(systemName: "lock")
                                .foregroundColor(.gray)
                                .padding(.leading, 8)
                            if isPasswordVisible {
                                TextField("", text: $password)
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            } else {
                                SecureField("", text: $password)
                                    .font(.title3)
                                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                            }
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 8)
                        }
                    }
                    .frame(width: 343, height: 51)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .padding(10)
                    
                    Toggle("Remember Me", isOn: $rememberMe)
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    
                    NavigationLink(destination: ForgetPassword()) {
                        Text("Forgot password?")
                    }
                    .font(Font.custom("Inter", size: 14).weight(.semibold))
                    .foregroundColor(Color(red: 0.06, green: 0.21, blue: 0.19))
                    
                    .padding(EdgeInsets(top: 5, leading: 55, bottom: 5, trailing: -150))
                    
                    
                    
                    
                    
                    NavigationLink(destination: Home(), isActive: $navigationLinkActive) {
                           EmptyView()
                       }
                       Button(action: {
                           navigationLinkActive = true      
                           SigInViewModel().login(numTel: numTel, password: password) { result in
                               switch result {
                               case .success(let user):
                                   isLogged = true
                                   print(user)
                               case .failure(let error):
                                   // Handle login error
                                   print(error)
                               }
                           }
                       }) {
                           Text("Login")
                               .font(Font.custom("Inter", size: 20).weight(.bold))
                               .foregroundColor(.white)
                               .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                               .frame(width: 343, height: 51)
                               .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                               .cornerRadius(12)
                       }
                    
                    NavigationLink(destination: SignUp()) {
                        Text("Create your personal account!")
                    }
                    .font(Font.custom("Inter", size: 16).weight(.black))
                    .foregroundColor(Color(red: 0.06, green: 0.21, blue: 0.19))
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 30))
                    
                    
                    
                    VStack(spacing: 20) {
                        Text("or Sign In with")
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
                      
                            
                            Button(action: {
                                // Redirect to Google Sign In
                                if let url = URL(string: "https://accounts.google.com/ServiceLogin") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                HStack {
                                    Image("g")
                                        .resizable()
                                        .scaledToFit()
                                    }
                                    Text("Google")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color.red)
                                .cornerRadius(10)
                            }
                            
                            Button(action: {
                                // Redirect to Facebook Sign In
                                if let url = URL(string: "https://www.facebook.com/v10.0/dialog/oauth?client_id=your_facebook_app_id&redirect_uri=https://www.facebook.com/connect/login_success.html") {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                HStack {
                                    Image("f")
                                        .resizable()
                                        .scaledToFit()
                                    }
                                    Text("Facebook")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                .frame(width: 200, height: 30)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                            }
                        }
                
                   
                    
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
