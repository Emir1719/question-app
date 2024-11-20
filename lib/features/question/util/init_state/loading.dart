import 'package:flutter/material.dart';

class AppCubitLoading extends StatelessWidget {
  const AppCubitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
        strokeWidth: 6,
      ),
    );
  }
}
