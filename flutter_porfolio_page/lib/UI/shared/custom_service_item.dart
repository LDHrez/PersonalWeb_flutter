import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

class CustomServiceItem extends StatefulWidget {
  const CustomServiceItem({super.key, required this.title, required this.description, required this.imagePath});

  final String title;
  final String description;
  final String imagePath;

  @override
  State<CustomServiceItem> createState() => _CustomServiceItemState();
}

class _CustomServiceItemState extends State<CustomServiceItem> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:
          (_) => setState(() {
            _isHover = true;
          }),
      onExit:
          (_) => setState(() {
            _isHover = false;
          }),
      child: GestureDetector(
        child: SizedBox(
          width: 300,
          height: 500,
          child: Stack(
            children: [
              // Background
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset( widget.imagePath,fit:BoxFit.cover,),
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: double.infinity,
                height: double.infinity,
                color: _isHover ? Colors.black38 : Colors.transparent,
              ),

              // Title and Description
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: MoveTo(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  top: 50,
                  animate: _isHover,
                  controller: (controller) {
                    if (_isHover) {
                      controller.forward();
                    } else {
                      controller.reverse();
                    }
                  },
                  child: Column(
                    children: [
                      AutoSizeText(
                        widget.title,
                        style: GoogleFonts.bebasNeue(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        minFontSize: 35,
                      ),
                       if (_isHover) ...[
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: BounceInUp(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          AutoSizeText(
                            widget.description,
                            style: GoogleFonts.poppins(
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.left,
                            maxFontSize: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
