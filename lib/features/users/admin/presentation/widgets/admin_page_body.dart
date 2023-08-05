import 'package:e_commerce/core/widgets/custom_buttons.dart';
import 'package:e_commerce/core/widgets/space_widget.dart';
import 'package:e_commerce/features/users/admin/presentation/widgets/product/add_product.dart';
import 'package:e_commerce/features/users/admin/presentation/widgets/product/manage_product.dart';
import 'package:e_commerce/features/users/end_user/home/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants.dart';

class AdminPageBody extends StatelessWidget {
  const AdminPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: KMC,
          title: const Text(
            "Admin",
            style: TextStyle(
              color: KWC,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomGeneralButton(
                  buttonTitle: "Add Product",
                  onTap: () {
                    Get.to(() => const AddProduct());
                  }),
              const VerticalSpace(2.5),
              CustomGeneralButton(
                  buttonTitle: "Edit Product",
                  onTap: () {
                    Get.to(() => const ManageProduct());
                  }),
              const VerticalSpace(2.5),
              CustomGeneralButton(
                buttonTitle: "Go to User Page",
                onTap: () {
                  Get.to(() => const HomePageView());
                },
              ),
            ]),
      ),
    );
  }
}
