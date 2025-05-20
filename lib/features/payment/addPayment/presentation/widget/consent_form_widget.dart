import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ConsentFormWidget extends StatefulWidget {
  final String url;

  const ConsentFormWidget({super.key, required this.url});

  @override
  State<ConsentFormWidget> createState() => _ConsentFormWidgetState();
}

class _ConsentFormWidgetState extends State<ConsentFormWidget> {
  String? localPath;
  bool isLoading = true;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _loadPdfFromUrl();
  }

  Future<void> _loadPdfFromUrl() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      final bytes = response.bodyBytes;

      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/temp.pdf");
      await file.writeAsBytes(bytes, flush: true);

      setState(() {
        localPath = file.path;
        isLoading = false;
      });
    } catch (e) {
      print("Error loading PDF: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 580,
        width: 360,
        child: Column(
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),

            // PDF Viewer
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : localPath != null
                  ? PDFView(
                filePath: localPath!,
                autoSpacing: true,
                swipeHorizontal: false,
              )
                  : const Center(child: Text("Failed to load PDF")),
            ),

            // Checkbox
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text("I agree to the terms and conditions."),
                  ),
                ],
              ),
            ),

            // Confirm Button
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: ElevatedButton(
                onPressed: isChecked
                    ? () {
                  // Do something on confirm
                  Navigator.of(context).pop(true); // return true if accepted
                }
                    : null, // disabled when not checked
                child: const Text("Confirm"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
