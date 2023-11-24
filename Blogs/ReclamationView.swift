import SwiftUI

struct ReclamationView: View {
    @State private var selectedService: String = ""
    @State private var objet: String = ""
    @State private var description: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Service")) {
                    Picker("Sélectionnez le service", selection: $selectedService) {
                        Text("Payement").tag("Service 1")
                        Text("Commande").tag("Service 2")
                        Text("Produit").tag("Service 3")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Objet")) {
                    TextField("Objet de la réclamation", text: $objet)
                }

                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .frame(minHeight: 100)
                }

                Section {
                    Button(action: {
                        // Mettez ici le code pour traiter la réclamation
                        self.submitReclamation()
                    }) {
                        Text("Soumettre la réclamation")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .font(.headline) // Style de police
                            .shadow(color: Color.green.opacity(0.7), radius: 10, x: 0, y: 5) // Ombre
                    }.padding()
                }

            }
            .navigationTitle("Réclamation")
        }
    }

    func submitReclamation() {
        // Mettez ici le code pour soumettre la réclamation
        print("Réclamation soumise:")
        print("Service: \(selectedService)")
        print("Objet: \(objet)")
        print("Description: \(description)")
        // Ajoutez ici le code pour envoyer les données de la réclamation à votre backend ou effectuer d'autres actions nécessaires.
    }
}

struct ReclamationView_Previews: PreviewProvider {
    static var previews: some View {
        ReclamationView()
    }
}
