import SwiftUI

struct ListReclamation: View {
    @ObservedObject var viewModel = ReclamationViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.reclamations) { reclamation in
                NavigationLink(
                    destination: ReclamationDetail(reclamation: reclamation, viewModel: viewModel),
                    label: {
                        VStack(alignment: .leading) {
                            Text(reclamation.objet)
                                .font(reclamation.isRead ? .body : .body.bold())
                            Text(reclamation.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            if !reclamation.isRead {
                                Button(action: {
                                    viewModel.markAsRead(reclamation)
                                }) {
                                    Text("Marquer comme lu")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            } else {
                                Button(action: {
                                    viewModel.markAsUnread(reclamation)
                                }) {
                                    Text("Marquer comme non lu")
                                        .font(.caption)
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    })
            }
            .navigationBarTitle("Réclamations")
        }
    }
}

struct ReclamationDetail: View {
    var reclamation: ReclamationModel
    var viewModel: ReclamationViewModel
    
    @State private var messageInput: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Image de fond personnalisée
                Image("") // Remplacez "4312368" par le nom réel de votre image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(y: geometry.size.height * 0.2) // Ajuster la valeur pour déplacer l'image vers le bas
                
                VStack {
                    Spacer()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(messages, id: \.self) { message in
                                ChatBubble(message: message, isCurrentUser: false)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        TextField("Message", text: $messageInput)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .background(Color(.systemGray6))
                            .cornerRadius(20)
                        
                        Button(action: {
                            sendMessage()
                        }) {
                            Image(systemName: "paperplane.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.systemBlue))
                                .padding(12)
                                .background(Color(.systemGray6))
                                .clipShape(Circle())
                        }
                        .padding(.trailing)
                    }
                    .padding(.bottom)
                    .padding(.horizontal)
                }
                .padding()
                
            }
            .ignoresSafeArea()
            .navigationBarTitle("Détails")
            .onAppear {
                // Load previous messages from viewModel
                loadMessages()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Utiliser la navigation en mode Stack pour les appareils avec une encoche
    }
    
    private func loadMessages() {
        // Load previous messages from viewModel and populate the 'messages' array
        messages = viewModel.loadMessages(for: reclamation)
    }
    
    private func sendMessage() {
        // Send the 'messageInput' to viewModel to handle sending the message and updating the 'messages' array
        viewModel.sendMessage(messageInput, for: reclamation)
        messageInput = ""
    }
}

struct ChatBubble: View {
    var message: String
    var isCurrentUser: Bool
    
    var body: some View {
        HStack {
            if isCurrentUser {
                Spacer()
            }
            
            Text(message)
                .padding()
                .background(isCurrentUser ? Color(.systemBlue) : Color(.systemGray5))
                .foregroundColor(isCurrentUser ? .white : .black)
                .cornerRadius(16)
            
            if !isCurrentUser {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct ListReclamation_Previews: PreviewProvider {
    static var previews: some View {
        ListReclamation()
    }
}
