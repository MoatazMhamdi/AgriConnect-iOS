//
//  ApiManager.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 18/11/2023.
//

// APIManager.swift

import Foundation
import Combine
import SwiftUI
enum NetworkError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}
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
    
    func login(numTel: String, password: String, completion: @escaping (Result<UserRegistration, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:9090/users/login") else { return }
        

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "numTel": numTel,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            

            if (200..<300).contains(httpResponse.statusCode) {
                if let cookies = httpResponse.allHeaderFields["Set-Cookie"] as? String {
                    let components = cookies.components(separatedBy: ";")
                    var jwtToken: String?
                    for cookie in components {
                        if cookie.contains("jwt=") {
                            jwtToken = cookie.replacingOccurrences(of: "jwt=", with: "").trimmingCharacters(in: .whitespaces)
                        }
                    }

                    guard let token = jwtToken else {
                        completion(.failure(NetworkError.invalidResponse))
                        return
                    }

                    do {
                        let user = try JSONDecoder().decode(UserRegistration.self, from: data)
                        // Store the received JWT token in the session manager
                        SessionManager.shared.authToken = token
                        completion(.success(user))
                    } catch {
                        completion(.failure(NetworkError.decodingError))
                    }
                } else {
                    completion(.failure(NetworkError.invalidResponse))
                }
            } else {
                completion(.failure(NetworkError.requestFailed))
            }
        }

        task.resume()
    }
    
}
