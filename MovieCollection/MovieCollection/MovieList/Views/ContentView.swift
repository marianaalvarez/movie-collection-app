//
//  ContentView.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    let service: MovieServiceProtocol
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Click to load movies", action: fetchMovie)
        }
        .padding()
    }
    
    private func fetchMovie() {
        service.fetchMovie(title: "Spider") { result in
            switch result {
            case .success(let movie):
                print("Filme: \(movie)")
            case .failure(let error):
                showErrorFor(error)
            }
        }
    }
    
    private func showErrorFor(_ customError: CustomError) {
        switch customError {
        case .connectionError, .invalidStatusCode, .parseError:
            print("Connection error")
        case .dataNotFoundError:
            print("Movie not found")
        }
    }
}

#Preview {
    ContentView(service: MovieService(apiClient: APIClient.shared))
}
