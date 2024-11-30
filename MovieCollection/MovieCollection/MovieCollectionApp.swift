//
//  MovieCollectionApp.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 10/10/2024.
//

import SwiftUI

@main
struct MovieCollectionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(service: MovieService(apiClient: APIClient.shared))
        }
    }
}
