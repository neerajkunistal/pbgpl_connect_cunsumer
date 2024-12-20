import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/complaint/viewComplaint/domain/bloc/view_complaint_bloc.dart';
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
    BlocProvider.of<ViewComplaintBloc>(context)
        .add(ViewComplaintPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ViewComplaintBloc, ViewComplaintState>(
        builder: (context, state) {
          if(state is FetchViewComplaintDataState) {
            return _listBuilder(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _listBuilder({required FetchViewComplaintDataState dataState}) {
    return ListView.builder(
        itemCount: dataState.complaintList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return Container();
    });
  }

}
