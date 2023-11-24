import SwiftUI

struct ContentView: View {
    @State private var isNavigationBarHidden: Bool = true
    @State private var showSideMenu = false
    @State private var showAddBlogView = false
    @State private var selectedFilter = "Recommended"
    let filters = ["Recommended", "Popular", "offre"]

    @State private var showCommentButton = false  // Ajout de la variable d'état pour afficher ou masquer le bouton de commentaire

    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter", selection: $selectedFilter) {
                    ForEach(filters, id: \.self) { filter in
                        Text(filter)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                ScrollView {
                    ForEach(blogs) { blog in
                        NavigationLink(destination: BlogView(blog: blog)) {
                            BlogsView(blog: blog)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationBarTitle("Blogs")
            .navigationBarItems(
                leading: HStack {
                    Image("2")
                        .resizable()
                        .frame(width: 100, height: 50)
                },
                trailing: HStack {
                    Button(action: {
                        showAddBlogView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                            .padding(8)
                            .background(Color.clear)
                            .clipShape(Circle())
                            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 3)
                    }
                    .sheet(isPresented: $showAddBlogView) {
                        AddBlogView()
                    }

                    Button(action: {
                        showSideMenu.toggle()
                    }) {
                        Image("menu-bar")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                    }
                }
            )
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = false
            }
            .onDisappear {
                self.isNavigationBarHidden = true
            }
            .overlay(
                SideMenu(showMenu: $showSideMenu) {
                    SideViewContents(presentSideMenu: $showSideMenu)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                }
                .frame(width: UIScreen.main.bounds.width)
                .offset(x: showSideMenu ? 0 : -UIScreen.main.bounds.width)
                .animation(.easeInOut, value: showSideMenu)
            )
            .overlay(
                VStack {
                    Spacer()
                    if showCommentButton {  // Affichage conditionnel du bouton de commentaire
                        Button(action: {
                            // Code à exécuter lors du clic sur le bouton de commentaire
                            // Par exemple, naviguer vers CommentListView
                        }) {
                            Image(systemName: "bubble.left")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.primary)
                                .padding(8)
                                .background(Color.clear)
                                .clipShape(Circle())
                                .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 3)
                        }
                    }
                }
                .padding()
            )
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BlogsView: View {
    var blog: BlogModel
    @State private var isLiked = false

    init(blog: BlogModel) {
        self.blog = blog
        _isLiked = State(initialValue: loadLikeState())
    }

    var body: some View {
        VStack(alignment: .leading) {
            Image(blog.image!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(blog.titre)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(blog.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                Text("Localisation: \(blog.lieu.uppercased())")
                    .font(.caption)
                    .foregroundColor(.primary)
            }
            .padding()

            HStack(spacing: 20) {
                Button(action: {
                    downloadBlog()
                }) {
                    Image(systemName: "square.and.arrow.down")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }

                Spacer()

                Button(action: {
                    isLiked.toggle()
                    saveLikeState()
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }

                Button(action: {
                    CView()
                }) {
                    Image(systemName: "bubble.left")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.primary)
                }
            }
            .padding()
        }
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.secondarySystemGroupedBackground))
        )
        .padding(.horizontal)
        .padding(.bottom, 10)
        .onDisappear {
            saveLikeState()
        }
    }

    private func saveLikeState() {
        UserDefaults.standard.set(isLiked, forKey: "isLiked-\(blog.id)")
    }

    private func loadLikeState() -> Bool {
        return UserDefaults.standard.bool(forKey: "isLiked-\(blog.id)")
    }

    private func downloadBlog() {
        // Implement download logic
    }

    private func addComment() {
        // Implement comment logic
    }
}
struct BlogView: View {
    var blog: BlogModel
    @State private var commentaire: String = ""
    @State private var isLiked = false
    @State private var isDisliked = false
    
    var body: some View {
        ScrollView {
            VStack {
                Image(blog.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(blog.description)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text("Localisation: " + blog.lieu.uppercased())
                        .font(.callout)
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            // Action pour gérer l'enregistrement
                            // Mettez ici le code pour gérer l'enregistrement
                        }) {
                            Image(systemName: "square.and.arrow.down")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                                .imageScale(.large)
                                .symbolRenderingMode(.multicolor)
                        }
                        
                        Button(action: {
                            // Action pour gérer le bouton "like"
                            isLiked.toggle()
                            if isLiked {
                                // Code à exécuter si l'utilisateur aime le blog
                                isDisliked = false // Pour désactiver le bouton "dislike" s'il est activé
                            } else {
                                // Code pour annuler l'action "like"
                            }
                        }) {
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(isLiked ? Color.green : Color.black)
                                .imageScale(.large)
                        }
                        
                        Button(action: {
                            // Action pour gérer le bouton "dislike"
                            isDisliked.toggle()
                            if isDisliked {
                                // Code à exécuter si l'utilisateur n'aime pas le blog
                                isLiked = false // Pour désactiver le bouton "like" s'il est activé
                            } else {
                                // Code pour annuler l'action "dislike"
                            }
                        }) {
                            Image(systemName: isDisliked ? "hand.thumbsdown.fill" : "hand.thumbsdown")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(isDisliked ? Color.black : Color.black)
                                .imageScale(.large)
                        }
                    }
                    .padding()
                }
                .padding()
                Spacer()
            }
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
        )
        .padding(.horizontal, 20)
        .navigationBarTitle(blog.titre)
    }
    
        }
