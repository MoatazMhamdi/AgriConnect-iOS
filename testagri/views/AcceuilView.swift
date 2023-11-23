import SwiftUI

struct AcceuilView: View {
    @State private var equipments: [Equipment] = []
    @State private var selectedEquipment: Equipment? //sélectionné
    @State private var showingEquipmentDetail = false // Ajouté pour contrôler l'affichage du détail
    @State private var isShowingSheet = false
    var webService = WebService()

    var body: some View {
        ScrollView {
            VStack {
                // Top bar
                HStack {
                    Button(action: {
                        // Action pour le bouton de retour
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }

                    Spacer()

                    Text("Sunset-Farm")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    Button(action: {
                        // Action pour le bouton de barre latérale
                    }) {
                        Image(systemName: "sidebar.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()

                // Section des produits
                HStack {
                    Text("Products")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Spacer()

                    Button(action: {
                        // Action pour "Show All"
                    }) {
                        Text("Show All")
                            .foregroundColor(.blue)
                    }
                }
                .padding()

                // ScrollView horizontal pour les produits
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        // Boîtes de produit
                        ForEach(0..<10) { index in
                            VStack {
                                Image("banana") // Remplacer par votre image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)

                                Text("Banana")
                                    .font(.headline)
                                    .foregroundColor(.black)

                                Text("Quantité: 10kg")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                }

                // Section des équipements
                HStack {
                    Text("Equipments")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Spacer()

                    NavigationLink(destination: EquipmentsView()) {
                            Text("Show All")
                                .foregroundColor(.blue)
                        }
                }
                .padding()
                
                // ScrollView horizontal pour les équipements
                ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(equipments, id: \.id) { equipment in
                                                VStack {
                                                    let fullPath = "http://localhost:9090/" + equipment.image
                                                    if let validUrl = URL(string: fullPath) {
                                                        DownloadableImageView(url: validUrl) // Assurez-vous que cette vue existe
                                                            .frame(width: 180, height: 180)
                                                    } else {
                                                        Image(systemName: "photo")
                                                            .frame(width: 50, height: 50)
                                                    }

                                                    Text(equipment.name)
                                                }
                                                .onTapGesture {
                                                    self.selectedEquipment = equipment
                                                    self.isShowingSheet = true
                                                }
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(10)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    .onAppear {
                                        fetchEquipments()
                                    }

                // Section des publications
                // ... Ajoutez ici votre code pour les publications ...
                

                Spacer()
            }
        }
        .background(Color.green.opacity(0.1))
        .sheet(isPresented: $isShowingSheet) {
            EquipmentDetailView(selectedEquipment: $selectedEquipment, isShowingSheet: $isShowingSheet, onEquipmentUpdated: fetchEquipments)
        }

        
        
    }

    private func fetchEquipments() {
        webService.fetchEquipments { fetchedEquipments in
        self.equipments = fetchedEquipments
             
        }
    }

}

struct AcceuilView_Previews: PreviewProvider {
    static var previews: some View {
        AcceuilView()
    }
}
