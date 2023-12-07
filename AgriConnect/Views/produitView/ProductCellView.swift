//
//  FarmView.swift
//  AgriConnect
//
//  Created by zina ben saadallah on 15/11/2023.
//

import SwiftUI

struct ProductCellView: View {
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
                    Text(farm.description)
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
        
        NavigationLink(
            destination: AddFarmView(),
            isActive: $isAddFarmViewActive,
            label: {
                HStack {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 20))
                        .foregroundColor(.green)
                    
                    Button(action: {
                        // Add action for the button here
                        isAddFarmViewActive = true
                    }) {
                        Text("Add Payment Method")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                    }
                }}
        )
            .navigationBarTitle("Add Farm", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
        )}
}


struct ProductCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        let farms = Farms (name: "DakotaFarm", description: "khflhslsdhjfjkheef", image: "farm2", location: "haffouz", size: 100.235)
        return FarmView(farm: farms)
        }    }
