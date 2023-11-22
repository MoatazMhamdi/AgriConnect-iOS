// UserViewModel.swift

import Foundation

class UserViewModel: ObservableObject {
    @Published var otpSent: Bool = false
    @Published var otpResponse: String = ""
    private let apiManager = APIManager()
    
    func registerUser(name: String, email: String, password: String, numTel: String) {
        let newUser = UserRegistration(name: name, email: email, password: password, numTel: numTel)
        apiManager.registerUser(user: newUser)
    }
    func registerClient(name: String, email: String, password: String, numTel: String) {
        let newClient = UserRegistration(name: name, email: email, password: password, numTel: numTel)
        apiManager.RegisterClient(user: newClient)
    }
   func forgetPassword(numTel: String, completion: @escaping (Result<UserRegistration, Error>) -> Void){
        apiManager.forgetPassword(numTel: numTel) { [self] result in
            switch result {
            case .success(let otp):
                // Handle success, e.g., set otpSent to true or show a message
                otpSent = true
                self.otpResponse = otp
                
            case .failure(let error):
                // Handle error, e.g., show an alert
                print("Error sending OTP: \(error)")
            }
        }
        
    }
}
