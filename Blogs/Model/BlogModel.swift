import Foundation

struct BlogModel: Identifiable, Codable {
    var id = UUID().uuidString
    var titre: String
    var description: String
    var lieu: String
    var image: String?
    var date: Date?
    var prix: Int
    var jAime: Int?
    var sauvegarde: Int?
    var dislike: Int?
}
var blogs: [BlogModel] = [
    BlogModel(titre: "hello", description: "hello", lieu: "paris", image: "beautiful-shot-fence-leading-house-green-grass-area", prix: 20),
    BlogModel(titre: "h", description: "g", lieu: "london", image: "vertical-shot-ripe-unripe-cherry-tomatoes-branch", prix: 20),
    BlogModel(titre: "b", description: "b", lieu: "tunis", image: "vertical-shot-ripe-unripe-cherry-tomatoes-branch", prix: 20),
    BlogModel(titre: "Read!", description: "Farming activity means the cultivation of farmland for the production of crops fruits vegetables ornamental and flowering plants and the utilization of farmland for the production of dairy livestock poultry and all other forms of agricultural products having a domestic or foreign market", lieu: "tunis", image: "vertical-shot-ripe-unripe-cherry-tomatoes-branch", prix: 0)
]
enum CodingKeys: String, CodingKey {
        case id = "_id"
        case titre, description, lieu, image
    }

