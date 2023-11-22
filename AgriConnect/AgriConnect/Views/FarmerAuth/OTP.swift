import SwiftUI

struct OTP: View {
    @State private var numTel = ""

    @State private var otp = ""
    @State private var navigationLinkActive: Bool = false

    var body: some View {
        VStack {
            Image("otfverif")
                .resizable()
                .scaledToFit()
                .padding(-60)
            
            Text("Validation OTP")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Enter your verification code.")
            
            ZStack(alignment: .leading) {
                if numTel.isEmpty {
                    Text("Write Code Here")
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32))
                }
                HStack {
                    Image(systemName: "")
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
            
            
            NavigationLink(destination: ResetPassF(), isActive: $navigationLinkActive) {
                   EmptyView()
               }
               Button(action: {
                   navigationLinkActive = true
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
        OTP()
    }
}
