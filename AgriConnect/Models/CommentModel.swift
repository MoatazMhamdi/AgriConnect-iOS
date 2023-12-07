import Foundation

struct CommentModel: Identifiable {
    var id = UUID()
    var username: String
    var commentText: String
    var isLiked: Bool = false

    // Vous pouvez ajouter d'autres propriétés nécessaires, comme la date du commentaire, etc.

    var isCurrentUserComment: Bool {
        // Implémentez la logique pour vérifier si le commentaire appartient à l'utilisateur actuel
        // Retournez true si le commentaire appartient à l'utilisateur actuel, sinon false
        // Cela pourrait dépendre de la gestion de l'authentification dans votre application
        return false
    }

    // Ajoutez d'autres propriétés et méthodes nécessaires en fonction de vos besoins.
}
