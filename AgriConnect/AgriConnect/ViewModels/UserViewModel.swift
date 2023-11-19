// UserViewModel.swift

import Foundation

class UserViewModel: ObservableObject {
    private let apiManager = APIManager()

    func registerUser(name: String, email: String, password: String, numTel: String) {
        let newUser = UserRegistration(name: name, email: email, password: password, numTel: numTel)
        apiManager.registerUser(user: newUser)
    }
    func registerClient(name: String, email: String, password: String, numTel: String) {
        let newClient = UserRegistration(name: name, email: email, password: password, numTel: numTel)
        apiManager.RegisterClient(user: newClient)
    }
    
}
