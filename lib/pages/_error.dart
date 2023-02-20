import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key, required this.exception});
  final Exception? exception;

  @override
  State<ErrorPage> createState() => _Error();
}

class _Error extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFE306),
      child: Text(widget.exception.toString()),
    );
  }
}
