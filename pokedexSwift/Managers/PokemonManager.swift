//
//  PokemonManager.swift
//  pokedexSwift
//
//  Created by LibelulaSoft Compu4 on 7/2/24.
//

import Foundation

class PokemonManager{
    func getPokemon() -> [Pokemon]{
        let data: PokemonPage = Bundle.main.decode(file: "pokemon.json")
        let pokemon: [Pokemon] = data.results
        
        return pokemon
    }
    
    func getDetailedPokemon(id: Int, _ completion:@escaping (DetailPokemon) -> ()){
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/\(id)/",
                              model: DetailPokemon.self) { data in
            completion(data)
        }
    failure: { error in
        print (error)}
    }
}
