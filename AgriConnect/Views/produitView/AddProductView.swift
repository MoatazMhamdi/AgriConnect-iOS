import SwiftUI

struct AddProductView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var productImage: UIImage?
    @State private var productName: String = ""
    @State private var productQuantity: String = ""
    @State private var productPrice: String = ""
    @State private var productUnity: String = "g"
    
    let availableUnities = ["g", "kg", "Tn"]
    
    var body: some View {
        NavigationView {
            VStack {
                if let image = productImage {
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
                    Text("Product Name:")
                        .font(.headline)
                    
                    TextField("Enter product name", text: $productName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Quantity :")
                        .font(.headline)
                    
                    TextField("Enter product quantity", text: $productQuantity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Price in DT per Kg:")
                        .font(.headline)
                    
                    TextField("Enter product price", text: $productPrice)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Text("Unity:")
                        .font(.headline)
                    
                    Picker("Select product unity", selection: $productUnity) {
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
                        print("heloooooooooooo")
                        let farmManager = FarmController()
                        
                        farmManager.createFarm(name: "Ma Belle Ferme", owner: "654bc735c66675811e555552", location: "Some Location", size: "182")                      }) {
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
                        // Implement logic to delete the product
                    }) {
                        Text("Delete")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.red)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }}
            .navigationBarTitle("Product File", displayMode: .inline)
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

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView()
    }
}
