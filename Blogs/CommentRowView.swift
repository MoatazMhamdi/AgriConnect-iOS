import SwiftUI

struct CommentListView: View {
    @State private var newComment: String = ""
    var blog: BlogModel
    @Binding var comments: [CommentModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Image(blog.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    ForEach(comments) { comment in
                        CommentRowView(comment: comment)
                            .padding(.bottom, 8)
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
            
            HStack {
                TextField("Add a comment...", text: $newComment)
                    .padding(8)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                Button(action: {
                    let comment = CommentModel(username: "Utilisateur", commentText: newComment)
                                      comments.append(comment)
                                      // Réinitialise le champ de commentaire après l'envoi
                                      newComment = ""
                                  }) {
                                      Text("Envoyer")
                                          .foregroundColor(.blue)
                                  }
                                  .padding()
                              }
                              .padding(.horizontal)
                          }
                          .navigationBarTitle("Comments")
                      }
                  }



struct CommentRowView: View {
    var comment: CommentModel
    @State private var isLiked = false

    var body: some View {
        HStack(spacing: 8) {
            Text("\(comment.username): \(comment.commentText)")
                .font(.body)
                .foregroundColor(.primary)

            Spacer()

            Button(action: {
                isLiked.toggle()
            }) {
                Image(systemName: "heart.fill")
                    .foregroundColor(comment.isLiked ? .red : .gray)
            }
            .buttonStyle(BorderlessButtonStyle()) // Remove the default button style
        }
        .padding([.horizontal, .vertical], 12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.secondarySystemGroupedBackground))        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.5)
        )
        .padding(.horizontal)
    }
}
    // ... (UserProfileView et autres restent inchangés)
    
    struct UserProfileView: View {
        var username: String
        
        var body: some View {
            // Affiche une vue texte avec le profil de l'utilisateur
            Text("Profile of \(username)")
            // Définit le titre de la barre de navigation avec le nom d'utilisateur
                .navigationBarTitle(username)
        }
    }
    

struct CView: View {
    @State private var comments: [CommentModel] = [
        CommentModel(username: "john_doe", commentText: "Awesome photo!"),
        CommentModel(username: "jane_smith", commentText: "Great shot!"),
        CommentModel(username: "sam_jones", commentText: "Love it!"),
    ]

    var blog: BlogModel = BlogModel(titre: "hello", description: "hello", lieu: "paris", image: "beautiful-shot-fence-leading-house-green-grass-area", prix: 20)

    var body: some View {
        NavigationView {
            CommentListView(blog: blog, comments: $comments)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct CView_Previews: PreviewProvider {
    static var previews: some View {
        CView()
    }
}
    
    
