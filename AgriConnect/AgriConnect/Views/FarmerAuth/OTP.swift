import SwiftUI

struct OTP: View {


    @State private var navigationLinkActive: Bool = false
    @ObservedObject var userviewModel: UserViewModel


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
            
            VStack {
                        TextField("Phone Number", text: $userviewModel.numTel)
                            .padding()
                        TextField("OTP", text: $userviewModel.otp)
                            .padding()
                        Button(action: {
                            userviewModel.verifyOTP()
                        }) {
                            Text("Verify OTP")
                        }
                        Text(userviewModel.verificationResult)
                            .padding()
                    }
           
        }
    }
}

struct OTP_Previews: PreviewProvider {
    static var previews: some View {
        OTP(userviewModel: UserViewModel())
    }
}
