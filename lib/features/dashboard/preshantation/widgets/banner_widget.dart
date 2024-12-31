import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width/3.2,
      decoration: new BoxDecoration(
        //color: const Color(0xFF66BB6A),
        boxShadow: [new BoxShadow(
          color: Colors.black,
          blurRadius: 5.0,
        ),]),
      child: Image.asset(
        "assets/images/banner.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
