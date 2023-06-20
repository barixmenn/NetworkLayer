//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Baris on 20.06.2023.
//

import Foundation

protocol EndPointProtocol {
    var baseURL: String {get}
    var path : String {get}
    var method: HTTPMethod {get}
    var header: [String: String]? {get}
    
    func request() -> URLRequest
}

enum EndPoint {
    case getUsers
    case comments
}

extension EndPoint: EndPointProtocol {
    var baseURL: String {
        return BASE_URL
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/users"
        case .comments:
            return "/comments"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        case .comments:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL ERROR!")
        }
        components.path = path
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if let header = header {
            for (key , value)  in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    
}
