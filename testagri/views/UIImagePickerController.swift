//
//  UIImagePickerController.swift
//  testagri
//
//  Created by youssef jemmali on 15/11/2023.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Binding var selectedImageUrl: URL?
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
                print("image: \(image)")
            }
            // Stockage de l'URL de l'image sélectionnée
                        if let imageUrl = info[.imageURL] as? URL {
                            parent.selectedImageUrl = imageUrl
                            print("Image path: \(imageUrl.path)")
                            
                        }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}


#Preview {
    UIImagePickerController()
}
