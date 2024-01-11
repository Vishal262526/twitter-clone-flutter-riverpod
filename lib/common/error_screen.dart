import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallate.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;
  const ErrorScreen({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
          child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Pallate.kWhiteColor,
          fontSize: 18,
        ),
      )),
    );
  }
}
