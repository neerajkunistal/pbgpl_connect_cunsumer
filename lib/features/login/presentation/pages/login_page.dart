import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/login/domain/bloc/login_bloc.dart';
import 'package:customer_connect/features/login/domain/bloc/login_event.dart';
import 'package:customer_connect/features/login/domain/bloc/login_state.dart';
import 'package:customer_connect/features/otp/presentation/page/otp_page.dart';
import 'package:customer_connect/utills/commonClass/fade_route.dart';
import 'package:customer_connect/utills/commonWidgets/button_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/text_field_widget.dart';
import 'package:customer_connect/utills/commonWidgets/text_widget.dart';
import 'package:customer_connect/utills/login_customt_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => new _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).add(LoginPageLoadingEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginSubmitState) {
          return Center(
            child: _buildLayout(data: state),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }

  Widget _buildLayout({required LoginSubmitState data}) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: KenBurns(
              maxScale: 3,
              child: Image.asset(
                opacity: const AlwaysStoppedAnimation(.5),
                "assets/images/login_background.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 7.0,
                    shadowColor: Colors.teal,
                    color: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  _horizontalSpace(),
                                  logoWidget(),
                                  TextWidget("Purba Bharati Gas Pvt. Ltd",
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppFont.font_10,),
                                  _horizontalSpace(),
                                  TextWidget("Consumer",
                                    fontWeight: FontWeight.w700,
                                    fontSize: AppFont.font_13,),
                                ],
                              ),
                            ),
                          ),
                          _horizontalSpace(),
                          _bpNumberTextField(data: data),
                          _horizontalSpace(),
                          _passwordTextField(data: data),
                          _horizontalSpace(),
                          _forgetPassword(data: data),
                          _horizontalSpace(),
                          _loginButton(data: data),
                          _companyLogoWidget(),
                          _companyNameWidget(),
                          _horizontalSpace(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _horizontalSpace() {
    return SizedBox(height: 13);
  }

  Widget logoWidget() {
    return Image.asset('assets/images/logo.png',
      height: MediaQuery.of(context).size.width * 0.20,);
  }

  Widget _bpNumberTextField({required LoginSubmitState data}) {
    return TextFieldWidget(
      isRequired: true,
      prefixIcon: Icon(Icons.confirmation_number_outlined,
        size: 20,
        color: AppColor.themeSecondary,),
      textInputType: TextInputType.text,
      controller: data.bpNumberTextFiledController,
      labelText: "Mobile No / CR No / TR No",
      onChanged: (value) => BlocProvider.of<LoginBloc>(context)
          .add(LoginSetBpNumberEvent(bpNumber: value, context: context, isLoginPage: true)),
    );
  }

  Widget _passwordTextField({required LoginSubmitState data}) {
    return data.isPasswordField == false ?
    TextFieldWidget(
      isRequired: true,
      textInputType: TextInputType.text,
      prefixIcon: Icon(Icons.password,
        size: 20,
        color: AppColor.themeSecondary,),
      labelText: "Password",
      onChanged: (value) => BlocProvider.of<LoginBloc>(context)
          .add(LoginSetPasswordEvent(password: value)),
    ) : const SizedBox.shrink();
  }

  Widget _forgetPassword({required LoginSubmitState data}) {
    return data.isPasswordField == false ?
    data.isForgetPasswordLoader == false ?
    Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(LoginForgetPasswordEvent(context: context));
          }, child: TextWidget(
           "Forget Password",
          color: AppColor.themeColor,
         textDecoration: TextDecoration.underline,
         fontWeight: FontWeight.w700,
      )),
    ) : const DottedLoaderWidget() : const SizedBox.shrink();
  }

  Widget _loginButton({required LoginSubmitState data}) {
    return data.isLoader == false
        ? SizedBox(
         width: MediaQuery.of(context).size.width/1.6,
          child: ButtonWidget(
             text: "Login",
              height: MediaQuery.of(context).size.width * 0.13,
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(
                    LoginSubmitDataEvent(context: context, isLoginPage: true));
              },
            ),
        )
        : const DottedLoaderWidget();
  }

  Widget _companyNameWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset('assets/images/unistal.png')),
              ),
              Text("Powered By Unistal Systems Pvt.Ltd.")
            ],
          ),
        ),
      ),
    );
  }

  Widget _companyLogoWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Container(
            width: 200,
            height: 30,
            child: Image.asset('assets/images/smartgasnet.png')),
      ),
    );
  }
}
