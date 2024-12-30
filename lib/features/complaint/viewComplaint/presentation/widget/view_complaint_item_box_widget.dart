import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/model/complaint_model.dart';
import 'package:flutter/material.dart';

class ViewComplaintItemBoxWidget extends StatelessWidget {
  final ComplaintModel complaintData;
  final int index;
  const ViewComplaintItemBoxWidget({super.key,
  required this.index,
  required this.complaintData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColor.themeColor,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            _rowHeaderWidget(label: "Complaint No", value: complaintData.complainNo.toString()),
            Divider(color: AppColor.grey,),
            _rowWidget(label: "Category", value: complaintData.category.toString()),
            _verticalSpace(context: context),
            _rowWidget(label: "Subcategory", value: complaintData.subcategory.toString()),
            _verticalSpace(context: context),
            _rowWidget(label: "Complaint Date", value: complaintData.dateOfComplaint.toString()),
            _verticalSpace(context: context),
            _rowWidget(label: "Status", value: complaintData.status.toString()),
            Divider(color: AppColor.grey,),
            _rowWidget(label: "Description", value: complaintData.description.toString()),
            _verticalSpace(context: context),
          ],
        ),
      ),
    );
  }
  
  Widget _rowHeaderWidget({required String label, required String value}) {
    return Row(
      children: [
        TextWidget("${label} : ", fontWeight: FontWeight.w700,),
        Expanded(child: TextWidget(value, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _rowWidget({required String label, required String value}) {
    return Row(
      children: [
        TextWidget("${label} : ", fontWeight: FontWeight.w500, fontSize: AppFont.font_12,),
        Expanded(child: TextWidget(value, fontWeight: FontWeight.w500, fontSize: AppFont.font_12,)),
      ],
    );
  }
  
  Widget _verticalSpace({required BuildContext context}) {
     return SizedBox(
       height: MediaQuery.of(context).size.width * 0.01,
     );
  }
}
