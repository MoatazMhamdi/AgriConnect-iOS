import SwiftUI

struct ReclamationModel: Identifiable {
    var id = UUID()
    var service: String
    var objet: String
    var description: String
    var isRead: Bool
}

class ReclamationViewModel: ObservableObject {
    @Published var reclamations: [ReclamationModel]

    init() {
        self.reclamations = [
            ReclamationModel(service: "Service 1", objet: "Objet 1", description: "Description 1", isRead: false),
            ReclamationModel(service: "Service 2", objet: "Objet 2", description: "Description 2", isRead: true),
            ReclamationModel(service: "Service 3", objet: "Objet 3", description: "Description 3", isRead: false)
        ]
    }

    func markAsRead(_ reclamation: ReclamationModel) {
        if let index = reclamations.firstIndex(where: { $0.id == reclamation.id }) {
            reclamations[index].isRead = true
        }
    }

    func markAsUnread(_ reclamation: ReclamationModel) {
        if let index = reclamations.firstIndex(where: { $0.id == reclamation.id }) {
            reclamations[index].isRead = false
        }
    }

    func submitReclamation(_ reclamation: ReclamationModel) {
        // Mettez ici le code pour soumettre la réclamation
        print("Réclamation soumise:")
        print("Service: \(reclamation.service)")
        print("Objet: \(reclamation.objet)")
        print("Description: \(reclamation.description)")
        // Ajoutez ici le code pour envoyer les données de la réclamation à votre backend ou effectuer d'autres actions nécessaires.
    }
    
    
       func loadMessages(for reclamation: ReclamationModel) -> [String] {
           // Load previous messages for the reclamation
           // Replace with your implementation
           return []
       }
       
       func sendMessage(_ message: String, for reclamation: ReclamationModel) {
           // Send the message for the reclamation
           // Replace with your implementation
       }
   }
