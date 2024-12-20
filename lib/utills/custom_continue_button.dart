import 'package:flutter/material.dart';

class CustomContinueButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomContinueButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                "CONTINUE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            )),
      ),
    );
  }
}
