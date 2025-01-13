import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownSearchWidget extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged<dynamic>? onChanged;
  final DropdownSearchItemAsString<dynamic>? itemAsString;
  final String hint;
  final dynamic selectedItem;
  final bool? isRequired;

  const DropDownSearchWidget({
    super.key,
    required this.items,
    this.onChanged,
    required this.itemAsString,
    required this.hint,
    this.selectedItem,
    this.isRequired,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: DropdownSearch<dynamic>(
        selectedItem: selectedItem,
        compareFn: (i, s) => i.isEqual(s),
        decoratorProps: DropDownDecoratorProps(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 1.10,
                  color: AppColor.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  width: 1.10,
                  color: AppColor.black),
            ),
            label: TextWidget(
              "$hint${isRequired == false ? "" : ' *'}",
              color: AppColor.themeColor, fontSize: AppFont.font_13,
            ),
            hintStyle: TextStyle(
                fontSize: AppFont.font_13, color: AppColor.themeColor),
            contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.018,
                left: MediaQuery.of(context).size.height * 0.01),
            hintText: hint,
            filled: false,
          ),
        ),
        items: (filter, infiniteScrollProps) => items,
        itemAsString: itemAsString,
        onChanged: onChanged,
        popupProps: PopupProps.dialog(
            searchFieldProps: TextFieldProps(
              style: TextStyle(fontSize: AppFont.font_13),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(fontSize: AppFont.font_13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
            showSearchBox: true,
            containerBuilder: (context, popupWidget) {
              return Column(
                children: [
                  Expanded(child: popupWidget),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.03),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.30,
                        child: ButtonWidget(
                          fontSize: AppFont.font_11,
                          height: MediaQuery.of(context).size.height * 0.038,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: AppString.cancel,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}







