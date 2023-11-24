import SwiftUI

struct ProduitListView: View {
    @State private var showAddProduit = false

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("List of Produits")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                    .foregroundColor(Color(red: 0.06, green: 0.21, blue: 0.19))

                ScrollView {
                    VStack(spacing: 10) {
                        ForEach(ProduitList) { produit in
                            NavigationLink(destination: AddProductView()) {
                                ZStack(alignment: .bottom) {
                                    Image(produit.image)
                                        .resizable()
                                        .cornerRadius(20)
                                        .frame(width: 350, height: 150)
                                        .scaledToFit()

                                    VStack(alignment: .leading, spacing: 5) {
                                        Spacer()
                                        Rectangle()
                                            .foregroundColor(.clear)
                                            .background(
                                                LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
                                            )
                                            .frame(height: 80)
                                            .cornerRadius(10)
                                            .overlay(
                                                HStack {
                                                    VStack(alignment: .leading, spacing: 2) {
                                                        Text(produit.name)
                                                            .font(.headline)
                                                            .foregroundColor(.white)
                                                        Text("Stock: \(produit.quantiteEnStock)")
                                                            .font(.subheadline)
                                                            .foregroundColor(.white)
                                                    }
                                                    .padding(.leading, 10)
                                                    Spacer()
                                                }
                                                .padding(.trailing, 10)
                                            )
                                    }
                                    .padding([.leading, .bottom, .trailing])
                                }
                                .frame(width: 350)
                                .shadow(radius: 3)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    showAddProduit.toggle()
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                }
            )
            .sheet(isPresented: $showAddProduit) {
                AddProductView()
            }
        }
    }
}

struct ProduitListView_Previews: PreviewProvider {
    static var previews: some View {
        ProduitListView()
    }
}
