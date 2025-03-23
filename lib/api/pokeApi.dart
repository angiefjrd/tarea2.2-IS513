import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modelo/pokemon.dart';

class ApiPokemon{
  Future<List<Pokemon>> getPokemonList() async{
    final url = Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=50");

    try{
      final response = await http.get(url);

      if(response.statusCode == 200){
        final data = json.decode(response.body);
        final List results = data['results'];

        final List<Pokemon> pokemonList = await Future.wait(
          results.asMap().entries.map((entry) async {
            int id = entry.key + 1;
            return await getPokemonDetalle(id);
          }).toList(),
        );

        return pokemonList;
      }
      else{
        throw Exception("Error al cargar los Pokémon");
      }


    }catch (e){
       throw Exception(e.toString());
    }
  }

  Future<Pokemon> getPokemonDetalle(int id) async{
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$id');
    try{
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return Pokemon.fromJson(data);
      } else {
        throw Exception("Error al cargar los detalles del Pokémon");
      }
    }catch (e){
       throw Exception(e.toString());
    }
  }
}