import 'package:flutter/material.dart';
import 'package:splash_text_field/core/app_color/app_color.dart';

class InputTextField extends StatelessWidget {
  var controller;
  String hint;
  TextInputType keyType;
  bool isObscure;
  String? Function(String?)? validate;
  IconData? iconData;
  String lable;
  void Function()? onPressed;

  InputTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.keyType,
      required this.isObscure,
      required this.validate,
      required this.lable,
      required this.iconData,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(color: Colors.white),
        validator: validate,
        obscureText: isObscure,
        keyboardType: keyType,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            label: Text(lable),
            labelStyle: TextStyle(
                fontSize: 18, color: AppColor.colorYellow.withOpacity(.3)),
            suffixIcon: iconData == Icons.remove_red_eye_outlined
                ? IconButton(onPressed: onPressed, icon: Icon(iconData, size: 23,
              color: Colors.white.withOpacity(.8),))
                : Icon(
                    iconData,
                    size: 23,
                    color: Colors.white.withOpacity(.8),
                  ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide:
                    BorderSide(color: AppColor.colorYellow.withOpacity(.5))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide:
                    BorderSide(color: AppColor.colorYellow.withOpacity(.5))),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide:
                    BorderSide(color: AppColor.colorYellow.withOpacity(.5)))),
      ),
    );
  }
}
