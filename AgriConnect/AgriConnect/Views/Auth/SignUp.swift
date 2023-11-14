import SwiftUI

struct SignUp: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var confirmPassword = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack {
            Text("SignUP")
                .font(.title)
                .fontWeight(.black)
                .padding(10)
            
            Text("Please enter your personal information")
                .fontWeight(.medium)
                .padding(10)
            
            VStack {
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Username")
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    }
                    HStack {
                        Image(systemName: "person")
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
                }
                
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
         
            
            NavigationLink(destination: Home()) {
                Text("Register")
                    .font(Font.custom("Inter", size: 20).weight(.black))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                    .frame(width: 343, height: 51)
                    .background(Color(red: 0, green: 0, blue: 0))
                    .cornerRadius(12)
            }
            
      
            
            VStack(spacing: 20) {
                Text("or Sign In with")
                    .foregroundColor(.gray)
                
                VStack {
                    VStack{
               
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
    }


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
