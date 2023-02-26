import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'global.provider.dart';
import 'route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalProvider(
        child: PlatformProvider(
            settings: PlatformSettingsData(),
            builder: (context) => PlatformApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: router,
                  builder: (context, child) => ResponsiveWrapper.builder(child,
                      maxWidth: 1280,
                      minWidth: 480,
                      defaultScale: true,
                      breakpoints: [
                        const ResponsiveBreakpoint.resize(480, name: MOBILE),
                        const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                        const ResponsiveBreakpoint.autoScale(1280,
                            name: DESKTOP),
                      ],
                      background: Container(color: const Color(0x00ffffff))),
                  // showPerformanceOverlay: true,
                  localizationsDelegates: const <
                      LocalizationsDelegate<dynamic>>[
                    DefaultMaterialLocalizations.delegate,
                    DefaultWidgetsLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                  ],
                  title: 'Sample Application',
                )));
  }
}
