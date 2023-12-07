import SwiftUI

struct Farm: View {
    @State private var showAddFarm = false
    var farm: Farms
    
    @State private var surface: String = ""
    @State private var unity: String = "mètre Carré"
    let availableUnities = ["mètre Carré", "kilomètre Carré", "hectare"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    Text("List of Farms")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)
                        .foregroundColor(Color(red: 0.06, green: 0.21, blue: 0.19))
                    ForEach(0..<6) { index in
                        NavigationLink(destination: AcceuilView()) {
                            ZStack(alignment: .bottom) {
                                Image(farm.image)
                                    .resizable()
                                    .cornerRadius(20)
                                    .frame(width: 350)
                                    .scaledToFit()
                                
                                VStack(alignment: .leading) {
                                    Text(farm.name)
                                        .bold()
                                        .foregroundColor(.white)
                                    
                                    Text("\(farm.description)$")
                                        .font(.caption)
                                        .foregroundColor(.white)
                                }
                                .padding()
                                .frame(width: 350, alignment: .leading)
                                .background(LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .black]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(20)
                            }
                            .frame(width: 350, height: 150)
                            .shadow(radius: 3)
                        }
                    }
                }
                .padding()
            }.navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showAddFarm.toggle()
                                    }) {
                                        Image(systemName: "plus")
                                            .imageScale(.large)
                                    }
                                )
            .sheet(isPresented: $showAddFarm) {
                                    AddFarmView()
                                }
            
            
        }
    }
    
    struct Farm_Previews: PreviewProvider {
        static var previews: some View {
            Farm(farm: farmList[0])
        }
    }
}
