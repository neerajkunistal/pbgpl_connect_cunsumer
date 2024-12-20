import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeterNumber extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  final bool enabled;
  final TextInputAction textInputAction;
  final Color color;
  final ValueChanged onChanged;

  const MeterNumber(this.controller, this.autoFocus, this.enabled,
      this.textInputAction, this.onChanged, this.color,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 30,
      child: TextField(
        autofocus: autoFocus ?? false,
        enabled: enabled ?? false,
        controller: controller,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        textInputAction: textInputAction,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: color,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: color,
            )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide(
                  color: color,
                )),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 8.0)),
      ),
    );
  }
}
