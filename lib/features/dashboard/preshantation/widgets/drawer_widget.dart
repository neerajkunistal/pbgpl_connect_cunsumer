import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/changePassword/presentation/pages/change_password_page.dart';
import 'package:customer_connect/features/connection/addConnection/presentation/page/add_connection_page.dart';
import 'package:customer_connect/features/dashboard/domain/bloc/dashboard_bloc.dart';
import 'package:customer_connect/features/login/domain/model/login_model.dart';
import 'package:customer_connect/features/login/presentation/widget/logout_widget.dart';
import 'package:customer_connect/features/profile/presentation/page/profile_page.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:customer_connect/utills/commonWidgets/dropdown_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      width: MediaQuery.of(context).size.width/1.7,
      child: _itemBuilder(context: context),
    );
  }

  Widget _itemBuilder({required BuildContext context}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          logoWidget(context: context),


          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if(state is FetchDashboardDataState){
                return Column(
                  children: [
                    _bpNumberDropDown(dataState: state, context: context),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),

          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if(state is FetchDashboardDataState){
                return Column(
                  children: [
                    Divider(color: AppColor.grey,),
                    _rowWidget(
                        context: context,
                        icon: Icons.person_pin,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              FadeRoute(
                                  page: const ProfilePage()));
                        }, label: "Profile"),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),

  /*        Divider(color: AppColor.grey,),
          _rowWidget(
              context: context,
              icon: Icons.account_tree_outlined,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  FadeRoute(
                      page: const AddConnectionPage()),
                );
              }, label: "Add new connection"),*/

          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if(state is FetchDashboardDataState){
                return Column(
                  children: [
                    Divider(color: AppColor.grey,),
                    _rowWidget(
                        context: context,
                        icon: Icons.person_pin,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                            context,
                            FadeRoute(
                                page: const ChangePasswordPage()),
                          );
                        }, label: "Change password"),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),

          Divider(color: AppColor.grey,),
          _rowWidget(
              context: context,
              icon: Icons.logout,
              onTap: () {
                Navigator.of(context).pop();
                showModalBottomSheet(
                    context: context, builder: (context) => const LogoutWidget());
              }, label: "Logout"),


        ],
      ),
    );
  }

  Widget logoWidget({required BuildContext context}) {
    return Image.asset('assets/images/pbgpl_logo.png',
      height: MediaQuery.of(context).size.width * 0.20,);
  }

  Widget _bpNumberDropDown(
      {required FetchDashboardDataState dataState, required BuildContext context}) {
    return dataState.userList.isNotEmpty && dataState.userList.length != 1 ?
    Column(
      children: [
        Divider(color: AppColor.grey,),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.02,
        ),
        DropdownWidget(
          isBoardRemove: true,
          dropdownValue: dataState.userData.id == null ? null : dataState.userData,
          isRequired: true,
          hint: "Switch Connection",
          items: dataState.userList
              .map<DropdownMenuItem<LoginModel>>((LoginModel userData)  {
            return DropdownMenuItem<LoginModel>(
              value: userData,
              child: TextWidget(userData.trNumber.toString()),
            );
          }).toList(),
          onChanged: (value) {
            Navigator.of(context).pop();
            BlocProvider.of<DashboardBloc>(context).add(DashboardSelectUserEvent(context: context,
                userData: value));
            BlocProvider.of<DashboardBloc>(context)
                .add(DashboardPageLoadEvent(context: context));
          },
        ),
      ],
    ) : const SizedBox.shrink();
  }


  Widget _rowWidget(
      {required BuildContext context,
        required GestureTapCallback onTap,
        required String label, required IconData icon}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: [
            Icon(icon,
              color: AppColor.themeSecondary, size: MediaQuery.of(context).size.width * 0.05,),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            TextWidget("${label}",
              fontSize: AppFont.font_12,
              color: AppColor.black,),
          ],
        ),
      ),
    );
  }


  Widget _horizontalSpace() {
    return SizedBox(height: 13);
  }
}
