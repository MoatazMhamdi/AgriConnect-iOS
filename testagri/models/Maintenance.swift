import Foundation

struct Maintenance: Codable {
    let id: String
    let equipmentID: String
    let dateMaintenance: String
    let typeMaintenance: String
    let description: String
    let costMaintenance: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case equipmentID = "ID_Equipement"
        case dateMaintenance = "Date_Maintenance"
        case typeMaintenance = "Type_Maintenance"
        case description = "Description"
        case costMaintenance = "Coût_Maintenance"
    }
}
