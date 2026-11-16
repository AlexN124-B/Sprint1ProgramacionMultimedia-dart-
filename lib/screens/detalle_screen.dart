import 'package:flutter/material.dart';
import '../screens/pedido_screen.dart';
import '../models/producto.dart';


class DetalleScreen extends StatelessWidget{
  final Producto _producto;
  const DetalleScreen({super.key, required this._producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_producto.nombre),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_producto.categoria),
            const SizedBox(height: 8),
            Text(_producto.descripcion),
            const SizedBox(height: 8),
            Text(_producto.precioTexto, 
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FilledButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PedidoScreen(producto: producto)),
              ),
              icon: const Icon(Icons.shopping_basket),
              label: const Text('Hacer pedido'),
            ),
          ],
        ),
      ),
    );
  }
}