import 'package:flutter/material.dart';

import '../data/productos_ejemplo.dart';

/// Pantalla principal del catálogo.
/// Por ahora solo comprueba que los datos se leen bien.
/// En la sesión 2 de la UT2 se convierte en una lista con ListView.builder.
class CatalogoScreen extends StatelessWidget {
  const CatalogoScreen({super.key});

  final _productos = [...productosEjemplo];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: Center(
        child: ListView.builder(itemBuilder: itemBuilder),
      ),
    );
  }
}
