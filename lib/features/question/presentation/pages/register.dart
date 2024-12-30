import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/features/question/presentation/cubit/auth/auth_cubit.dart';
import 'package:question_app/features/question/presentation/pages/splash.dart';
import 'package:question_app/features/question/util/color.dart';
import 'package:question_app/features/question/util/padding.dart';
import 'package:question_app/features/question/util/style.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    const space = SizedBox(height: 20);

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColor().white,
        appBar: AppBar(title: const Text("Giriş")),
        body: Padding(
          padding: AppPadding.defaultPadding,
          child: Form(
            child: ListView(
              children: [
                textfield("Email", email),
                space,
                textfield("Password", password),
                space,
                ElevatedButton(
                  onPressed: () async {
                    await context
                        .read<AuthCubit>()
                        .register(email.text.trim(), password.text.trim());

                    if (!context.mounted) return;

                    _gotoSplash(context);
                  },
                  style: AppStyle().buttonStyle(context),
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return const Text("Kayıt Ol");
                    },
                  ),
                ),
                space,
                ElevatedButton(
                  onPressed: () async {
                    await context.read<AuthCubit>().login(email.text.trim(), password.text.trim());
                    if (!context.mounted) return;

                    _gotoSplash(context);
                  },
                  style: AppStyle().buttonStyle(context),
                  child: BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return const Text("Giriş Yap");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _gotoSplash(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  TextFormField textfield(String title, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: title,
        labelText: title,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
