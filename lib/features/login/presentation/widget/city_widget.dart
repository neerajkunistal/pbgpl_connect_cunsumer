
import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/login/domain/model/ga_model.dart';
import 'package:flutter/material.dart';

Future <dynamic> showCitySheet({required BuildContext context,
  required List<GaModel> list}) async {
  return await showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    enableDrag: true,
    builder: (_) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextWidget("${list[index].city}",
                      textAlign: TextAlign.center,
                      color: AppColor.themeColor, fontWeight: FontWeight.w700,),
                  )),
            );
        }),
      );
    },
  );
}