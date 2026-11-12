import 'package:flutter/material.dart';

import 'screens/catalogo_screen.dart';

void main() => runApp(const ComercioApp());

/// Raíz de la app del comercio.
// TODO (equipo): cambia el título y el color por los de vuestro comercio. completado
class ComercioApp extends StatelessWidget {
  const ComercioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kebab Amigo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)),
      home: const CatalogoScreen(),
    );
  }
}
