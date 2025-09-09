import 'package:flutter/material.dart';
import 'package:flutter_porfolio_page/providers/page_provider.dart';
import 'package:flutter_porfolio_page/router/router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageProvider() )
      ], child: MyApp());
  }
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
    super.initState();

    FRouter.configureRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      useMaterial3: true,
      // Paleta neutra (ajústala a tu marca)
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF111318)),
      // Sin efectos Material
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      // Sin animaciones de página "Material"
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: NoTransitions(),
        TargetPlatform.iOS: NoTransitions(),
        TargetPlatform.linux: NoTransitions(),
        TargetPlatform.macOS: NoTransitions(),
        TargetPlatform.windows: NoTransitions(),
        TargetPlatform.fuchsia: NoTransitions(),
      }),
    ),
      debugShowCheckedModeBanner: false,
      title: 'Daniel HB',
      onGenerateRoute: FRouter.router.generator,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!, 
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 900, name: TABLET),
          const Breakpoint(start: 901, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
        ),
      initialRoute: '/home',
    );
  }
}

class NoTransitions extends PageTransitionsBuilder {
  const NoTransitions();

  @override
  Widget buildTransitions<T>(route, context, animation, secondary, child) => child;
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext c, Widget child, ScrollableDetails d) => child;
}