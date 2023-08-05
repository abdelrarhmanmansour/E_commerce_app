import 'package:e_commerce/core/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.emailController,
    required this.labelTitle,
    this.suffixIconData,
    this.onTapIcon,
    required this.obscureText,
  });
  final TextEditingController? emailController;

  final String? labelTitle;
  final IconData? suffixIconData;
  final VoidCallback? onTapIcon;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "$labelTitle must not be empty!";
        } else if (value.length < 6) {
          return "$labelTitle is not valid!";
        } else {
          return null;
        }
      },
      controller: emailController!,
      keyboardType: labelTitle == "Email"
          ? TextInputType.emailAddress
          : TextInputType.visiblePassword,
      obscureText: obscureText!,
      decoration: InputDecoration(
          hintText: "Enter Your $labelTitle",
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: KMC),
          ),
          hintStyle: const TextStyle(color: KMC),
          prefixIcon: labelTitle == "Email"
              ? const Icon(
                  Icons.email,
                  color: KMC,
                )
              : const Icon(
                  Icons.lock,
                  color: KMC,
                ),
          suffixIcon: IconButton(
              onPressed: onTapIcon,
              icon: Icon(
                suffixIconData,
                color: KMC,
              )),
          labelText: labelTitle,
          labelStyle: const TextStyle(
            color: KMC,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
