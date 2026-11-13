import 'package:flutter/material.dart';

import '../models/producto.dart';


class DetalleScreen extends StatelessWidget{
  final Producto _producto;
  const DetalleScreen({super.key, required this._producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Icon(Icons.arrow_back)),
      body: Center(
        child: Row(
          spacing: 8,
          children: [
            Column(
              children: [
                Text(_producto.nombre, style: TextStyle(fontSize: 20)),
                Text(_producto.categoria, style: TextStyle(fontSize: 10),)

              ],
            )
          ],
        ),
      ),
    );
  }
}