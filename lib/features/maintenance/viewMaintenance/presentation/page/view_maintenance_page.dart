import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/domain/bloc/add_maintenance_bloc.dart';
import 'package:customer_connect/features/maintenance/addMaintenance/presentation/page/add_maintenance_page.dart';
import 'package:customer_connect/features/maintenance/viewMaintenance/domain/bloc/view_maintenance_bloc.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:flutter/material.dart';

class ViewMaintenancePage extends StatefulWidget {
  const ViewMaintenancePage({super.key});

  @override
  State<ViewMaintenancePage> createState() => _ViewMaintenancePageState();
}

class _ViewMaintenancePageState extends State<ViewMaintenancePage> {

  @override
  void initState() {
    BlocProvider.of<ViewMaintenanceBloc>(context)
        .add(ViewMaintenancePageLoadEvent(context: context));
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
          AppString.maintenance,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
        actions: [
          IconButton(onPressed: () {
            BlocProvider.of<AddMaintenanceBloc>(context)
                .add(AddMaintenancePageLoadEvent(context: context));
            Navigator.push(
              context,
              FadeRoute(
                  page: const AddMaintenancePage()),
            );

          }, icon: Icon(Icons.add, color:  AppColor.themeSecondary,),
          ),
        ],
      ),
      body: Container(),
    );
  }

}
