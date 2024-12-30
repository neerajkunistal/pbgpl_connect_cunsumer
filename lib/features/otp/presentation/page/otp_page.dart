import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/otp/domain/domain/bloc/otp_bloc.dart';
import 'package:customer_connect/utills/Constants.dart';
import 'package:customer_connect/utills/commonWidgets/center_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:customer_connect/utills/commonWidgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  int numberOfFields = 6;
  Timer? _timer;

  @override
  void initState() {
    BlocProvider.of<OtpBloc>(context).add(
        OtpPageLoadEvent(context: context));
    startTimer();
    super.initState();
  }

  void startTimer() {
    int count = 30;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(timer.tick < 30){
        BlocProvider.of<OtpBloc>(context).add(OtpUpdateTimeEvent(count: count - _timer!.tick));
      } else {
        _timer!.cancel();
        BlocProvider.of<OtpBloc>(context).add(OtpUpdateTimeEvent(count: 0));
      }
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<OtpBloc, OtpState>(
        builder: (context, state) {
          if(state is FetchOtpDataState) {
            return _itemBuilder(dataState: state);
          } else {
            return const Center(child: CenterLoaderWidget());
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required FetchOtpDataState dataState}) {
    ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _logoWidget(),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.10,
            ),
            TextWidget(
              "Verification Code",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.02,
            ),
            TextWidget(
              "We texted you a code resistor number",
              textAlign: TextAlign.center,
              fontSize: AppFont.font_16,
              fontWeight: FontWeight.w700,
            ),
            TextWidget("Please enter it below",),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            OtpTextField(
              numberOfFields: numberOfFields,
              borderColor: AppColor.themeColor,
              focusedBorderColor: AppColor.themeSecondary,
              clearText: dataState.clearText,
              showFieldAsBox: true,
              textStyle: theme.textTheme.titleMedium,
              onCodeChanged: (String value) {
                List<String> value = [];
                for(var data in controls){
                  if(data!.text.toString().isNotEmpty){
                    value.add(data.text.toString());
                  }
                }
                String otp = "${value.toString().replaceAll("[", "").toString().replaceAll("]", "").replaceAll(",", "").replaceAll(" ", "")}";
                BlocProvider.of<OtpBloc>(context).add(
                    OtpValueEvent(otpValue: otp.toString()));
              },
              handleControllers: (controllers) {
                controls = controllers;
              },
              onSubmit: (String verificationCode) {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),

           dataState.isLoader == false ?
           dataState.isResendOtp == false ?
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    "Didn't get code?",
                    fontWeight: FontWeight.w700,
                  ),
                  dataState.timer.isEmpty ?
                  TextButton(
                    onPressed: () {
                    BlocProvider.of<OtpBloc>(context).add(OtpResendEvent(context: context));
                    if(_timer!.isActive == true){
                      _timer!.cancel();
                    }
                    startTimer();
                    BlocProvider.of<OtpBloc>(context).add(
                        OtpValueEvent(otpValue: ""));
                  },
                    child: TextWidget(
                    "Re-send",
                    fontSize: AppFont.font_16,
                    color: AppColor.themeColor,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w700,
                  ),) : TextWidget(" Wait.. "+dataState.timer)
                ],
              ),
            ) : const DottedLoaderWidget() : const SizedBox.shrink(),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            _newPasswordTextField(dataState: dataState),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.07,
            ),
            _confirmPasswordTextField(dataState: dataState),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.07,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            _submitButton(dataState: dataState),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Image.asset('assets/images/logo.png',
      height: MediaQuery.of(context).size.width * 0.20,);
  }

  Widget _newPasswordTextField({required FetchOtpDataState dataState}) {
    return dataState.isForgetPasswordPage == true ?
    TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.newPassword,
      obscureText: dataState.isNewPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.newPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<OtpBloc>(context).add(NewPasswordVisibility(
            isNewPasswordVisibility:
            dataState.isNewPasswordVisibility == true ? false : true));
      },
    ) : const SizedBox.shrink();
  }

  Widget _confirmPasswordTextField(
      {required FetchOtpDataState dataState}) {
    return dataState.isForgetPasswordPage == true ?
    TextFieldPasswordWidget(
      isRequired: true,
      labelText: AppString.confirmPassword,
      obscureText: dataState.isConfirmPasswordVisibility,
      isPasswordIcon: true,
      textEditingController: dataState.confirmPasswordController,
      passwordOnPressed: () {
        BlocProvider.of<OtpBloc>(context).add(
            ConfirmPasswordVisibility(
                isConfirmPasswordVisibility:
                dataState.isConfirmPasswordVisibility == true
                    ? false
                    : true));
      },
    ) : const SizedBox.shrink();
  }

  Widget _submitButton({required FetchOtpDataState dataState}) {
    return dataState.isResendOtp == false ?
    dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
        onPressed: () {
          BlocProvider.of<OtpBloc>(context).add(OtpSubmitEvent(context: context));
        }
    ) : const DottedLoaderWidget() : const SizedBox.shrink();
  }
}
