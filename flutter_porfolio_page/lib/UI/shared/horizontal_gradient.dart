import 'package:flutter/material.dart';

class HorizontalGradient extends StatelessWidget {
  const HorizontalGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black, // Color sólido
            Colors.black87,
            Colors.black54,
            Colors.transparent, // Transparencia
          ],
          stops: [
            0.55,
            0.65,
            0.7,
            0.8,
          ], // Ajusta los puntos de parada para controlar la transición
        ),
      ),
    );
  }
}

class VerticalGradient extends StatelessWidget {
  const VerticalGradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black, // Color sólido
            Colors.black87,
            Colors.black54,
            Colors.transparent, // Transparencia
          ],
          stops: [
            0.6,
            0.65,
            0.7,
            0.75,
          ], // Ajusta los puntos de parada para controlar la transición
        ),
      ),
    );
  }
}