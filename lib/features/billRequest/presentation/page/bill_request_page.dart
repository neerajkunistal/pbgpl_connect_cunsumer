import 'package:customer_connect/ExportFile/app_export_file.dart';
import 'package:customer_connect/features/billRequest/domain/bloc/bill_request_bloc.dart';
import 'package:flutter/material.dart';

class BillRequestPage extends StatefulWidget {
  const BillRequestPage({super.key});

  @override
  State<BillRequestPage> createState() => _BillRequestPageState();
}

class _BillRequestPageState extends State<BillRequestPage> {

  @override
  void initState() {
    BlocProvider.of<BillRequestBloc>(context)
        .add(BillRequestPageLoadEvent(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
