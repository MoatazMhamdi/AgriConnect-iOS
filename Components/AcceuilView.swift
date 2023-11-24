import SwiftUI

struct AcceuilView: View {
    
    @State private var showProduitListView = false
    
    var body: some View {
        ScrollView {
            VStack {
                // Top bar
                HStack {
                    Button(action: {
                        // Handle back button action
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
                        // Handle side bar button actiona
                    }) {
                        Image(systemName: "sidebar.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
                
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
                        .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle "show all" button action
                    }) {
                        Text("Show All")
                            .foregroundColor(Color.blue) // Custom green color
                    }
                    .padding(.horizontal)
                    
                }
                .padding(.horizontal)
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        // Equipment boxes
                        ForEach(0..<10) { index in
                            VStack {
                                // Equipment box content
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal)
                    .shadow(radius: 5)
                }
                
                // Posts section
                HStack {
                    Text("Posts")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(SwiftUI.Color.init(red: 0.06, green: 0.21, blue: 0.19))
                    
                    Spacer()
                    
                    Button(action: {
                        // Handle "show all" button action
                    }) {
                        Text("Show All")
                            .foregroundColor(Color.blue) // Custom green color
                    }
                    .padding(.horizontal)
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
        }
        
    }
    
    
    struct AcceuilView_Previews: PreviewProvider {
        static var previews: some View {
            AcceuilView()
        }
    }
}
