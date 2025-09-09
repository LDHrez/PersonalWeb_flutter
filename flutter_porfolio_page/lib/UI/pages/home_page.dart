import 'package:flutter/material.dart';
import 'package:flutter_porfolio_page/UI/shared/custom_app_menu.dart';
import 'package:flutter_porfolio_page/UI/shared/horizontal_gradient.dart';

import 'package:flutter_porfolio_page/UI/views/about_view.dart';
import 'package:flutter_porfolio_page/UI/views/home_single_view.dart';
import 'package:flutter_porfolio_page/UI/views/home_view.dart';
import 'package:flutter_porfolio_page/UI/views/services_view.dart';
import 'package:flutter_porfolio_page/UI/views/projects_view.dart';
import 'package:flutter_porfolio_page/UI/views/contact_view.dart';
import 'package:flutter_porfolio_page/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: myBoxDecoration(),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            _HomeBody(),
          //  Positioned(top: 0, left: 0, child: CustomAppMenu()),
          ],
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration() {
    return const BoxDecoration(
      color: Colors.black87,
      // return BoxDecoration(
      //   // gradient: LinearGradient(
      //   //   begin: Alignment.topCenter,
      //   //   end: Alignment.bottomCenter,
      //   //   colors: [
      //   //     Colors.blue.shade400,
      //   //     Colors.blue.shade300,
      //   //     Colors.blue.shade200,
      //   //     Colors.blue.shade100,
      //   //   ]
      //   //   // colors: [
      //   //   //   Colors.black,
      //   //   //   Colors.black87,
      //   //   //   Colors.black54,
      //   //   //   Colors.black12,
      //   //   // ],
      //   //   //stops: [0.1, 0.4, 0.7, 0.9],
      //   ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    final Size screenSize = MediaQuery.of(context).size;

    final bp = ResponsiveBreakpoints.of(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black54,
          child: Padding(
            padding: EdgeInsets.only(left: screenSize.width * 0.5),
            child: Image.asset('assets/images/me_art.PNG', fit: BoxFit.cover),
          ),
        ),
        const HorizontalGradient(),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: bp.isMobile ? Colors.black54 : Colors.transparent,
        ),
        
        PageView(
          physics: const ClampingScrollPhysics(),
          allowImplicitScrolling: true,
          scrollDirection: Axis.vertical,
          controller: pageProvider.scrollController,
          children: [
            HomeSingleView(),
            // HomeView(),
            // AboutView(),
            // ServicesView(),
            // ProjectsView(),
            // ContactView(),
          ],
        ),
      ],
    );
  }

  PageController verticalPageScrollController() {
    return PageController(initialPage: 0, viewportFraction: 1, keepPage: true);
  }
}
