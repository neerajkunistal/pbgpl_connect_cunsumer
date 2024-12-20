import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DottedLoaderWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  const DottedLoaderWidget({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    double loaderSize = size ?? MediaQuery.of(context).size.width * 0.12;
    return SpinKitThreeInOut(
      color: color ?? AppColor.themeSecondary,
      size: loaderSize,
    );
  }
}
