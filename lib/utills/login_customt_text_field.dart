import 'package:flutter/material.dart';

import 'Constants.dart';

class UserTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final String? labelText;
  final int? maxLength;
  final bool? obscureText;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;

  const UserTextField({
    Key? key,
    this.controller,
    this.validator,
    this.labelText,
    this.maxLength,
    this.suffixIcon,
    this.obscureText,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        obscureText: obscureText ?? false,
        validator: validator,
        keyboardType: keyboardType,
        controller: controller,
        maxLength: maxLength,
        onSaved: onSaved,
        onChanged: onChanged,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          labelStyle: listItemSubTitleStyle.copyWith(
              fontSize: 16, color: Colors.black87),
          border: new OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          ),
          labelText: labelText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
