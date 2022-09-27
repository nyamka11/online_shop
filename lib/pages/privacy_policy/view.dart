// import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../../widgets/_common/layout_template.dart';

class PrivacyPolicyPdf extends StatefulWidget {
  PrivacyPolicyPdf({super.key});

  @override
  State<PrivacyPolicyPdf> createState() => _PrivacyPolicyPdfState();
}

class _PrivacyPolicyPdfState extends State<PrivacyPolicyPdf> {
  // String assetpdf = "assets/sample.pdf";
  // PdfDocument _document;

  // final pdfController = PdfController(
  //   document: PdfDocument.openAsset('/pdf/sample.pdf'),
  // );

  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('/pdf/privacyPolicy.pdf'),
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayoutTemplate(
      body: Container(
        width: 900,
        height: 1300,
        color: Color.fromARGB(255, 173, 169, 169),
        child: PdfViewPinch(
          controller: pdfPinchController,
        ),
      ),
    );
  }
}
