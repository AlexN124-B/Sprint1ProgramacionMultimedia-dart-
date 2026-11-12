// ignore: deprecated_member_use
import 'package:flutter/material.dart';

import '../models/producto.dart';

/// Una fila del catálogo. Solo dibuja: qué pasa al tocarla lo decide la pantalla.
class ProductoTile extends StatelessWidget {
  const ProductoTile({
    super.key,
    required this.producto,
    required this.onTap,
    this.onLongPress,
  });

  final Producto producto;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text(producto.nombre[0])),
      title: Text(producto.nombre),
      subtitle: Text(producto.categoria),
      trailing: Text(producto.precioTexto),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
