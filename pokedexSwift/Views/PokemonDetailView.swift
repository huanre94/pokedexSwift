//
//  PokemonDetailView.swift
//  pokedexSwift
//
//  Created by LibelulaSoft Compu4 on 7/2/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10){
                Text("Id: \(vm.pokemonDetails?.id ?? 0)")
                Text("Weight: \(vm.pokemonDetails?.weight ?? 0) KG")
                Text("Height: \(vm.pokemonDetails?.height ?? 0) M")
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon).environmentObject(PokemonViewModel())
}
