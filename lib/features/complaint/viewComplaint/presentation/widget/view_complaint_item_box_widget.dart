import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/model/complaint_model.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewComplaintItemBoxWidget extends StatelessWidget {
  final ComplaintModel complaintData;
  final int index;
  const ViewComplaintItemBoxWidget({super.key,
  required this.index,
  required this.complaintData,
  });

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(complaintData.dateOfComplaint.toString());

    DateTime attendanceDate = formatter.parse(complaintData.attendedDate.toString().isNotEmpty
        ? complaintData.attendedDate.toString()
        : DateTime.now().toString() );

    return Card(
      shadowColor: AppColor.themeColor,
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            _rowHeaderWidget(label: "Complaint No", value: complaintData.complainNo.toString()),
            _verticalSpace(context: context),
            DottedDividerLine(color: AppColor.grey,),
            _verticalSpace(context: context),
            _rowWidget(label: "Category", value: complaintData.category.toString()),
            _verticalSpace(context: context),
            _rowWidget(label: "Subcategory", value: complaintData.subcategory.toString()),
            _verticalSpace(context: context),
            _rowWidget(label: "Complaint Date", value: "${DateFormat('dd-MM-yyyy').format(dateTime)}"),
            _verticalSpace(context: context),
            _statusWidget(label: "Status",
                value: "${complaintData.currentStatus.toString() == "0" ? "In Progress"
                    : complaintData.currentStatus.toString() == "1" ? "Resolved"
                    : complaintData.currentStatus.toString() == "2" ? "Interim" : "" }",
              color: complaintData.currentStatus.toString() == "0" ? Colors.orange
                  : complaintData.currentStatus.toString() == "1" ? Colors.green
                  : complaintData.currentStatus.toString() == "2" ? Colors.red : Colors.grey
            ),
            _verticalSpace(context: context),
            _imageWidget(context: context, url: complaintData.attachedDoc.toString()),
            _verticalSpace(context: context),
            Divider(color: AppColor.grey,),
            _rowWidget(label: "Description", value: complaintData.remarks.toString()),
            _verticalSpace(context: context),

            complaintData.additionalComments.toString().isNotEmpty ?
            _verticalSpace(context: context) : const SizedBox.shrink(),
            complaintData.additionalComments.toString().isNotEmpty ?
            _rowWidget(label: "${complaintData.currentStatus.toString() == "1" ? "Resolution" : complaintData.currentStatus.toString() == "2" ? "Interim" : ""} Comment", value: complaintData.additionalComments.toString()) : const SizedBox.shrink(),
            complaintData.additionalComments.toString().isNotEmpty ?
            _verticalSpace(context: context) : const SizedBox.shrink(),

            complaintData.attendedDate.toString().isNotEmpty ?
            _verticalSpace(context: context) : const SizedBox.shrink(),
            complaintData.attendedDate.toString().isNotEmpty ?
            _rowWidget(label: "${complaintData.currentStatus.toString() == "1" ? "Resolved" : complaintData.currentStatus.toString() == "2" ? "Interim" : ""} On", value: "${DateFormat('dd-MM-yyyy').format(attendanceDate)}") : const SizedBox.shrink(),
            complaintData.attendedDate.toString().isNotEmpty ?
            _verticalSpace(context: context) : const SizedBox.shrink(),

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

  Widget _rowWidget({required String label, required String value, Color? color}) {
    return Row(
      children: [
        TextWidget("${label} : ", fontWeight: FontWeight.w500, fontSize: AppFont.font_12,),
        Expanded(child: TextWidget(value, fontWeight: FontWeight.w500, fontSize: AppFont.font_12, color: color, )),
      ],
    );
  }

  Widget _statusWidget({required String label, required String value, Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget("${label} : ", fontWeight: FontWeight.w500, fontSize: AppFont.font_12,),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: color,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
              child: TextWidget(value, fontWeight: FontWeight.w500, fontSize: AppFont.font_12, color: Colors.white, ),
            )),
      ],
    );
  }

  Widget _imageWidget({required BuildContext context, required String url}) {
    return url.isNotEmpty ?
    Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(url))) {
          throw Exception('Could not launch ${url}');
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(url,
          height: MediaQuery.of(context).size.width * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
          fit: BoxFit.fill,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),);
             }
          ),
        ),
      ),
    ) : const SizedBox.shrink();
  }
  
  Widget _verticalSpace({required BuildContext context}) {
     return SizedBox(
       height: MediaQuery.of(context).size.width * 0.01,
     );
  }
}
