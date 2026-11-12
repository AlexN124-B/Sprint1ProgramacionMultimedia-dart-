/// Un producto o servicio del comercio.
/// Solo datos: esta clase no sabe nada de widgets.
class Producto {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String categoria;

  const Producto({
    required this.id,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.categoria,
  });

  /// Precio con el formato que se muestra en pantalla, por ejemplo «3.20 €».
  String get precioTexto => '${precio.toStringAsFixed(2)} €';
}
