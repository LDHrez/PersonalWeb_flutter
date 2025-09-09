import 'package:flutter/material.dart';
import 'package:flutter_porfolio_page/UI/shared/custom_service_item.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter, // desde arriba
          end: Alignment.bottomCenter, // hacia abajo
          colors: [
            Colors.transparent, // transparente abajo
            Colors.black54,
            Colors.black, // negro sólido arriba
          ],
          stops: [0, 0.025, 0.05],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 80,vertical: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: GoogleFonts.bebasNeue(
              fontSize: 80,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.left,
          ),
          Spacer(),
          Row(
            //minItemWidth: 200,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomServiceItem(
                title: "Desarrollo de Experiecnias Interactivas",
                description: "+ Videojuegos (para PC, consola o móvil, casuales o educativos).\n\n+ Gamificación (experiencias interactivas para empresas, marcas o capacitación).\n\n+ Simulaciones (para entrenamientos, educación o presentaciones interactivas).",
                imagePath: 'assets/images/videogames_service.png',
              ),
              CustomServiceItem(
                title: "Aplicaciones y Soluciones Digitales",
                description: '+ Aplicaciones móviles.\n\n+ Aplicaciones web interactivas.\n\n+ Integraciones con APIs y servicios externos.',
                imagePath: 'assets/images/games_service.png',
              ),
              CustomServiceItem(
                title: "Realidad Extendida (XR)",
                description: '+ Experiencias en Realidad Virtual (VR).\n\n+ Experiencias en Realidad Aumentada (AR) (para campañas, marketing, educación).\n\n+ Filtros y efectos para redes sociales (Instagram, TikTok, Snapchat).',
                imagePath: 'assets/images/games_service.png',
              ),
              CustomServiceItem(
                title: "Servicios de Innovación Creativa",
                description: '+ Instalaciones interactivas (eventos, ferias, museos).\n\n+ Prototipado de ideas (MVPs para startups).\n\n+ Consultoría en diseño de experiencias digitales.',
                imagePath: 'assets/images/games_service.png',
              ),
            ],
          )
        ],
      ),
    );
  }
}
