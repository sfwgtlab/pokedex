//
//  pokemonService.swift
//  pokedex
//
//  Created by Irving on 31/08/23.
//

import Foundation

class PokemonService: ObservableObject{
    
    @Published var pokemons: pokemon?
    
    func servicio(pokemonName: String) -> pokemon?{
        
        print("entro a pokemonservice")
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/"+pokemonName.lowercased()) else{
            return self.pokemons
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let pokemonResponse = try JSONDecoder().decode(pokemon.self, from: data)
                DispatchQueue.main.async {
                    self.pokemons = pokemonResponse
                        
                }
                
            
                
            }catch{
                print("ha ocurrido un error")
                print(error)
            }
            
        }
        
        
        task.resume()
        
        
        return pokemons
    
    }
    
}


