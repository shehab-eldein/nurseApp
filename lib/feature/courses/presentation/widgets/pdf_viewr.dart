import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:nurse_space/core/widgets/loader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfViewerPage extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerPage({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? _localFilePath;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  Future<void> _initPdf() async {
    final response = await http.get(Uri.parse("https://app.nurse-space.com/storage/29/660abf50e925d_sample.pdf"));
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/sample.pdf');
    await file.writeAsBytes(response.bodyBytes);
    if (mounted) {
      setState(() {
        _localFilePath = file.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),

      ),
      body: _localFilePath != null
          ? PDFView(

        filePath: _localFilePath!,
      )
          : const Center(child: Loader()),
    );
  }
}
