import SwiftUI

struct MaintenancesView: View {
    var webService = WebService()
    @State private var maintenance: Maintenance?

    var body: some View {
        VStack {
            if let maintenance = maintenance {
                Text("Maintenance ID: \(maintenance.dateMaintenance)")
                Text("Maintenance ID: \(maintenance.description)")
               
                // Add more text views for other properties
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            webService.fetchMaintenanceByID("655e4a0c2ab6aadf65369455") { result in
                switch result {
                case .success(let fetchedMaintenance):
                    self.maintenance = fetchedMaintenance
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
struct MaintenancesView_Previews: PreviewProvider {
    static var previews: some View {
        MaintenancesView()
    }
}
