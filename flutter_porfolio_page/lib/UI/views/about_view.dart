import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    // return Padding(
    //   padding: EdgeInsets.only(left: 80.0, right: screenSize.width * 0.4),
    //   child: SizedBox(
    //     width: screenSize.width * 0.6,
    //     child: FittedBox(
    //       fit: BoxFit.fitWidth,
    //       child: Text(
    //         'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,',
    //         style: GoogleFonts.poppins(
    //           fontSize: 40,
    //           color: Colors.white,
    //           fontWeight: FontWeight.normal,
    //         ),
    //         textAlign: TextAlign.left,
    //         softWrap: true,
    //         overflow: TextOverflow.visible,
    //       ),
    //     ),
    //   ),
    // );
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: screenSize.width * 0.6,
        padding: EdgeInsets.all(80),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a,',
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white54,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.left,
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}