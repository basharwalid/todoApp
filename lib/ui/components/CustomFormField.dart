import 'package:flutter/material.dart';
typedef MyValidator = String? Function (String?);
class CustomFormField extends StatelessWidget {
  String label;
  bool ispassword;
  TextInputType keyboardtype;
  TextEditingController controller;
  MyValidator validator;
  CustomFormField({required this.label , this.ispassword = false , this.keyboardtype = TextInputType.text , required this.validator , required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: ispassword,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
          labelText: label
      ),
    );
  }
}
