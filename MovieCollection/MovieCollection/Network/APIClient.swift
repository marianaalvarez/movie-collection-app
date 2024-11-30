//
//  APIClient.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 29/11/2024.
//

import Foundation

protocol APIClientProtocol {
    func performRequest(_ url: URL, completion: @escaping ((Result<Data, CustomError>) -> Void))
}

class APIClient: APIClientProtocol {
    static let shared = APIClient()
    
    private init() { }
    
    func performRequest(_ url: URL, completion: @escaping ((Result<Data, CustomError>) -> Void)) {
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in

            if let error = error {
                print("API Error: \(error.localizedDescription)")
                completion(.failure(.connectionError))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode))
                return
            }
            
            if let responseData = data {
                completion(.success(responseData))
            } else {
                completion(.failure(.dataNotFoundError))
            }
        }
        session.resume()
    }
}
