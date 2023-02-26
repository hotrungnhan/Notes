import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/viewmodels/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authBloc = context.read<AuthBloc>();
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
                width: 480,
                height: 300,
                child: Column(children: [
                  Column(
                    children: [
                      PlatformText(
                        "Login",
                        style: platformThemeData(context,
                            material: (t) => t.textTheme.headlineSmall,
                            cupertino: (t) =>
                                t.textTheme.navLargeTitleTextStyle),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(children: [
                          PlatformTextFormField(
                            material: (context, platform) =>
                                MaterialTextFormFieldData(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Username',
                              ),
                            ),
                            cupertino: (context, platform) =>
                                CupertinoTextFormFieldData(
                                    placeholder: "Username"),
                          ),
                          PlatformTextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            material: (context, platform) =>
                                MaterialTextFormFieldData(
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Password',
                              ),
                            ),
                            cupertino: (context, platform) =>
                                CupertinoTextFormFieldData(
                                    placeholder: "Password"),
                          ),
                        ]),
                      ),
                      PlatformElevatedButton(
                        padding: const EdgeInsets.only(top: 10),
                        // material: (context, platform) => MaterialTextButtonData(style: ),
                        // cupertino: (context, platform) => CupertinoTextButtonData(),
                        onPressed: () =>
                            authBloc.add(const LoginEvent("email", "password")),
                        child: PlatformText("Login"),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlatformTextButton(
                            onPressed: () => {context.go("/forgot-password")},
                            child: PlatformText("Forget Password !"),
                          ),
                          PlatformTextButton(
                            onPressed: () => {context.go("/signup")},
                            child: PlatformText("Sign Up"),
                          )
                        ],
                      )),
                ])),
          ],
        ));
  }
}
