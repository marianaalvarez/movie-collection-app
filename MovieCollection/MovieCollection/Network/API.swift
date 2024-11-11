//
//  API.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 7/11/2024.
//

import Foundation

final class API {
    
    func fetchMovie() {
        let urlString = "https://www.omdbapi.com/?apikey=c0442f0d&t=Spider"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
               // Throw connectionError
            }
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode,
                statusCode != 200 {
                // Throw invalidStatusCodeError
            }
            
            if let movieData = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Movie.self, from: movieData)
                    print(decodedResponse)
                } catch {
                    // Throw parseError
                }
            }
            
            // Throw movieNotFound error
        }
        session.resume()
    }
}
