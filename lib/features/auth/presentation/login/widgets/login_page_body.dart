import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/widgets/custom_buttons.dart';
import 'package:e_commerce/features/auth/firebase/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../../users/admin/presentation/admin_page_view.dart';
import '../../../../users/end_user/home/presentation/home_view.dart';
import '../../register/register_page_view.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});
  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isSeen = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Image.asset(
                      KlogoImage,
                      height: SizeConfig.defultSize! * 15,
                    ),
                    const VerticalSpace(1),
                    const Center(
                      child: Text(
                        'Fruit Market',
                        style: TextStyle(
                          color: KMC,
                          fontSize: 47,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const VerticalSpace(1),
                    CustomTextFormField(
                      emailController: emailController,
                      obscureText: false,
                      labelTitle: "Email",
                    ),
                    const VerticalSpace(1.5),
                    CustomTextFormField(
                      emailController: passwordController,
                      obscureText: isSeen,
                      labelTitle: "Password",
                      onTapIcon: () {
                        isSeen = !isSeen;
                        setState(() {});
                      },
                      suffixIconData: isSeen == true
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                    ),
                    const VerticalSpace(3),
                    CustomGeneralButton(
                      buttonTitle: "Login",
                      onTap: () {
                        validate(context);
                      },
                    ),
                    const VerticalSpace(1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account"),
                        TextButton(
                          onPressed: () {
                            Get.to(() => const RegisterPageView());
                          },
                          child: const Text("Register"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: CustomGeneralButtonWithIcon(
                                buttonTitle: "Log In with",
                                onTap: () async {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  await signInWithGoogle();
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Get.to(() => const HomePageView(),
                                      transition: Transition.zoom,
                                      duration:
                                          const Duration(milliseconds: 600));
                                  // fackeGoogleAccountToTest: testg6408     testg6408testg6408
                                },
                                imagePath: "assets/images/googleIcon.png"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLoading)
          Container(
            color: const Color.fromARGB(152, 0, 0, 0),
            child: const Center(
              child: CircularProgressIndicator(color: KMC),
            ),
          ),
      ],
    );
  }

  void validate(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      await FirebaseFirestore.instance
          .collection("admin")
          .doc("adminLogin")
          .snapshots()
          .forEach((element) async {
        if (element.data()?['adminEmail'] == emailController.text &&
            element.data()?['adminPassword'] == passwordController.text) {
          Get.to(() => const AdminPageView());
          setState(() {
            isLoading = false;
          });
        } else {
          setState(() {
            isLoading = true;
          });
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
            Get.to(() => const HomePageView());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("No user found for that email.")));
            } else if (e.code == 'wrong-password') {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Wrong password provided for that user.")));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.toString())));
            }
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        }
      });
    }
  }
}
