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
            print("Passou por aqui")
        }
        session.resume()
    }
}
