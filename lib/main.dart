import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:technical_test_asd/src/core/config/app.dart';
import 'package:technical_test_asd/src/core/config/env/environments.dart';
import 'package:technical_test_asd/src/core/utils/injection.dart';
import 'package:technical_test_asd/src/core/utils/types/env_type.dart';

Future<void> main() async {
  await Environment().initConfig(env: EnvType.PROD);
  WidgetsFlutterBinding.ensureInitialized();
  await initInjections();

  runApp(
    ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: false,
      builder: (context, snapshot) {
        return const App();
      },
    ),
  );
}
