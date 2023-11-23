import SwiftUI

struct EquipmentsView: View {
    @State private var equipments: [Equipment] = []
    @State private var filteredEquipments: [Equipment] = []
    var webService = WebService()
    @State private var isShowingSheet = false
    @State private var selectedEquipment: Equipment?
    @State private var showDeleteConfirmAlert = false
    @State private var equipmentToDelete: Equipment?

    @State private var selectedCategory: String = "Toutes"
    let categories = ["Toutes", "Loaders", "Tractors"]

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                CustomNavigationBar(title: "Equipements")

                // Barre de catégories
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            CategoryButton(category: category, selectedCategory: $selectedCategory)
                                .onChange(of: selectedCategory) { _ in
                                    filterEquipments(by: selectedCategory)
                                }
                        }
                    }
                    .padding()
                }


                List {
                    ForEach(filteredEquipments, id: \.id) { equipment in
                        HStack {
                            let fullPath = "http://localhost:9090/" + equipment.image
                            if let validUrl = URL(string: fullPath) {
                                DownloadableImageView(url: validUrl)
                                    .frame(width: 180, height: 180)
                            } else {
                                Image(systemName: "photo")
                                    .frame(width: 50, height: 50)
                            }
                            
                            Text(equipment.name)
                            Spacer()
                            Button(action: {
                                self.selectedEquipment = equipment
                                self.isShowingSheet = true
                            }) {
                                Image(systemName: "pencil")
                                    .foregroundColor(Color.green)
                                    .padding(10)
                            }
                            .frame(width: 44, height: 44)
                        }
                    }
                    .onDelete(perform: deleteEquipment)
                }
                .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                .onAppear {
                    fetchEquipments()
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.selectedEquipment = nil
                self.isShowingSheet = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $isShowingSheet) {
                EquipmentDetailView(selectedEquipment: $selectedEquipment, isShowingSheet: $isShowingSheet, onEquipmentUpdated: fetchEquipments)
            }
        }
    }

    private func fetchEquipments() {
        webService.fetchEquipments { fetchedEquipments in
            self.equipments = fetchedEquipments
            self.filteredEquipments = fetchedEquipments // Initialise filteredEquipments
        }
    }

    private func filterEquipments(by category: String) {
        if category == "Toutes" {
            filteredEquipments = equipments
        } else if category == "Loaders" {
            filteredEquipments = equipments.filter { $0.categorie == "Loaders" }
        } else if category == "Tractors" {
            filteredEquipments = equipments.filter { $0.categorie == "Tractors" }
        }
        // Add more else-if blocks here for additional categories
    }

    

    private func deleteEquipment(at offsets: IndexSet) {
        offsets.forEach { index in
            let equipmentToDelete = equipments[index]
            if let equipmentID = equipmentToDelete.id {
                webService.deleteEquipment(equipmentID: equipmentID) {
                    fetchEquipments()
                }
            } else {
                print("Erreur : ID de l'équipement est nil")
            }
        }
    }
}



struct EquipmentsView_Previews: PreviewProvider {
    static var previews: some View {
        EquipmentsView()
    }
}
