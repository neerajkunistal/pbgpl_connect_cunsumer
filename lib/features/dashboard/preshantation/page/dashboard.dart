import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/login/presentation/widget/logout_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context)
        .add(DashboardPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          children: [
            TextWidget("Purba Bharati",
              fontSize: AppFont.font_18,
              fontWeight: FontWeight.w700,
              color: AppColor.themeSecondary,),

/*            TextWidget("Purba Bharati",
              fontSize: AppFont.font_18,
              fontWeight: FontWeight.w700,
              color: AppColor.themeSecondary,),*/

          ],
        ),
        actions: [
          IconButton(
              onPressed: () =>  showModalBottomSheet(
                  context: context, builder: (context) => const LogoutWidget()),
              icon: Icon(Icons.settings_power,
            color: AppColor.white,))
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if(state is FetchDashboardDataState){
            return _widgetBuilder(dataState: state);
          } else {
            return Center(child: CenterLoaderWidget(),);
          }
        },
      ),
    );
  }
  Widget _bpNumberDropDown({required FetchDashboardDataState dataState}) {
    return Container(

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
