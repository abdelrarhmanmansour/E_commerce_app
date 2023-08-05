import 'package:e_commerce/features/users/admin/presentation/widgets/admin_page_body.dart';
import 'package:flutter/material.dart';

class AdminPageView extends StatelessWidget {
  const AdminPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdminPageBody(),
    );
  }
}
