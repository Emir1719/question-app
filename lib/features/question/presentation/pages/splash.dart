import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/auth/auth_cubit.dart';
import 'package:question_app/features/question/presentation/pages/home.dart';
import 'package:question_app/features/question/presentation/pages/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthenticated = context.read<AuthCubit>().isAuthenticated();

    if (isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeView()));
      });
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterView()));
      });
    }

    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(), // Splash screen loading indicator
      ),
    );
  }
}
