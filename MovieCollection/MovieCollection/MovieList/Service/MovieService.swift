//
//  API.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 7/11/2024.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovie(title: String, completion: @escaping (Result<Movie, CustomError>) -> Void)
}

final class MovieService: MovieServiceProtocol {
    
    private let apiClient: APIClientProtocol
    private let apiKey: String = "c0442f0d"
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchMovie(title: String, completion: @escaping (Result<Movie, CustomError>) -> Void) {
        let urlString = "https://www.omdbapi.com/?apikey=\(apiKey)&t=\(title)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.connectionError))
            return
        }
        
        apiClient.performRequest(url) { result in
            switch result {
            case .success(let movie):
                do {
                    let decodedResponse = try JSONDecoder().decode(Movie.self, from: movie)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(.parseError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
