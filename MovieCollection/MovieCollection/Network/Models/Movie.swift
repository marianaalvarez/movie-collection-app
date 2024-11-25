//
//  Movie.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 11/11/2024.
//

import Foundation

struct Movie: Codable {
    let title: String
    let year: String
    let genre: String
    let director: String
    let plot: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case genre = "Genre"
        case director = "Director"
        case plot = "Plot"
        case poster = "Poster"
    }
}
