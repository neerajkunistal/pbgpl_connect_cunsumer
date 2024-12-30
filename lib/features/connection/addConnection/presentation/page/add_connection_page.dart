import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/connection/addConnection/domain/bloc/add_connection_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:flutter/material.dart';

class AddConnectionPage extends StatefulWidget {
  const AddConnectionPage({super.key});

  @override
  State<AddConnectionPage> createState() => _AddConnectionPageState();
}

class _AddConnectionPageState extends State<AddConnectionPage> {

  @override
  void initState() {
    BlocProvider.of<AddConnectionBloc>(context).add(
        AddConnectionPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColor.themeSecondary
        ),
        title: TextWidget(
          AppString.newConnection,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<AddConnectionBloc, AddConnectionState>(
        builder: (context, state) {
          if(state is FetchAddConnectionDataState) {
            return Container();
          } else {
            return const Center(child:CenterLoaderWidget());
          }
        },
      ),
    );
  }
}
