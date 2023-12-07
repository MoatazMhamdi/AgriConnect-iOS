import SwiftUI

struct MaintenancesView: View {
    var webService = WebService()
    @State private var maintenances: [Maintenance] = [] // Now an array
    var equipmentID: String  // Add this line

    var body: some View {
        VStack {
            if maintenances.isEmpty {
                Text("Loading...")
            } else {
                List(maintenances, id: \.id) { maintenance in
                    VStack(alignment: .leading) {
                        Text("Maintenance Date: \(maintenance.dateMaintenance)")
                        Text("Cost: \(maintenance.typeMaintenance)")
                        Text("Description: \(maintenance.description)")
                        Text("Cost: \(maintenance.costMaintenance)")
                    }
                }
            }
        }
        .onAppear {
            webService.fetchMaintenanceByEquipmentID(equipmentID) { result in
                switch result {
                case .success(let fetchedMaintenances):
                    self.maintenances = fetchedMaintenances // Assigning to an array
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}

