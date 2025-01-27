import 'dart:convert';

import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/customer_care_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/drawer_widget.dart';
import 'package:customer_connect/features/dashboard/preshantation/widgets/users_widget.dart';
import 'package:customer_connect/utills/commonWidgets/app_update_message_widget.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/res/app_icon.dart';
import 'package:customer_connect/utills/res/version_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  static const MethodChannel platform =
  MethodChannel('pbgpl/consumerConnect');

  callMethodeChannel() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      String applicationId = packageInfo.packageName.toString();
      String androidPlayStoreUrl =
          "https://play.google.com/store/apps/details?id=${applicationId}&hl=en&gl=US";
      if (Platform.isAndroid) {
        final dynamic result = await platform.invokeMethod('getAppUpdate');
        if (kDebugMode) {
          print("Upadet Mesagae ============== $result");
        }
        if (result.toString() == "success") {
          AppUpdateMessage.showAlertDialog(
              context: context, url: androidPlayStoreUrl);
        }
      } else if (Platform.isIOS) {
        // iOS-specific code
        PackageInfo packageInfo = await PackageInfo.fromPlatform();
        VersionStatus versionStatus =
        VersionStatus(localVersion: packageInfo.version);
        final id = packageInfo.packageName;
        VersionStatus versionStatus0 =
        await getIosStoreVersion(id: id, versionStatus: versionStatus);
        if (versionStatus0.storeVersion != null &&
            versionStatus0.storeVersion != versionStatus0.localVersion) {
          AppUpdateMessage.showAlertDialog(
              context: context, url: versionStatus0.appStoreLink.toString());
        }
      }
    } on PlatformException catch (_) {}
}

  getIosStoreVersion(
      {required String id, required VersionStatus versionStatus}) async {
    try {
      final url = "https://itunes.apple.com/lookup?bundleId=$id";
      var response = await get(Uri.parse(url));
      if (response.statusCode != 200) {
        return null;
      } else {
        final jsonObj = json.decode(response.body);
        versionStatus.storeVersion = jsonObj['results'][0]['version'];
        versionStatus.appStoreLink = jsonObj['results'][0]['trackViewUrl'];
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return versionStatus;
  }

  @override
  void initState() {
    BlocProvider.of<DashboardBloc>(context)
        .add(DashboardUserPageLoadEvent(context: context));
    callMethodeChannel();
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
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if(state is FetchDashboardDataState){
                return Padding(
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
                );
              }  else {
                return const SizedBox.shrink();
              }
            },
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
