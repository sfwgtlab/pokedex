//
//  ContentView.swift
//  pokedex
//
//  Created by Irving on 21/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon: pokemon?
    @StateObject var searchPokemon: SearchPokemon = SearchPokemon()
    
    @StateObject var pokemonService: PokemonService = PokemonService()
    @State var texto: String = ""
    @State var resultado: String = ""
    var textoAlguno: String = "hola munde"
    var body: some View {
        VStack {
            VStack{
                HStack{
                    HStack{
                        Text("hola mundo")
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .background(.blue)
                    .padding()
                
                }
                .onAppear{
                   
                }
                .frame(maxWidth: .infinity, maxHeight: 250)
                .background(.white)
                Spacer()
                VStack{
                    TextField("Busca un pokemon ", text: $texto)
                        .cornerRadius(8)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            pokemonService.servicio(pokemonName: texto)
                        }
                    VStack{
                        HStack{
                            Text("Height: ")
                            Text(String(pokemonService.pokemons?.height ??  0))
                        }
                        HStack{
                            Text("Weight: ")
                            Text(String(pokemonService.pokemons?.weight ??  0))
                        }
                        HStack{
                            Text("Id: ")
                            Text(String(pokemonService.pokemons?.id ??  0))
                        }
                        HStack{
                            Text("Nombre: ")
                            Text(pokemonService.pokemons?.name ??  "???")
                        }
                        
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .padding()
                    .background(.orange)
                    
                        
                        
                }
                Spacer()
                Spacer()
            }.border(.green)
           Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background{
            Color.red
        }
    
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
