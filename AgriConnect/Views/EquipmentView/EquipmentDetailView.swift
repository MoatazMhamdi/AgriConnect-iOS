//
//  EquipmentDetailView.swift
//  testagri
//
//  Created by youssef jemmali on 14/11/2023.
//

import SwiftUI

struct EquipmentDetailView: View {
    @Binding var selectedEquipment: Equipment?
    @Binding var isShowingSheet: Bool

    @State private var name: String = ""
    @State private var image: String = ""
    @State private var categorie: String = ""
    @State private var description: String = ""
    @State private var etat: String = ""
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var selectedImageUrl: URL?
    @State private var showOtherView = false
    @State private var showError = false

    @Environment(\.presentationMode) var presentationMode
    var webService = WebService()
    var onEquipmentUpdated: () -> Void

   

    var body: some View {
        Form {
            TextField("Name", text: $name)
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
            if let equipment = selectedEquipment, let validUrl = URL(string: "http://localhost:9090/" + equipment.image) {
                               DownloadableImageView(url: validUrl)
                                   .frame(width: 180, height: 180)
                                   .padding(.vertical)
                           }
            

            Button("Upload Image") {
                showingImagePicker = true
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $selectedImage, selectedImageUrl: $selectedImageUrl)
            }

            TextField("Categorie", text: $categorie)
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2)) // Dark gray color
            TextField("Description", text: $description)
            TextField("Etat", text: $etat)

            Button("Save") {
                            if let selectedImageUrl = selectedImageUrl {
                                // New image selected, handle both new equipment addition and updating existing equipment
                                let equipmentToSave = Equipment(id: selectedEquipment?.id,
                                                                name: name,
                                                                image: "",
                                                                categorie: categorie,
                                                                description: description,
                                                                etat: etat)

                                if selectedEquipment != nil {
                                    // Updating existing equipment with a new image
                                    webService.updateEquipment(equipment: equipmentToSave, image: selectedImageUrl) { result in
                                        handleSaveResult(result: result)
                                    }
                                } else {
                                    // Adding new equipment with an image
                                    webService.addEquipment(equipment: equipmentToSave, image: selectedImageUrl) { result in
                                        handleSaveResult(result: result)
                                    }
                                }
                            } else {
                                // No new image, just updating existing fields
                                saveEquipment(withImageUrl: selectedEquipment?.image ?? "")
                            }
                        }
            Button("Go to Maintenances") {
                           showOtherView = selectedEquipment?.id != nil
                           showError = selectedEquipment?.id == nil
                       }
                       .sheet(isPresented: $showOtherView) {
                           if let equipmentID = selectedEquipment?.id {
                               MaintenancesView(equipmentID: equipmentID)
                           }
                       }
                       .alert(isPresented: $showError) {
                           Alert(title: Text("Error"), message: Text("No equipment selected or missing ID"), dismissButton: .default(Text("OK")))
                       }



       }
        .onAppear {
            if let existingEquipment = selectedEquipment {
                name = existingEquipment.name
                categorie = existingEquipment.categorie
                description = existingEquipment.description
                etat = existingEquipment.etat
                image = existingEquipment.image
            }
        }
    }
    

    private func saveEquipment(withImageUrl imageUrl: String) {
            let equipmentToSave = Equipment(id: selectedEquipment?.id,
                                            name: name,
                                            image: imageUrl,
                                            categorie: categorie,
                                            description: description,
                                            etat: etat)

            if selectedEquipment != nil {
                // Update existing equipment without changing the image
                webService.updateEquipment(equipment: equipmentToSave, image: nil) { result in
                    handleSaveResult(result: result)
                }
            } else {
                // Handle logic if new equipment is being added without an image
                // You might want to handle this case differently
            }
        }

        private func handleSaveResult(result: Result<Void, Error>) {
            switch result {
            case .success:
                print("Operation réussie")
                self.onEquipmentUpdated()
                DispatchQueue.main.async {
                    self.isShowingSheet = false
                }
            case .failure(let error):
                print("Erreur lors de l'opération: \(error)")
                // Optionally, handle the error in your UI
            }
        }
    }

