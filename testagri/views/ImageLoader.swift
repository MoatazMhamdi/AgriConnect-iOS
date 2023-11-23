//
//  ImageLoader.swift
//  testagri
//
//  Created by youssef jemmali on 15/11/2023.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL
    

    init(url: URL) {
        self.url = url
    }

    func load() {
        print("Début du chargement de l'image depuis l'URL: \(url)")
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erreur lors du téléchargement de l'image: \(error)")
                return
            }

            if let data = data, let image = UIImage(data: data) {
                print("Image téléchargée avec succès")
                DispatchQueue.main.async {
                    self.image = image
                }
            } else {
                print("Aucune donnée d'image ou donnée corrompue")
            }
        }.resume()
    }
}
