import 'package:customer_connect/utills/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constants.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final  FormFieldValidator<String>? validator;
  final String?  labelText;
  const PasswordTextField({Key? key, this.controller, this.isPassword,this.validator,this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        color: Colors.white,
        child: Theme(
          data: new ThemeData(
              primaryColor: greyColor,
              hintColor: Colors.green, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange)),
          child: TextFormField(
            validator: validator,
            keyboardType: TextInputType.streetAddress,
            controller: controller,

            obscureText: null == isPassword ? false : true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              labelStyle: listItemSubTitleStyle.copyWith(fontSize: 16, color: Colors.black87),
              border: new OutlineInputBorder(
                borderSide:new BorderSide(color: Colors.white),
                borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
              ),
              labelText:  labelText,
            ),
          ),
        ),
      ),
    );
  }
}
