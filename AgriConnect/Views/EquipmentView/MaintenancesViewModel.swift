import Combine
import SwiftUI

class MaintenancesViewModel: ObservableObject {
    @Published var maintenances: [Maintenance] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchMaintenances(equipmentID: String, completion: @escaping (Result<[Maintenance], Error>) -> Void) {
        guard let url = URL(string: "http://localhost:9090/maintenances/\(equipmentID)") else {
            completion(.failure(URLError(.badURL)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(URLError(.badServerResponse)))
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(URLError(.cannotDecodeContentData)))
                }
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let maintenances = try decoder.decode([Maintenance].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(maintenances))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }

}
