//
//  SigInViewModel.swift
//  AgriConnect
//
//  Created by MoatazMhamdi on 19/11/2023.
//

import Foundation
import SwiftUI
import Combine
class SigInViewModel: ObservableObject {
    @Published var isLogged = false
    @Published var nextScreen: String? = nil


  private let apiManager = APIManager()
    func login(numTel: String, password: String, completion: @escaping (Result<UserRegistration, Error>) -> Void) {
            apiManager.login(numTel: numTel, password: password) { result in
                switch result {
                    case .success(let user):
                        // Handle successful login
                        completion(.success(user))
                    self.isLogged = true
                    self.nextScreen = "Home"
                    case .failure(let error):
                        // Handle login error
                        completion(.failure(error))
                }
            }
        }

        func logout() {
            SessionManager.shared.logout()
        }
}
