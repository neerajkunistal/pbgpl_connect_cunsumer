import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/customer_care_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/users_widget.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/presentation/widget/logout_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/drawer_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:customer_connect/utills/res/app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context)
        .add(DashboardUserPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.themeSecondary),
        elevation: 0,
        title:TextWidget("Consumer Connect",
          fontSize: AppFont.font_16,
          fontWeight: FontWeight.w700,
          color: AppColor.themeSecondary,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                customerCareWidget(context: context);
              },
              child: Image.asset(
                AppIcon.callIcon,
                height: MediaQuery.of(context).size.width * 0.08,
              //  color: AppColor.themeSecondary,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if(state is FetchDashboardDataState){
            return _widgetBuilder(dataState: state);
          } else if(state is DashboardUsersPageState) {
            return UserWidget(dataState: state);
          } else {
            return Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }

  Widget _widgetBuilder({required FetchDashboardDataState dataState}) {
    return ListView.builder(
        itemCount: dataState.widgetList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return dataState.widgetList[index];
    });
  }


}
