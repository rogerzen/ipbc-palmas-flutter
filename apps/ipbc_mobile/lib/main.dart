import 'package:core_module/core_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'app/splash/splash_module.dart';
export 'app/home/view_models/home_view_model.dart';

void main() async {
  Modular.setInitialRoute(SplashModule.initialRoute);
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    SupabaseDatasource.init(),
    HiveDatasource.init(),
  ]);
  Bloc.observer = GenericBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (_) => runApp(
      ModularApp(
        module: SplashModule(),
        child: MaterialApp.router(
          builder: (context, Widget? child) {
            return ScrollConfiguration(
              behavior: NoGlowBehavior(),
              child: child!,
            );
          },
          title: 'IPBC Palmas',
          theme: lightTheme,
          routerConfig: Modular.routerConfig,
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}



