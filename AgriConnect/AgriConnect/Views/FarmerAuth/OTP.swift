import SwiftUI

struct OTP: View {


    @State private var navigationLinkActive: Bool = false
    @ObservedObject var userviewModel: UserViewModel


    var body: some View {
        VStack {
            
            Image("farmer")
                .resizable()
                .scaledToFit()
                .padding(-60)
                .offset(x:0, y:-30)
            Text("Validation OTP")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Enter your verification code.")
            
            ZStack(alignment: .leading) {
               
                    Text("")
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    TextField("Write Code Here", text: $userviewModel.numTel)
                        .font(.title3)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                }
            }
            .frame(width: 343, height: 51)
            .background(Color.black.opacity(0.05))
            .cornerRadius(12)
            .padding(10)
            
            ZStack(alignment: .leading) {
               
                    Text("")
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                
                HStack {
                    Image(systemName: "pencil")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    TextField("OTP code", text: $userviewModel.otp)
                        .font(.title3)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                }
            }
            .frame(width: 343, height: 51)
            .background(Color.black.opacity(0.05))
            .cornerRadius(12)
            .padding(10)
            
            
            NavigationLink(destination:ResetPassF(userviewmodel: UserViewModel()), isActive: $navigationLinkActive) {
                   EmptyView()
               }
               Button(action: {
                   navigationLinkActive = true
                   userviewModel.verifyOTP()

               }) {
                   Text("Verify")
                       .font(Font.custom("Inter", size: 20).weight(.bold))
                       .foregroundColor(.white)
                       .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                       .frame(width: 343, height: 51)
                       .background(Color(red: 0.06, green: 0.21, blue: 0.19))
                       .cornerRadius(12)
               }
            
           
        }
    }
}

struct OTP_Previews: PreviewProvider {
    static var previews: some View {
        OTP(userviewModel: UserViewModel())
    }
}
