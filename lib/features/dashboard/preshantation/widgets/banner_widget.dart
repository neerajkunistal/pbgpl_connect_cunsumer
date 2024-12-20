import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width/2.5,
      decoration: new BoxDecoration(
        color: const Color(0xFF66BB6A),
        boxShadow: [new BoxShadow(
          color: Colors.black,
          blurRadius: 10.0,
        ),]),
      child: KenBurns(
        maxScale: 5,
        child: Image.asset(
          "assets/images/banner.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
