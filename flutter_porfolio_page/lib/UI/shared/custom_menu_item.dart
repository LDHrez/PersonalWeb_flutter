import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';


class CustomMenuItem extends StatefulWidget {
  
  const CustomMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
  });

final String text;
final Function onPressed;



  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return FlipInY(
      //duration: Duration(milliseconds: 500),
      child: MouseRegion(
        onEnter:  ( _ ){ setState(() {
          isHover = true;
        });},
        onExit: ( _ ){ setState(() {
          isHover = false;
        });},
        child: GestureDetector(
            onTap: () => widget.onPressed(),
            child: AnimatedContainer(
              duration:  Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              color: isHover ? Colors.white12 : Colors.black12,
              width: 150,
              height: 50,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text(widget.text, style: GoogleFonts.montserratAlternates(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),
              ),
            ),
      
          ),
      ),
    );
  }
}