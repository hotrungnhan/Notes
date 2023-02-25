import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PlatformText(
            'Signup',
          ),
          PlatformTextButton(
            onPressed: () => {context.go("/login")},
            child: PlatformText("login"),
          )
        ],
      ),
    );
  }
}
