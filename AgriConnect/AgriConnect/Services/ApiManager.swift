//
//  ApiManager.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 18/11/2023.
//

// APIManager.swift

import Foundation

class APIManager {
    func registerUser(user: UserRegistration) {
        guard let url = URL(string: "http://localhost:9090/users/FarmerSignup") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error making POST request: \(error)")
                    return
                }
                
                // Handle the response from the backend if needed
            }.resume()
        } catch {
            print("Error encoding user registration data: \(error)")
        }
    }
    func RegisterClient(user: UserRegistration) {
        guard let url = URL(string: "http://localhost:9090/users/ClientSignUp") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error making POST request: \(error)")
                    return
                }
                
                // Handle the response from the backend if needed
            }.resume()
        } catch {
            print("Error encoding user registration data: \(error)")
        }
    }
}
