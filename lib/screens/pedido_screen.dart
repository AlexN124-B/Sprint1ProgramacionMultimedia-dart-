import 'package:flutter/material.dart';
import '../models/producto.dart';


class PedidoScreen extends StatefulWidget{
  const PedidoScreen({super.key, required this.producto});

  final Producto producto;
  @override
  State<StatefulWidget> createState() => _PedidoScreen();
}


class _PedidoScreen extends State<PedidoScreen>{
  double _cantidad = 1;     
  bool _servilletas = false;     
  bool _domicilio = false;  


  double get _total {
    double total = widget.producto.precio * _cantidad;
    if (_servilletas) total = total + 0.50;
    if (_domicilio) total = total + 2.0 ;
    return total;
  }
  Future<void> _confirmar() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (dialogo) => AlertDialog(
        title: const Text('Confirmar pedido'),
        content: Text(
          '${_cantidad.round()} × ${widget.producto.nombre}\n'
          'Total: ${_total.toStringAsFixed(2)} €',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogo, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogo, true),
            child: const Text('Pedir'),
          ),
        ],
      ),
    );
    if (ok == true && mounted) {
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedido: ${widget.producto.nombre}')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Cantidad: ${_cantidad.round()}'),
          Slider(
            value: _cantidad,
            min: 1,
            max: 10,
            divisions: 9,
            label: '${_cantidad.round()}',
            onChanged: (v) => setState(() => _cantidad = v),
          ),
          CheckboxListTile(
            title: const Text('Servilletas (+0.50 €)'),
            value: _servilletas,
            onChanged: (v) => setState(() => _servilletas = v ?? false),
          ),
          SwitchListTile(
            title: const Text('Envío a domicilio (+2.00 €)'),
            value: _domicilio,
            onChanged: (v) => setState(() => _domicilio = v),
          ),
          const Divider(),
          Text(
            'Total: ${_total.toStringAsFixed(2)} €',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _confirmar,
            child: const Text('Confirmar pedido'),
          ),
        ],
      ),
    );
  }
}