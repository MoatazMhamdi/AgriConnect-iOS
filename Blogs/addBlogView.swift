import SwiftUI
import UIKit

struct AddBlogView: View {
    @State private var newBlogTitle = ""
    @State private var newBlogDescription = ""
    @State private var selectedImage: UIImage?
    @State private var newBlogLocation = ""
    @State private var newBlogPrice = ""
    @State private var showImagePicker = false

    // Add a dependency on BlogService
    private let blogService = BlogService.shared
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer()

                    Text("Publier quelque chose")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 20)

                    VStack(spacing: 20) {
                        TextField("Titre", text: $newBlogTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        TextField("Description", text: $newBlogDescription)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        TextField("Localisation", text: $newBlogLocation)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()

                        TextField("Prix", text: $newBlogPrice)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .padding()
                    }
                    .padding(.horizontal)

                    Button(action: {
                        self.showImagePicker.toggle()
                    }) {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green) // Green color
                        Text("Importer une image")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(selectedImage: self.$selectedImage)
                    }

                    Button(action: {
                        if let image = selectedImage {
                            if let imageData = image.jpegData(compressionQuality: 0.8) {
                                print("Selected Image Size: \(imageData.count) bytes") // Print image size for debugging

                                blogService.addBlog(
                                    image: imageData,
                                    titre: newBlogTitle,
                                    description: newBlogDescription,
                                    lieu: newBlogLocation,
                                    prix: Int(newBlogPrice) ?? 0
                                ) { result in
                                    switch result {
                                    case .success(let message):
                                        showAlert(message: message)
                                    case .failure(let error):
                                        showAlert(message: error.localizedDescription)
                                    }
                                }
                            } else {
                                showAlert(message: "Failed to convert image to data.")
                            }
                        } else {
                            showAlert(message: "Please select an image.")
                        }
                    }) {
                        Text("Add Blog")
                    }
                    .buttonStyle(PlainButtonStyle()) // Add button style

                    Text("Publier")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 3)
                        .onTapGesture { // Add onTapGesture to trigger the action
                            if let image = selectedImage {
                                if let imageData = image.jpegData(compressionQuality: 0.8) {
                                    blogService.addBlog(
                                        image: imageData,
                                        titre: newBlogTitle,
                                        description: newBlogDescription,
                                        lieu: newBlogLocation,
                                        prix: Int(newBlogPrice) ?? 0
                                    ) { result in
                                        switch result {
                                        case .success(let message):
                                            showAlert(message: message)
                                        case .failure(let error):
                                            showAlert(message: error.localizedDescription)
                                        }
                                    }
                                } else {
                                    showAlert(message: "Failed to convert image to data.")
                                }
                            } else {
                                showAlert(message: "Please select an image.")
                            }
                        }
                }
                .padding()
                .background(
                    Image("4312368")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea() // Ignore safe area margins
                )
            }
            .navigationBarItems(
                leading:
                    Image("2")
                        .resizable()
                        .frame(width: 150, height:100)
                        .padding()
            )
        }
        .alert(isPresented: $showAlert) { // Move alert outside of ScrollView
            Alert(title: Text("Blog Added"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}

struct AddBlogView_Previews: PreviewProvider {
    static var previews: some View {
        AddBlogView()
    }
}
