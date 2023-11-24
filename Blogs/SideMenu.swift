import SwiftUI

// Vue principale du menu latéral
struct SideMenu<Content: View>: View {
    @Binding var showMenu: Bool
    var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // En-tête du menu avec l'image et les informations de l'utilisateur
            UserHeaderView()
            
            // Contenu du menu (fourni par l'utilisateur)
            content()
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        // ZStack pour superposer l'arrière-plan lorsque le menu est affiché
        ZStack(alignment: .leading) {
            if showMenu {
                // Arrière-plan avec image (à remplacer par votre propre image)
                BackgroundImageView()
                    .onTapGesture {
                        showMenu.toggle()
                    }
                
                // Contenu du menu (fourni par l'utilisateur)
                content()
                    .overlay(content(), alignment: .topLeading)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .ignoresSafeArea()
        .animation(.easeInOut, value: showMenu)
    }
}

// En-tête du menu avec l'image et les informations de l'utilisateur
struct UserHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Image("4312368") // Remplacez "placeholder" par le nom de votre image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 65)
                .clipShape(Circle())
            
            Text("iJustine")
                .font(.title2.bold())
            Text("@iJustine")
                .font(.callout)
        }
        .padding(.horizontal)
        .padding(.leading)
    }
}

// Arrière-plan du menu avec image d'arrière-plan
struct BackgroundImageView: View {
    var body: some View {
        Image("4312368") // Remplacez par votre propre image d'arrière-plan
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

// Structure de prévisualisation pour le menu
struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extension de la vue pour obtenir la taille de l'écran
extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
}

// Exemple d'utilisation de SideMenu
