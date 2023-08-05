import 'package:e_commerce/features/auth/presentation/login/widgets/login_page_body.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPageBody(),
    );
  }
}
