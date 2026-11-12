import 'package:flutter/material.dart';
import '../widgets/producto_tile.dart';
import '../models/producto.dart';
import '../data/productos_ejemplo.dart';

/// Pantalla principal del catálogo.
/// Por ahora solo comprueba que los datos se leen bien.
/// En la sesión 2 de la UT2 se convierte en una lista con ListView.builder.
class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Producto> _productos = [...productosEjemplo];
  void _abrirDetalle(Producto p) {
    // Navigator.push(
      // context,
      // MaterialPageRoute(builder: (_) => DetalleScreen(producto: p)),
    // );
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: Center(
        child: ListView.builder(
          itemCount: _productos.length,
          itemBuilder: (context, i) => ProductoTile(
            producto: _productos[i],
            onTap: () => _abrirDetalle(_productos[i]) ,
          )
          ),
      ),
    );
  }
}
