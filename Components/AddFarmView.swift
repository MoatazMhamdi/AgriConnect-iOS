import SwiftUI

struct AddFarmView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var farmImage: UIImage?
    @State private var farmName: String = ""
    @State private var farmDescription: String = ""
    @State private var farmSurface: String = ""
    @State private var farmUnity: String = "m2"
    
    let availableUnities = ["m2", "km2", "Hectare"]
    
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
                        .foregroundColor(.init(red: 0.06, green: 0.21, blue: 0.19))
                }
                .padding(.trailing, 20)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Farm Name:")
                        .font(.headline)
                    
                    TextField("Enter farm name", text: $farmName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Description:")
                        .font(.headline)
                    
                    TextField("Enter description", text: $farmDescription)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Surface:")
                        .font(.headline)
                    
                    TextField("Enter surface", text: $farmSurface)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Unity:")
                        .font(.headline)
                    
                    Picker("Select farm unity", selection: $farmUnity) {
                        ForEach(availableUnities, id: \.self) { unity in
                            Text(unity)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }
                .padding(.horizontal)
                
                Spacer()
                
                HStack {
                    Button(action: {
                        // Implement logic to save the changes
                    }) {
                        Text("Save Changes")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.init(red: 0.06, green: 0.21, blue: 0.19))
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
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Farm File", displayMode: .inline)
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
