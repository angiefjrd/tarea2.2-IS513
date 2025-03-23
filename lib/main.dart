import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pantallas/home.dart';
import 'pantallas/detalle.dart';
import 'modelo/pokemon.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Home(),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) {
          final pokemon = state.extra as Pokemon;
          return Detalle(pokemon: pokemon);
        },
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false, 
      title: 'Pokédex',
      routerConfig: router,
    );
  }
}
