import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/changePassword/domain/bloc/change_password_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:flutter/material.dart';


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  @override
  void initState() {
    BlocProvider.of<ChangePasswordBloc>(context).add(PageLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        actionsIconTheme:
            const IconThemeData(size: 30.0, color: Colors.black, opacity: 10.0),
        title: TextWidget(
          "Change Password",
          fontSize: AppFont.font_16,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      body: BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        builder: (context, state) {
          if (state is ChangePageLoadingState) {
            return _itemBuilder(dataState: state);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required ChangePageLoadingState dataState}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _horizontalSpace(),
              logoWidget(),
              _horizontalSpace(),
              _oldPasswordTextField(dataState: dataState),
              _horizontalSpace(),
              _newPasswordTextField(dataState: dataState),
              _horizontalSpace(),
              _confirmPasswordTextField(dataState: dataState),
              _horizontalSpace(),
              _submit(dataState: dataState),
              _horizontalSpace(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Image.asset('assets/images/pbgpl_logo.png',
      height: MediaQuery.of(context).size.width * 0.20,);
  }

  Widget _oldPasswordTextField({required ChangePageLoadingState dataState}) {
    return TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.oldPassword,
      obscureText: dataState.isOldPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.oldPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<ChangePasswordBloc>(context).add(OldPasswordVisibility(
            isOldPasswordVisibility:
                dataState.isOldPasswordVisibility == true ? false : true));
      },
    );
  }

  Widget _newPasswordTextField({required ChangePageLoadingState dataState}) {
    return TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.newPassword,
      obscureText: dataState.isNewPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.newPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<ChangePasswordBloc>(context).add(NewPasswordVisibility(
            isNewPasswordVisibility:
                dataState.isNewPasswordVisibility == true ? false : true));
      },
    );
  }

  Widget _confirmPasswordTextField(
      {required ChangePageLoadingState dataState}) {
    return TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.confirmPassword,
      obscureText: dataState.isConfirmPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.confirmPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<ChangePasswordBloc>(context).add(
            ConfirmPasswordVisibility(
                isConfirmPasswordVisibility:
                    dataState.isConfirmPasswordVisibility == true
                        ? false
                        : true));
      },
    );
  }

  Widget _submit({required ChangePageLoadingState dataState}) {
    return dataState.isLoader == false
        ? ButtonWidget(
            text: AppString.submit,
            onPressed: () {
              BlocProvider.of<ChangePasswordBloc>(context)
                  .add(PasswordSubmitEvent(context: context));
            })
        : const DottedLoaderWidget();
  }

  _horizontalSpace() {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.07,
    );
  }
}
