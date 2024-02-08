//
//  ContentView.swift
//  pokedexSwift
//
//  Created by LibelulaSoft Compu4 on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var pokemonViewModel = PokemonViewModel()
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 10){
                    ForEach(pokemonViewModel.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                        
                    }
                }
                .animation(.easeIn(duration: 0.3), value: pokemonViewModel.filteredPokemon.count)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $pokemonViewModel.searchText)
        }
        .environmentObject(pokemonViewModel)
    }
}

#Preview {
    ContentView()
}
