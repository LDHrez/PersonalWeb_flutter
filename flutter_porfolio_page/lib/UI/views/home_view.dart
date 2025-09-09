import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(right: screenSize.width * 0.4, left: 80.0),
      child: SizedBox(
        width: screenSize.width * 0.6,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daniel Hernández',
                style: GoogleFonts.bebasNeue(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.left,
              ),
              
              Text(
                'Experiecias reales a partir de ideas simples',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: Colors.white54,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
