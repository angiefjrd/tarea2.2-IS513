import 'package:flutter/material.dart';
import '../modelo/pokemon.dart';
import 'package:go_router/go_router.dart';

class Detalle extends StatelessWidget {
  final Pokemon pokemon;

  const Detalle({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nombre.toUpperCase()),
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(pokemon.imagen, width: 200, height: 200),
            SizedBox(height: 20),
            Text(
              'ID: ${pokemon.id}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            SizedBox(height: 20),
            Text(
              'Nombre: ${pokemon.nombre}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown)
            ),
            SizedBox(height: 10),
            Text(
              'Altura: ${pokemon.altura / 10} m',
              style: TextStyle(fontSize: 18, color: Colors.brown),
            ),
            Text(
              'Peso: ${pokemon.peso / 10} kg',
              style: TextStyle(fontSize: 18, color: Colors.brown),
            ),
            SizedBox(height: 10),
            Text(
                'Experiencia Base: ${pokemon.experiencia}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              SizedBox(height: 10),
            Text(
              'Tipos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            Wrap(
              spacing: 10,
              children: pokemon.tipos.map((type) {
                return Chip(
                  label: Text(
                    type.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color(0xFFff9999),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              'Habilidades:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            Wrap(
              spacing: 10,
              children: pokemon.habilidades.map((ability) {
                return Chip(
                  label: Text(
                    ability.toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color(0xFFff9999),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
              Text(
                'Sprites Adicionales:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(pokemon.imagen, width: 80, height: 80),
                  SizedBox(width: 10),
                  Image.network(pokemon.backImagen, width: 80, height: 80),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => context.go('/'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFff9999),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Pantalla principal'),
              ),
            ],
          ),
        ),
      )
    );
  }
}