import 'package:flutter/material.dart';

/// Aplica un fade rectangular (bordes) para fundir la imagen con el fondo.
/// Mantiene forma rectangular. Puedes controlar el ancho del fade por lado.
class FeatheredImageRect extends StatelessWidget {
  final ImageProvider image;
  final double width;
  final double height;

  /// Porcentaje del ancho ocupado por el fade en cada lado (0.0–0.5).
  final double leftFeather;
  final double rightFeather;
  final double topFeather;
  final double bottomFeather;

  /// BoxFit para la imagen.
  final BoxFit fit;

  const FeatheredImageRect({
    super.key,
    required this.image,
    this.width = double.infinity,
    this.height = 300,
    this.leftFeather = 0.10,
    this.rightFeather = 0.10,
    this.topFeather = 0.10,
    this.bottomFeather = 0.10,
    this.fit = BoxFit.cover,
  }) : assert(0 <= leftFeather && leftFeather <= 0.5),
       assert(0 <= rightFeather && rightFeather <= 0.5),
       assert(0 <= topFeather && topFeather <= 0.5),
       assert(0 <= bottomFeather && bottomFeather <= 0.5);

  @override
  Widget build(BuildContext context) {
    // Imagen base
    Widget content = Image(
      image: image,
      width: width,
      height: height,
      fit: fit,
    );

    // Máscara horizontal (izq/der)
    content = ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        final l = leftFeather.clamp(0.0, 0.5);
        final r = (1 - rightFeather).clamp(0.0, 1.0);
        return LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: const [
            Colors.transparent, // borde izq
            Colors.black,       // zona visible
            Colors.black,       // zona visible
            Colors.transparent, // borde der
          ],
          stops: [0.0, l, r, 1.0],
        ).createShader(rect);
      },
      child: content,
    );

    // Máscara vertical (arriba/abajo)
    content = ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        final t = topFeather.clamp(0.0, 0.5);
        final b = (1 - bottomFeather).clamp(0.0, 1.0);
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.transparent, // borde sup
            Colors.black,       // zona visible
            Colors.black,       // zona visible
            Colors.transparent, // borde inf
          ],
          stops: [0.0, t, b, 1.0],
        ).createShader(rect);
      },
      child: content,
    );

    return content;
  }
}
