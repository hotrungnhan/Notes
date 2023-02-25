import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlatformText(
            'Hello from template',
          ),
          PlatformText(
            'google',
            style: platformThemeData(context,
                material: (t) => t.textTheme.headlineMedium,
                cupertino: (t) => t.textTheme.navTitleTextStyle),
          ),
          PlatformTextButton(
            onPressed: () => {context.go("/item/1")},
            child: PlatformText("google.com"),
          )
        ],
      ),
    );
  }
}
