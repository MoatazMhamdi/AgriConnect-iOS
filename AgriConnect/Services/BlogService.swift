import Foundation

enum BlogError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}

class BlogService: ObservableObject {
    static let shared = BlogService()
    
    private let baseURL = "http://localhost:9098/blog/"
    
    func addBlog(image: Data, titre: String, description: String, lieu: String, prix: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let urlString = baseURL
        guard let url = URL(string: urlString) else {
            completion(.failure(BlogError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = generateBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let httpBody = createFormDataBody(with: image, titre: titre, description: description, lieu: lieu, prix: prix, boundary: boundary)
        request.httpBody = httpBody
        
        // Print values for debugging
        print("URL: \(urlString)")
        print("Titre: \(titre)")
        print("Description: \(description)")
        print("Lieu: \(lieu)")
        print("Prix: \(prix)")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(BlogError.invalidResponse))
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                
                if let message = json?["message"] as? String {
                    completion(.success(message))
                } else if let errorMessage = json?["error"] as? String {
                    completion(.failure(NSError(domain: errorMessage, code: 0, userInfo: nil)))
                } else {
                    completion(.failure(BlogError.invalidResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
    
    private func generateBoundary() -> String {
        return "Boundary-\(UUID().uuidString)"
    }
    
    private func createFormDataBody(with image: Data, titre: String, description: String, lieu: String, prix: Int, boundary: String) -> Data {
        var body = Data()
        
        // Image Data
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"image\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(image)
        body.append("\r\n".data(using: .utf8)!)
        
        // Titre
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"titre\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(titre)\r\n".data(using: .utf8)!)
        
        // Description
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"description\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(description)\r\n".data(using: .utf8)!)
        
        // Lieu
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"lieu\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(lieu)\r\n".data(using: .utf8)!)
        
        // Prix
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"prix\"\r\n\r\n".data(using: .utf8)!)
        body.append("\(prix)\r\n".data(using: .utf8)!)
        
        // End boundary
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        return body
    }
    
    func fetchBlogs(completion: @escaping ([BlogModel]) -> Void) {
        guard let url = URL(string: "http://localhost:9098/blog/") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching blogs: \(error)")
                return
            }
            
           guard let data = data else {
                print("Invalid data")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let blogs = try decoder.decode([BlogModel].self, from: data)
                completion(blogs)
            } catch {
                print("Error decoding blogs: \(error)")
            }
        }.resume()
    }
}
    
    
