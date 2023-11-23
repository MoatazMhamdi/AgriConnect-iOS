//
//  DownloadableImageView.swift
//  testagri
//
//  Created by youssef jemmali on 15/11/2023.
//
import SwiftUI

struct DownloadableImageView: View {
    @StateObject private var imageLoader: ImageLoader
    var placeholder: Image

    init(url: URL, placeholder: Image = Image(systemName: "photo")) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
        self.placeholder = placeholder
    }

    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    // Configurez comme nécessaire
            } else {
                placeholder
            }
        }
        .onAppear {
            imageLoader.load()
        }
    }
}


