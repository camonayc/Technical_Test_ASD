import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/config/routes.dart';
import 'package:technical_test_asd/src/core/utils/wrapper_banner.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return WrapBanner(
      label: Environment.config.environment,
      visible: Environment.config.bannerVisibility,
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        routerConfig: appRouter,
      ),
    );
  }
}
