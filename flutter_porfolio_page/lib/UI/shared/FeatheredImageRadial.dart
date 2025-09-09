import 'package:flutter/material.dart';

class FeatheredImageRadial extends StatelessWidget {
  final ImageProvider image;
  final double width;
  final double height;
  /// 0.0 = sin fade, 1.0 = casi todo es fade. Útil entre 0.05 y 0.25
  final double feather;

  const FeatheredImageRadial({
    super.key,
    required this.image,
    this.width = double.infinity,
    this.height = 300,
    this.feather = 0.15,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return RadialGradient(
          center: Alignment.center,
          radius: 0.5, // base del radio
          colors: const [
            Colors.black,      // opaco en el centro
            Colors.black,      // mantiene contenido visible
            Colors.transparent // se vuelve transparente en el borde
          ],
          stops: [
            0.0,
            (1 - feather).clamp(0.0, 1.0), // hasta dónde llega lo visible
            1.0,
          ],
        ).createShader(rect);
      },
      blendMode: BlendMode.dstIn,
      child: Image(
        image: image,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}
