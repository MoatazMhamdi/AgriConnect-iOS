//
//  WebService.swift
//  testagri
//
//  Created by youssef jemmali on 14/11/2023.
//

import Foundation
import UIKit




extension Data {
    mutating func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
}

class WebService {

    // Méthode pour récupérer des équipements
    func fetchEquipments(completion: @escaping ([Equipment]) -> ()) {
        guard let url = URL(string: "http://localhost:9090/equipments") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching equipments: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response ")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let equipments = try JSONDecoder().decode([Equipment].self, from: data)
                DispatchQueue.main.async {
                    completion(equipments)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

    // Méthode pour ajouter un équipement
    func addEquipment(equipment: Equipment, image: URL, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:9090/equipments") else {
            print("Invalid URL")
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()

        // Append image data
        body.append(convertFileData(fieldName: "image",
                                    fileName: image.lastPathComponent,
                                    mimeType: "image/jpeg", // Adjust MIME type as needed
                                    fileUrl: image,
                                    boundary: boundary))

        // Append other fields
        body.append(convertFormField(named: "name", value: equipment.name, boundary: boundary))
        body.append(convertFormField(named: "categorie", value: equipment.categorie, boundary: boundary))
        body.append(convertFormField(named: "description", value: equipment.description, boundary: boundary))
        body.append(convertFormField(named: "etat", value: equipment.etat, boundary: boundary))

        body.append("--\(boundary)--".data(using: .utf8)!)

        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(()))
        }.resume()
    }

    func convertFormField(named name: String, value: String, boundary: String) -> Data {
        var fieldData = Data()
        fieldData.append("--\(boundary)\r\n".data(using: .utf8)!)
        fieldData.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n".data(using: .utf8)!)
        fieldData.append("\(value)\r\n".data(using: .utf8)!)
        return fieldData
    }

    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileUrl: URL, boundary: String) -> Data {
        var data = Data()

        data.append("--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        if let fileData = try? Data(contentsOf: fileUrl) {
            data.append(fileData)
        }
        data.append("\r\n".data(using: .utf8)!)

        return data
    }

    // Méthode pour mettre à jour un équipement
    func updateEquipment(equipment: Equipment, image: URL?, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let equipmentID = equipment.id else {
            print("L'ID de l'équipement est nil")
            completion(.failure(URLError(.badURL)))
            return
        }

        guard let url = URL(string: "http://localhost:9090/equipments/\(equipmentID)") else {
            print("Invalid URL")
            completion(.failure(URLError(.badURL)))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        let boundary = "Boundary-\(UUID().uuidString)"
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        var body = Data()

        if let imageUrl = image {
            // Append image data
            body.append(convertFileData(fieldName: "image",
                                        fileName: imageUrl.lastPathComponent,
                                        mimeType: "image/jpeg", // Adjust MIME type as needed
                                        fileUrl: imageUrl,
                                        boundary: boundary))
        }

        // Append other fields
        body.append(convertFormField(named: "name", value: equipment.name, boundary: boundary))
        body.append(convertFormField(named: "categorie", value: equipment.categorie, boundary: boundary))
        body.append(convertFormField(named: "description", value: equipment.description, boundary: boundary))
        body.append(convertFormField(named: "etat", value: equipment.etat, boundary: boundary))

        body.append("--\(boundary)--".data(using: .utf8)!)

        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completion(.failure(URLError(.badServerResponse)))
                return
            }
            completion(.success(()))
        }.resume()
    }


    // Nouvelle méthode pour supprimer un équipement
    func deleteEquipment(equipmentID: String, completion: @escaping () -> ()) {
        guard let url = URL(string: "http://localhost:9090/equipments/\(equipmentID)") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error deleting equipment: \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                DispatchQueue.main.async {
                    completion()
                }
            } else {
                print("Invalid response from server during deleting equipment")
            }
        }.resume()
    }

  

    func fetchMaintenanceByEquipmentID(_ equipmentID: String, completion: @escaping (Result<Maintenance, Error>) -> Void) {
        let urlString = "http://localhost:9090/maintenances/equipments/\(equipmentID)"
        print("URL: \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(.failure(error))
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Response Status code: \(httpResponse.statusCode)")
            }

            guard let data = data else {
                print("No data received")
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }

            print("Received data: \(String(data: data, encoding: .utf8) ?? "No data")")

            do {
                let maintenance = try JSONDecoder().decode(Maintenance.self, from: data)
                completion(.success(maintenance))
            } catch {
                print("JSON Decoding Error: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }



    }

    

    

    






