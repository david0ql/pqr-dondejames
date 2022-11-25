import 'package:flutter/material.dart';
import 'package:pqr_sistema/src/theme/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool? obscure;
  final TextEditingController textEditingController;
  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.icon,
      this.obscure,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          label: Text(label),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyTheme.primaryColor),
            borderRadius: BorderRadius.circular(15.0),
          ),
          filled: true,
          prefixIcon: icon,
          fillColor: Colors.white70,
        ),
      ),
    );
  }
}
