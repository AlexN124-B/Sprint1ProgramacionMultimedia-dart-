import 'package:flutter/material.dart';
import '../widgets/producto_tile.dart';
import '../screens/detalle_screen.dart';
import '../screens/nuevo_producto_screen.dart';
import '../models/producto.dart';
import '../data/productos_ejemplo.dart';

/// Pantalla principal del catálogo.
/// Por ahora solo comprueba que los datos se leen bien.
/// En la sesión 2 de la UT2 se convierte en una lista con ListView.builder.
class CatalogoScreen extends StatefulWidget {
  CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Producto> _productos = [...productosEjemplo];
  void _abrirDetalle(Producto p) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetalleScreen(producto: p)),
    );
  }
  Future<void> _nuevo() async {
    final nuevo = await Navigator.push<Producto>(
      context,
      MaterialPageRoute(builder: (_) => const NuevoProductoScreen()),
    );
    if (nuevo != null) {
      setState(() => _productos.add(nuevo));
    }
  }

  void _alElegirOpcion(String opcion) {
    switch (opcion) {
      case 'nombre':
        setState(() => _productos.sort((a, b) => a.nombre.compareTo(b.nombre)));
      case 'precio':
        setState(() => _productos.sort((a, b) => a.precio.compareTo(b.precio)));
      // PASO 8: descomenta estas dos líneas. El signo ! cambia true por false y al revés.
      // case 'vista':
      //   setState(() => _cuadricula = !_cuadricula);
      case 'acerca':
        showAboutDialog(context: context, applicationName: 'Kebab Amigo', children: [Text("Somos nosotros amigo")]);
    }
  }

  Future<void> _confirmarBorrado(Producto p) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialogo) => AlertDialog(
        title: const Text('Borrar producto'),
        content: Text('¿Seguro que quieres borrar «${p.nombre}»?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogo, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogo, true),
            child: const Text('Borrar'),
          ),
        ],
      ),
    );
    if (ok == true) {
      setState(() => _productos.remove(p));
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.shadow,
        title: const Text('Kebab Amigo.S.L', style: TextStyle(color: Colors.white),),
        actions: [
          PopupMenuButton<String>(
            onSelected: _alElegirOpcion,
            itemBuilder: (_) => [
              const PopupMenuItem(value: 'nombre', child: Text('Ordenar por nombre')),
              const PopupMenuItem(value: 'precio', child: Text('Ordenar por precio')),
              const PopupMenuDivider(),
              const PopupMenuItem(value: 'acerca', child: Text('Acerca de')),
            ],
            iconColor: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _productos.length,
          itemBuilder: (context, i) => ProductoTile(
            producto: _productos[i],
            onTap: () => _abrirDetalle(_productos[i]) ,
            onLongPress: () => _confirmarBorrado(_productos[i]),
          )
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nuevo,
        tooltip: "Nuevo producto",
        child: const Icon(Icons.add_circle_outline_outlined),
      ),
    );
  }
}
