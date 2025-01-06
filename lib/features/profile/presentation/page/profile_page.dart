import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/profile/domain/bloc/profile_bloc.dart';
import 'package:customer_connect/utills/commonWidgets/dotted_loader_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  void initState() {
    BlocProvider.of<ProfileBloc>(context).add(ProfilePageLoadEvent(context: context));
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
          AppString.profile,
          color: AppColor.themeSecondary,
          fontWeight: FontWeight.w600,
          fontSize: AppFont.font_16,
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state is FetchProfileDataState) {
            return _itemBuilder(dataState: state);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _itemBuilder({required FetchProfileDataState dataState}) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    DateTime dateTime = formatter.parse(dataState.customerData.dateOfRegistration.toString());
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _verticalSpace(),
            _rowWidget(label: "Full Name",
                value: "${dataState.customerData.firstName.toString()} ${dataState.customerData.lastName.toString()}"),
            _verticalSpace(),
            _rowWidget(label: "Email Id",
                value: "${dataState.customerData.emailId.toString()}"),

            _verticalSpace(),
            _mobileNUmberController(dataState: dataState),

            _verticalSpace(),
            _rowWidget(label: "BP Number",
                value: "${dataState.customerData.bpNumber.toString()}"),

            _verticalSpace(),
            _rowWidget(label: "TR Number",
                value: "${dataState.customerData.trNumber.toString()}"),

            _verticalSpace(),
            _rowWidget(label: "CR Number",
                value: "${dataState.customerData.crn.toString()}"),

            _verticalSpace(),
            _rowWidget(label: "Scheme Name",
                value: "${dataState.customerData.schemeName.toString()}"),

            _verticalSpace(),
            _rowWidget(label: "Scheme Amount",
                value: "${dataState.customerData.initialAmount.toString()}"),

            _verticalSpace(),
            _rowWidget(label: "Registration Date",
                value: "${DateFormat('dd-MM-yyyy').format(dateTime)}"),

            _verticalSpace(),
            _addressRowWidget(label: "Address 1",
                value: "${dataState.customerData.address1.toString()} ${dataState.customerData.locality.toString()}"),

            _verticalSpace(),
            _addressRowWidget(label: "Address 2",
                value: "${dataState.customerData.address2.toString()}"),

            _verticalSpace(),
            _verticalSpace(),
            dataState.isProfileEdit == true ?
            _submitButton(dataState: dataState)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _mobileNUmberController({required FetchProfileDataState dataState}) {
    print(dataState.isProfileEdit);
    return TextFieldWidget(
         isRequired: true,
          enabled: dataState.isProfileEdit,
          isFilledColor: dataState.isProfileEdit == true ? false : true,
          labelText: "Mobile No.",
          controller: dataState.mobileNumberController,
           suffixIcon: IconButton(
           onPressed: () {
             BlocProvider.of<ProfileBloc>(context).add(ProfileProfileEditEvent(context: context));
           },
           icon: Icon(Icons.edit, color: AppColor.themeSecondary),
         ),
         onTap: () {
           BlocProvider.of<ProfileBloc>(context).add(ProfileProfileEditEvent(context: context));
         },
    );
  }
  
  Widget _rowWidget({required String label, required String value}) {
    TextEditingController controller =  TextEditingController();
    controller.text =  value.toString();
    return TextFieldWidget(
      enabled: false,
      isFilledColor: true,
      labelText: label,
      controller: controller,
    );
  }


  Widget _addressRowWidget({required String label, required String value}) {
    TextEditingController controller =  TextEditingController();
    controller.text =  value.toString();
    return TextFieldWidget(
      enabled: false,
      isFilledColor: true,
      maxLine: 3,
      labelText: label,
      controller: controller,
    );
  }

  Widget _submitButton({required FetchProfileDataState dataState}) {
    return dataState.isLoader == false ?
    ButtonWidget(
        text: AppString.submit,
         onPressed: () {
            BlocProvider.of<ProfileBloc>(context).add(ProfileSubmitEvent(context: context));
         }
    ) : const DottedLoaderWidget();
  }

  Widget _verticalSpace()  {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.05,
    );
  }
}
