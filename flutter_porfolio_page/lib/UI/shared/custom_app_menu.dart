import 'package:flutter/material.dart';
import 'package:flutter_porfolio_page/providers/page_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_porfolio_page/UI/shared/custom_menu_item.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin {
  
  bool isOpen = false;
  late AnimationController controller;
  
@override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {

    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: size.width, //isOpen ? size.width : 100,
          height: 80,
          color: Colors.transparent,
          child: Row(
            children: [
             // _MenuTitle(isOpen: isOpen, controller: controller),
              // if (isOpen)
              // ...[
                CustomMenuItem(text: "Home", onPressed: () => pageProvider.goTo(0) ),
                CustomMenuItem(text: "About", onPressed: ()=> pageProvider.goTo(1) ),
                CustomMenuItem(text: "Services", onPressed: ()=> pageProvider.goTo(2) ),
                CustomMenuItem(text: "Projects", onPressed: ()=> pageProvider.goTo(3) ),
                CustomMenuItem(text: "Contact", onPressed: ()=> pageProvider.goTo(4) ),
             // ]
            ],
          )
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: isOpen ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 30 : 0,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            progress: controller,
            color: Colors.white,
          ),
          //Spacer(),
          Text('Menú', 
            style: GoogleFonts.robotoCondensed(color: Colors.white, fontSize: 20)
          ),

          ],
      ),
    );
  }
}