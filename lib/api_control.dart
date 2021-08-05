import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<Graduate>> fetchGraduates() async {
  var getCode = await FlutterBarcodeScanner.scanBarcode(
      "#009922", "Cancel", true, ScanMode.QR);
  var response = await http
      .get(Uri.parse('http://10.240.72.149:8000/graduates/api/$getCode'));
  Map<String, dynamic> data = jsonDecode(response.body);
  Graduate graduate = Graduate.fromJson(data);
  List<Graduate> graduates = [];
  print(graduate.id);
  graduates.add(graduate);
  return graduates;
}

class Graduate {
  final int id;
  final String title;
  final String thumbnailUrl;

  const Graduate({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });

  factory Graduate.fromJson(Map<String, dynamic> json) {
    return Graduate(
      id: json['id'] as int,
      title: json['student'] as String,
      thumbnailUrl: json['image'],
    );
  }

  List<Graduate> parseGraduates(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Graduate>((json) => Graduate.fromJson(json)).toList();
  }
}
