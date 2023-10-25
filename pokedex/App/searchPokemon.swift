//
//  searchPokemon.swift
//  pokedex
//
//  Created by Irving on 12/09/23.
//

import Foundation

class SearchPokemon: ObservableObject{
    @Published var pokemon: pokemon?
    
   let pokemonService: PokemonService = PokemonService()
    
    
    func searchPokemon(pokemonName: String) {
        
        
        
        self.pokemon = pokemonService.servicio(pokemonName: pokemonName)
        
        print("nombre")
        print(pokemonName)
        print("response search")
        print(self.pokemon)
        
        
        
        
    }
}
