import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSingleView extends StatelessWidget {
  const HomeSingleView({super.key});

    final title = 'Daniel Hernández';
    final subtitle = 'Experiecias reales a partir de ideas simples';
    final services = '>_ Desarrollo de experiencias\n>_ Aplicaciones y soluciones digitales\n>_ Realidad Extendida\n>_ Innovación Creativa';
    final buttonText = 'Contactame';


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bp = ResponsiveBreakpoints.of(context);

    return  bp.isMobile? mobileView(screenSize)
          : bp.isTablet ? tabletView(screenSize)
          : desktopView(screenSize);
  }

  Widget desktopView(Size screenSize) {
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
              title,
              style: GoogleFonts.bebasNeue(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 25,
                color: Colors.white54,
              ),
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 50),
            FlipInX(child: Text(
              services,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),),

            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: mailToFunction,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    ),
  );
  }
  Widget tabletView(Size screenSize) {
    return Padding(
    padding: EdgeInsets.only(right: screenSize.width * 0.25, left: 80.0),
    child: SizedBox(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.bebasNeue(
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.left,
            ),

            SizedBox(height: 50),
            FlipInX(child: Text(
              services,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),),

            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                OutlinedButton(
                  onPressed: mailToFunction,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ),
    ),
  );
  }
  Widget mobileView(Size screenSize) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.bebasNeue(
                fontSize: 70,
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.left,
            ),
            
            Text(
              subtitle,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 20),
            FlipInX(child: Text(
              services,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: mailToFunction,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.white),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );

  }

  Future mailToFunction () async {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'daniel.hb.015@gmail.com',
                      queryParameters: {
                        'subject': "Contacto desde pagina web",
                        'body': "Hola Daniel, quisiera contactarte porque..."
                      },
                    );
                    if (await canLaunchUrl(emailLaunchUri)){
                      await launchUrl(emailLaunchUri);
                    }
                  }
}
