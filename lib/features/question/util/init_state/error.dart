import 'package:flutter/material.dart';

class AppCubitError extends StatelessWidget {
  const AppCubitError({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message.trim()),
    );
  }
}
