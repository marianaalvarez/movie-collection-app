//
//  API.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 7/11/2024.
//

import Foundation

protocol FecthMovieAPIProtocol {
    func fetchMovie(completion: @escaping (Result<Movie, CustomError>) -> Void)
}

final class FecthMovieAPI: FecthMovieAPIProtocol {
    
    func fetchMovie(completion: @escaping (Result<Movie, CustomError>) -> Void) {
        let urlString = "https://www.omdbapi.com/?apikey=c0442f0d&t=Spider"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                completion(.failure(CustomError.connectionError))
            }
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                statusCode != 200 {
                completion(.failure(CustomError.invalidStatusCode))
            }
            
            if let movieData = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Movie.self, from: movieData)
                    completion(.success(decodedResponse))
                } catch {
                    completion(.failure(CustomError.parseError))
                }
            }
            
            completion(.failure(CustomError.movieNotFoundError))
        }
        session.resume()
    }
}
