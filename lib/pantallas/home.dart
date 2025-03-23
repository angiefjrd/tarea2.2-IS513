import 'package:flutter/material.dart';
import '../api/pokeApi.dart';
import '../modelo/pokemon.dart';
import 'detalle.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ApiPokemon _pokemonApi = ApiPokemon();
  late Future<List<Pokemon>> _pokemonLista;

  @override
  void initState() {
    super.initState();
    _pokemonLista = _pokemonApi.getPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('P O K E D E X'),
        centerTitle: true,
        backgroundColor: Color(0xFFffcbcb),
      ),
      backgroundColor: Color(0xFFfff5e1),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonLista,
        builder: (context, AsyncSnapshot<List<Pokemon>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay datos disponibles'));
          }

         final pokemonLista = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, 
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75, 
            ),
            itemCount: pokemonLista.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonLista[index];

              return GestureDetector(
                onTap: () => context.go('/detail/${pokemon.id}', extra: pokemon),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  color: Color(0xFFffd6e0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        pokemon.imagen,
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 10),
                      Text(
                        pokemon.nombre.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      Text(
                        'ID: ${pokemon.id}',
                        style: TextStyle(fontSize: 14, color: Colors.brown[300]),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
            
