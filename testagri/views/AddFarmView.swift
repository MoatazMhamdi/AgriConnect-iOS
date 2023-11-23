//
//  AddFarmView.swift
//  testagri
//
//  Created by youssef jemmali on 22/11/2023.
//

import SwiftUI

struct AddFarmView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var farmImage: UIImage?
    @State private var farmName: String = ""
    @State private var farmLocation: String = ""
    @State private var farmSize: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = farmImage {
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .padding()
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .padding()
                }
                
                Button(action: {
                    // Implement logic to open gallery and select image
                }) {
                    Image(systemName: "pencil.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Name:")
                        .font(.headline)
                    
                    TextField("Enter farm name", text: $farmName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Location:")
                        .font(.headline)
                    
                    TextField("Enter farm location", text: $farmLocation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Size:")
                        .font(.headline)
                    
                    TextField("Enter farm size", text: $farmSize)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    // Implement logic to add the farm
                }) {
                    Text("Add")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.red)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Add Farm", displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                }
            )
        }
    }
}

struct AddFarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddFarmView()
    }
}
