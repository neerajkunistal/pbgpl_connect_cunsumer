import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CenterLoaderWidget extends StatelessWidget {
  const CenterLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double size =  MediaQuery.of(context).size.width * 0.10;
    return Center(
      child: SpinKitFadingCube(
        color: const Color(0xFFFFC107),
        size: size,
      ),
    );
  }
}
