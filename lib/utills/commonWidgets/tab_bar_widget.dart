import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {

  final TabController? controller;
  final Decoration? decoration;
  final List<Widget> tabs;
  final ValueChanged<int>? onTap;

  const TabBarWidget({super.key,
  required this.tabs,
  this.controller,
  this.decoration,
  this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      height: 40,
      child: TabBar(
        controller: controller,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: Colors.transparent,
        indicator:  decoration ?? BoxDecoration(
          color: AppColor.themeColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black54,
        tabs:  tabs,
        onTap: onTap,
      ),);
  }
}
