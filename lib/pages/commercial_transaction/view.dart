// import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import '../../widgets/_common/layout_template.dart';

class CommercialTransactionPdf extends StatefulWidget {
  const CommercialTransactionPdf({super.key});

  @override
  State<CommercialTransactionPdf> createState() =>
      _CommercialTransactionPdfState();
}

class _CommercialTransactionPdfState extends State<CommercialTransactionPdf> {
  final pdfPinchController = PdfControllerPinch(
    document: PdfDocument.openAsset('/pdf/commercialTransaction.pdf'),
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
        color: const Color.fromARGB(255, 173, 169, 169),
        child: PdfViewPinch(
          controller: pdfPinchController,
        ),
      ),
    );
  }
}
