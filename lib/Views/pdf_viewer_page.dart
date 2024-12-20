import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../utills/global_constant.dart';

class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key}) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? pdf;
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    localData();
  }

  localData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      pdf = pref.getString(GlobalConstants.pdf) ?? "";
      print("pdf---> " + pdf!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent.withOpacity(0.8),
      appBar: AppBar(
        title: Text("View Bill"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SfPdfViewer.network(
        //  'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
        'http://142.79.231.30:8086/customer/bill-invoice-app?schema=sonipat&ref_id=47f17ce1173a963100c815eb7053c2edc59034820de8c57e12638f71fe8719f05e5ceec8be36348bfcdb81b69e3f947e4c164362abe868a02e3ad57b36cb3f6eb25fffe309630fca28421654cce23d80c83b46',
        key: _pdfViewerKey,
      ),
    );
  }
}
