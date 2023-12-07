import SwiftUI

struct MessagerieView: View {
    @State private var messageText = ""
    @State private var messages: [String] = ["Welcome to Agriconnect Service"]

    var body: some View {
        VStack {
            HStack {
                Text("AgriConnect")
                    .font(.largeTitle)
                    .bold()
                Image("2")
                    .resizable()
                    .frame(width: 100, height: 50)
            }
            .padding()

            ScrollView {
                VStack {
                    ForEach(messages, id: \.self) { message in
                        MessageView(message: message)
                    }
                }
            }
            
            HStack {
                TextField("Type something", text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                    .onSubmit {
                        sendMessage(message: messageText)
                    }
                
                Button(action: {
                    sendMessage(message: messageText)
                }) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 26))
                        .padding(.horizontal, 10)
                }
                .foregroundColor(.white)  // Changer la couleur du texte en blanc
                .background(Color.green)  // Changer la couleur de l'arrière-plan en vert
                .cornerRadius(10)
                .padding(.vertical, 10)
                .padding(.trailing, 10)
            }
            .padding()
        }
        .background(
            Image("4312368")  // Le nom de votre image dans les assets
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
    
    func sendMessage(message: String) {
        messages.append("[USER] " + message)
        messageText = ""
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let botResponse = getBotResponse(message: message)
            messages.append(botResponse)
        }
    }
    
    func getBotResponse(message: String) -> String {
        // Ajoutez ici la logique pour obtenir la réponse du bot en fonction du message de l'utilisateur
        return "[BOT] Bot response for: " + message
    }
    
    struct MessageView: View {
        var message: String
        
        var body: some View {
            if message.contains("[USER]") {
                let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                HStack {
                    Spacer()
                    Text(newMessage)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                }
            } else {
                HStack {
                    Text(message)
                        .padding()
                        .background(Color.blue.opacity(0.15))
                        .cornerRadius(10)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 10)
                    Spacer()
                }
            }
        }
    }
}

struct MessagerieView_Previews: PreviewProvider {
    static var previews: some View {
        MessagerieView()
    }
}
