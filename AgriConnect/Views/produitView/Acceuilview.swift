import SwiftUI

struct AcceuilView: View {
    
    @State private var showFarmerProfileView = false
    @State private var showProduitListView = false
    @State private var showBlogListView = false
    @State private var equipments: [Equipment] = []
    @State private var selectedEquipment: Equipment? //sélectionné
    @State private var showingEquipmentDetail = false // Ajouté pour contrôler l'affichage du détail
    @State private var isShowingSheet = false
    var webService = WebService()
    
    var body: some View {
        ScrollView {
            VStack {
                // Top bar
                HStack {
                    Button(action: {
                        showProduitListView = true
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Text("Sunset-Farm")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                    
                    Spacer()
                    
                    Button(action: {
                        showFarmerProfileView = true
                    }) {
                        Image(systemName: "sidebar.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .sheet(isPresented: $showFarmerProfileView) {
                    FarmerProfile()}
                
                HStack {
                    Text("Products")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                    Spacer()
                    
                    Button(action: {
                        showProduitListView = true
                    }) {
                        Text("Show All")
                            .foregroundColor(Color.blue)
                    }
                    .padding(.horizontal)
                    .sheet(isPresented: $showProduitListView) {
                        ProduitListView()}
                }
                .padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        // Product boxes
                        ForEach(0..<10) { index in
                            VStack {
                                Image("banana")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                
                                Text("Banana")
                                    .font(.headline)
                                    .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                                
                                Text("Quantité: 10kg")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                        }
                        
                        // Add product button
                        VStack {
                            Image(systemName: "plus.circle")
                                .font(.system(size: 80))
                                .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                            
                            Text("Add Product")
                                .font(.headline)
                                .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                
                // Equipments section
                HStack {
                    Text("Equipments")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.black)

                    Spacer()

                    NavigationLink(destination: EquipmentsView()) {
                            Text("Show All")
                                .foregroundColor(.blue)
                        }
                }
                .padding()
                
                // ScrollView horizontal pour les équipements
                ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 16) {
                                            ForEach(equipments, id: \.id) { equipment in
                                                VStack {
                                                    let fullPath = "http://localhost:9090/" + equipment.image
                                                    if let validUrl = URL(string: fullPath) {
                                                        DownloadableImageView(url: validUrl) // Assurez-vous que cette vue existe
                                                            .frame(width: 180, height: 180)
                                                    } else {
                                                        Image(systemName: "photo")
                                                            .frame(width: 50, height: 50)
                                                    }

                                                    Text(equipment.name)
                                                }
                                                .onTapGesture {
                                                    self.selectedEquipment = equipment
                                                    self.isShowingSheet = true
                                                }
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(10)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    .onAppear {
                                        fetchEquipments()
                                    }

                // Posts section
                HStack {
                    Text("Blogs")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                    Spacer()
                    
                    Button(action: {
                        showBlogListView = true
                    }) {
                        Text("Show All")
                            .foregroundColor(Color.blue)
                    }
                    .padding(.horizontal)
                    .sheet(isPresented: $showBlogListView) {
                        ContentBlogView()}
                }
                .padding(.horizontal)
                
                // Table view-like representation of posts
                ForEach(0..<5) { index in
                    VStack(alignment: .leading) {
                        Text("Author Name")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                        
                        Text("Some of the post content...")
                            .font(.body)
                            .lineLimit(2)
                            .foregroundColor(.black)
                        
                        HStack {
                            Button(action: {
                                // Handle "lire" button action
                            }) {
                                Text("Lire")
                                    .foregroundColor(Color.blue) // Custom green color
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                            
                            Text("Likes: 10")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("Comments: 5")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 8)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                }.shadow(radius: 5)
                
                Spacer()
                
            }
            .background(SwiftUI.Color.init(red: 0.90, green: 0.96, blue: 0.84))
            .sheet(isPresented: $isShowingSheet) {
                EquipmentDetailView(selectedEquipment: $selectedEquipment, isShowingSheet: $isShowingSheet, onEquipmentUpdated: fetchEquipments)
            }
        }
        
        
    }
    private func fetchEquipments() {
        webService.fetchEquipments { fetchedEquipments in
        self.equipments = fetchedEquipments
             
        }
    }
    
    
    struct AcceuilView_Previews: PreviewProvider {
        static var previews: some View {
            AcceuilView()
        }
    }
}
