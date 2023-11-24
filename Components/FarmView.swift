//
//  FarmView.swift
//  AgriConnect
//
//  Created by zina ben saadallah on 15/11/2023.
//

import SwiftUI

struct FarmView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isAddFarmViewActive = false
    var farm: Farms
    
    var body: some View {
        ScrollView {
            VStack {
                Image(farm.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(farm.name)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    
                    Text("Localisation: " + farm.location.uppercased())
                        .font(.callout)
                        .foregroundColor(.primary)
                    
                    // Your additional content goes here
                }
                .padding()
                Spacer()
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
            )
            .padding(.horizontal, 20)
            .navigationBarTitle(farm.name)
        }
        
    }
    
    struct FarmView_Previews: PreviewProvider {
        
        static var previews: some View {
            let farms = Farms (name: "DakotaFarm", description: "khflhslsdhjfjkheef", image: "farm2", location: "haffouz", size: 100.235)
            return FarmView(farm: farms)
        }    }
    
}
