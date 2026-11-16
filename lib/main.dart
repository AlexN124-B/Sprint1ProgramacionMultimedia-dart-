import 'package:flutter/material.dart';

import 'screens/catalogo_screen.dart';

void main() => runApp(const ComercioApp());


class ComercioApp extends StatelessWidget {
  const ComercioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kebab Amigo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent)),
      home: CatalogoScreen(),
    );
  }
}
