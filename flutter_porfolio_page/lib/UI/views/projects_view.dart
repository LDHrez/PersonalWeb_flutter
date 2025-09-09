import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Projects View',
            style: GoogleFonts.montserratAlternates(
              fontSize: 80,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    );
  }
}