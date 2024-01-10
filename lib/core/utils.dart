import 'package:flutter/material.dart';
import 'package:twitter_clone/theme/pallate.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: Pallate.kBackgroundColor,
        ),
      ),
      backgroundColor: Pallate.kWhiteColor,
    ),
  );
}
