import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/dashboard/preshantation/page/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final DashboardUsersPageState dataState;
  const UserWidget({super.key,
  required this.dataState
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
                itemCount: dataState.userList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width / 2.3,
                    child: InkWell(
                      onTap: () {
                        BlocProvider.of<DashboardBloc>(context)
                            .add(DashboardSelectUserEvent(userData: dataState.userList[index], context: context));
                        BlocProvider.of<DashboardBloc>(context)
                            .add(DashboardPageLoadEvent(context: context));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 2),
                                color: AppColor.grey.withOpacity(0.8),
                                blurRadius: 5)
                          ],
                          color: AppColor.themeColor.withOpacity(0.8),
                          image: DecorationImage(
                            image:
                            AssetImage("assets/images/card_background.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                "${dataState.userList[index].trNumber.toString()}",
                                color: AppColor.white,
                                fontSize: AppFont.font_16,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.02,
                              ),
                              TextWidget(
                                "${dataState.userList[index].address.toString()} ${dataState.userList[index].area.toString()} "
                                    "${dataState.userList[index].locality.toString()} ${dataState.userList[index].town.toString()}",
                                color: AppColor.white,
                                textAlign: TextAlign.center,
                                fontSize: AppFont.font_16,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
             }),
            _addNewConnection(context: context),
          ],
        ),
      ),
    );
  }

  Widget _addNewConnection({required BuildContext context}) {
      return Padding(
        padding: EdgeInsets.all(
          8.0,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.width / 2.3,
          child: InkWell(
            onTap: () {

            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      color: AppColor.grey.withOpacity(0.8),
                      blurRadius: 5)
                ],
                color: AppColor.themeColor.withOpacity(0.8),
                image: DecorationImage(
                  image:
                  AssetImage("assets/images/card_background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      "Add New Connection",
                      color: AppColor.white,
                      fontSize: AppFont.font_16,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
