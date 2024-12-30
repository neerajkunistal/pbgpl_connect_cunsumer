import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/forgetPassword/domain/bloc/forget_password_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  @override
  void initState() {
    BlocProvider.of<ForgetPasswordBloc>(context).add(ForgetPasswordPageLoadEvent(context: context));
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
          "Reset Password",
          fontSize: AppFont.font_16,
          fontWeight: FontWeight.w700,
          color: AppColor.white,
        ),
      ),
      body: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
        builder: (context, state) {
          if (state is FetchForgetPasswordDataState) {
            return _itemBuilder(dataState: state);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required FetchForgetPasswordDataState dataState}) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _horizontalSpace(),
              logoWidget(),
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
    return Image.asset('assets/images/logo.png',
      height: MediaQuery.of(context).size.width * 0.20,);
  }


  Widget _newPasswordTextField({required FetchForgetPasswordDataState dataState}) {
    return TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.newPassword,
      obscureText: dataState.isNewPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.newPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<ForgetPasswordBloc>(context).add(NewPasswordVisibility(
            isNewPasswordVisibility:
            dataState.isNewPasswordVisibility == true ? false : true));
      },
    );
  }

  Widget _confirmPasswordTextField(
      {required FetchForgetPasswordDataState dataState}) {
    return TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.confirmPassword,
      obscureText: dataState.isConfirmPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.confirmPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<ForgetPasswordBloc>(context).add(
            ConfirmPasswordVisibility(
                isConfirmPasswordVisibility:
                dataState.isConfirmPasswordVisibility == true
                    ? false
                    : true));
      },
    );
  }

  Widget _submit({required FetchForgetPasswordDataState dataState}) {
    return dataState.isLoader == false
        ? ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<ForgetPasswordBloc>(context)
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
