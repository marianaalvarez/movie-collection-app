//
//  ContentView.swift
//  MovieCollection
//
//  Created by Mariana Alvarez de Carvalho on 10/10/2024.
//

import SwiftUI

struct ContentView: View {
    let api = API()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Button("Click to load movies", action: api.fetchMovie)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
