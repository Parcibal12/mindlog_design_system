import 'package:flutter/material.dart';

/// Un contenedor responsivo que restringe el ancho máximo del contenido
/// en pantallas grandes (Web/Desktop) para evitar que los elementos
/// se estiren de manera desproporcionada.
class MindLogWebConstrainedBox extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const MindLogWebConstrainedBox({
    super.key,
    required this.child,
    this.maxWidth = 600.0,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
