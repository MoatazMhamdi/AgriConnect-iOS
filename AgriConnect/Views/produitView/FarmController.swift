//
//  FarmController.swift
//  AgriConnect
//
//  Created by ZinaBenSaadallah on 23/11/2023.
//

import Foundation

struct Farmm: Codable {
    var name: String
    var owner: String
    var location: String
    var size: String
}
class FarmController {
    func createFarm(name: String, owner: String, location: String, size: String) {
        let farm = Farmm(name: name, owner: owner, location: location, size: size)
        
        // Specify your backend API URL
        guard let url = URL(string: "http://192.168.132.250:3000/api/farm/farm/") else {
            print("Invalid URL")
            return
        }

        // Prepare the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        // Convert the farm object to JSON data
        do {
            let jsonData = try JSONEncoder().encode(farm)
            request.httpBody = jsonData
        } catch {
            print("Error encoding farm data: \(error)")
            return
        }

        // Make the request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error making HTTP request: \(error)")
                return
            }

            // Process the response
            if let data = data {
                do {
                    // Parse the response data if needed
                    let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Response from server: \(jsonResponse)")
                } catch {
                    print("Error parsing response data: \(error)")
                }
            }
        }

        task.resume()
    }
}
