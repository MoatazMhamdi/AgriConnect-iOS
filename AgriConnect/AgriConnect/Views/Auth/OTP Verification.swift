import SwiftUI

struct OTP_Verification: View {
    @State private var otp = ""
    
    var body: some View {
        VStack {
            Image("otfverif")
                .resizable()
                .scaledToFit()
                .padding(-60)
            
            Text("OTP Verification")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Enter your verification code.")
            
            HStack(spacing: 16) {
                ForEach(0..<4) { index in
                    let digit = otp.count > index ? String(otp[otp.index(otp.startIndex, offsetBy: index)]) : ""
                    
                    TextField("", text: Binding(
                        get: { digit },
                        set: { newValue in
                            if newValue.count > 1 {
                                let endIndex = otp.index(otp.startIndex, offsetBy: index)
                                otp.replaceSubrange(otp.startIndex...endIndex, with: newValue)
                            } else if newValue.isEmpty {
                                let endIndex = otp.index(otp.startIndex, offsetBy: index)
                                otp.remove(at: endIndex)
                            } else if otp.count > index {
                                let index = otp.index(otp.startIndex, offsetBy: index)
                                otp.replaceSubrange(index...index, with: newValue)
                            } else {
                                otp.append(newValue)
                            }
                        }
                    ))
                    .frame(width: 50, height: 50)
                    .font(.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .background(Color.white)
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.green, lineWidth: 1)
                    )
                }
            }
            .padding(10)
            
            Button(action: {
                // Perform verification action
            }) {
                Text("Verify")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
    }
}

struct OTP_Verification_Previews: PreviewProvider {
    static var previews: some View {
        OTP_Verification()
    }
}
