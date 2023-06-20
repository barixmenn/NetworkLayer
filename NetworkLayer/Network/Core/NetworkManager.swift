//
//  NetworkManager.swift
//  NetworkLayer
//
//  Created by Baris on 20.06.2023.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    private func request<T:Decodable>(_ endpoint: EndPoint, completion: @escaping (Swift.Result<T,Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data , response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200, response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "Invalid response", code: 0)))
                return
            }
                           
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid response data", code: 0)))
                return
            }
            
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
            } catch let error {
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getUser(completion: @escaping (Swift.Result<[User],Error>) -> Void) {
        let endpoint = EndPoint.getUsers
        request(endpoint, completion: completion)
    }
    
    func getComments(completion: @escaping (Swift.Result<[Comment],Error>) -> Void) {
        let endpoint =  EndPoint.comments
        request(endpoint, completion: completion)
    }
}
