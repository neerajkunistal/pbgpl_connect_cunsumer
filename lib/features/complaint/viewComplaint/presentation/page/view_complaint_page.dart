import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/bloc/view_complaint_bloc.dart';
import 'package:customer_connect/features/complaint/viewComplaint/presentation/widget/view_complaint_item_box_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:flutter/material.dart';

class ViewComplaintPage extends StatefulWidget {
  const ViewComplaintPage({super.key});

  @override
  State<ViewComplaintPage> createState() => _ViewComplaintPageState();
}

class _ViewComplaintPageState extends State<ViewComplaintPage> {

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    BlocProvider.of<ViewComplaintBloc>(context)
        .add(ViewComplaintPageLoadEvent(context: context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.complaint,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<ViewComplaintBloc, ViewComplaintState>(
        builder: (context, state) {
          if(state is FetchViewComplaintDataState) {
            return Container(
                margin: EdgeInsets.all(10.0),
                child: _listBuilder(dataState: state));
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _listBuilder({required FetchViewComplaintDataState dataState}) {
    return dataState.complaintList.isNotEmpty ?
    ListView.builder(
        itemCount: dataState.complaintList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return ViewComplaintItemBoxWidget(
          complaintData: dataState.complaintList[index],
          index: index,
        );
    }) : const Center(child: TextWidget("No Complaint Data"),);
  }

}
