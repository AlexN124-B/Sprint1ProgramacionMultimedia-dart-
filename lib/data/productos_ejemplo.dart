import '../models/producto.dart';

/// Datos de ejemplo hasta que haya base de datos y API (UT5).

const productosEjemplo = [
  Producto(id: 1, nombre: 'Durum mixto', descripcion: 'Durum mixto doble salsa amigo', precio: 4.50, categoria: Categorias.durum),
  Producto(id: 2, nombre: 'Durum ternera', descripcion: 'Durum ternera double salsa amigo.', precio: 4.50, categoria: Categorias.durum),
  Producto(id: 3, nombre: 'Durum pollo', descripcion: 'Durum ternera doble salsa amigo.', precio: 4.50, categoria: Categorias.durum),
  Producto(id: 4, nombre: 'Pita mixto', descripcion: 'Pita mixto doble salsa amigo.', precio: 4.00, categoria: Categorias.pita),
  Producto(id: 5, nombre: 'Pita ternera', descripcion: 'Pita ternera doble salsa amigo.', precio: 4.00, categoria: Categorias.pita),
  Producto(id: 6, nombre: 'Pita pollo', descripcion: 'Pita pollo doble salsa amigo.', precio: 4.00, categoria: Categorias.pita),
  Producto(id: 7, nombre: 'Kebabox', descripcion: 'Kebabox doble salsa carne mixta amigo.', precio: 4.90, categoria: Categorias.kebabox),
  Producto(id: 8, nombre: 'Menu durum', descripcion: 'Menu durum, bebida, patatas pequeñas doble salsa amigo.', precio: 9.00, categoria: Categorias.menu),
  Producto(id: 9, nombre: 'Menu pita', descripcion: 'Menu pita, bebida, patatas pequeñas doble salsa amigo.', precio: 8.00, categoria: Categorias.menu),
  Producto(id: 10, nombre: 'Menu kebabox', descripcion: 'Menu kebabox, bebida doble salsa amigo.', precio: 7.00, categoria: Categorias.menu),
  Producto(id: 11, nombre: 'Rata', descripcion: '¿Como llego esto aqui amigo?', precio: 2.00, categoria: Categorias.rata),
];
