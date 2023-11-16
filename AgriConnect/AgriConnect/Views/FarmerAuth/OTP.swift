import SwiftUI

struct OTP: View {
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
            .padding(30)
            
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
